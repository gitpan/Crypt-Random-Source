package Crypt::Random::Source::Factory;
# ABSTRACT: Load and instantiate sources of random data
$Crypt::Random::Source::Factory::VERSION = '0.10';
use Any::Moose;
use Class::Load 'load_class';

use Carp qw(croak);

use Module::Find;
use namespace::autoclean;

sub get {
    my ( $self, %args ) = @_;

    my $type = delete $args{type} || "any";

    my $method = "new_$type";

    $self->can($method) or croak "Don't know how to create a source of type $type";

    $self->$method(%args);
}

sub get_weak {
    my ( $self, @args ) = @_;
    $self->get( @args, type => "weak" );
}

sub get_strong {
    my ( $self, @args ) = @_;
    $self->get( @args, type => "strong" );
}

has weak_source => (
    isa => "ClassName",
    is  => "rw",
    lazy_build => 1,
    clearer    => "clear_weak_source",
    handles    => { new_weak => "new" },
);

sub _build_weak_source {
    my $self = shift;
    $self->best_available(@{ $self->weak_sources });
}

has strong_source => (
    isa => "ClassName",
    is  => "rw",
    lazy_build => 1,
    clearer    => "clear_strong_source",
    handles    => { new_strong => "new" },
);

sub _build_strong_source {
    my $self = shift;
    $self->best_available(@{ $self->strong_sources });
}

has any_source => (
    isa => "ClassName",
    is  => "rw",
    lazy_build => 1,
    clearer    => "clear_any_source",
    handles    => { new_any => 'new' },
);

sub _build_any_source {
    my $self = shift;
    $self->weak_source || $self->strong_source;
}

has scan_inc => (
    is  => "ro",
    isa => "Bool",
    lazy_build => 1,
);

sub _build_scan_inc {
    my $self = shift;

    if ( exists $ENV{CRYPT_RANDOM_NOT_PLUGGABLE} ) {
        return !$ENV{CRYPT_RANDOM_NOT_PLUGGABLE};
    } else {
        return 1;
    }
}

has weak_sources => (
    isa => "ArrayRef[Str]",
    is  => "rw",
    lazy_build => 1,
);

sub _build_weak_sources {
    my $self = shift;

    if ( $self->scan_inc ) {
        $self->locate_sources("Weak");
    } else {
        return [qw(
            Crypt::Random::Source::Weak::devurandom
            Crypt::Random::Source::Weak::openssl
            Crypt::Random::Source::Weak::rand
        )];
    }
}

has strong_sources => (
    isa => "ArrayRef[Str]",
    is  => "rw",
    lazy_build => 1,
);

sub _build_strong_sources {
    my $self = shift;

    if ( $self->scan_inc ) {
        return $self->locate_sources("Strong");
    } else {
        return [qw(
            Crypt::Random::Source::Strong::devrandom
            Crypt::Random::Source::Strong::egd
        )];
    }
}

sub best_available {
    my ( $self, @sources ) = @_;

    my @available = grep { local $@; eval { Class::Load::load_class($_); $_->available }; } @sources;

    my @sorted = sort { $b->rank <=> $a->rank } @available;

    wantarray ? @sorted : $sorted[0];
}

sub first_available {
    my ( $self, @sources ) = @_;

    foreach my $class ( @sources ) {
        local $@;
        return $class if eval { Class::Load::load_class($class); $class->available };
    }
}

sub locate_sources {
    my ( $self, $category ) = @_;
    my @sources = findsubmod "Crypt::Random::Source::$category";
    # Untaint class names (which are tainted in taint mode because
    # they came from the disk).
    ($_) = $_ =~ /^(.*)$/ foreach @sources;
    return \@sources;
}

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source::Factory - Load and instantiate sources of random data

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Crypt::Random::Source::Factory;

    my $f = Crypt::Random::Source::Factory->new;

    my $strong = $f->get_strong;

    my $weak = $f->get_weak;

    my $any = $f->get;

=head1 DESCRIPTION

This class implements a loading and instantiation factory for
L<Crypt::Random::Source> objects.

If C<$ENV{CRYPT_RANDOM_NOT_PLUGGABLE}> is set then only a preset list of
sources will be tried. Otherwise L<Module::Find> will be used to locate any
installed sources, and use the first available one.

=head1 METHODS

=head2 get %args

Instantiate any random source, passing %args to the constructor.

The C<type> argument can be C<weak>, C<strong> or C<any>.

=head2 get_weak %args

=head2 get_strong %args

Instantiate a new weak or strong random source.

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__


# ex: set sw=4 et:
