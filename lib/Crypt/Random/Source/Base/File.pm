package Crypt::Random::Source::Base::File;
# ABSTRACT: File (or device) random data sources
$Crypt::Random::Source::Base::File::VERSION = '0.10';
use Any::Moose;

use Carp qw(croak);

extends qw(Crypt::Random::Source::Base::Handle);

use IO::File;
use namespace::autoclean;

has path => (
    is => "rw",
    required => 1,
);

sub open_handle {
    my ( $self, $mode ) = @_;

    my $file = $self->path;

    my $fh = IO::File->new;

    $fh->open($file, $mode || "r")
        or croak "open($file): $!";

    return $fh;
}

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source::Base::File - File (or device) random data sources

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Moose;
    extends qw(Crypt::Random::Source::Base::File);

    has '+path' => (
        default => "/foo/bar",
    );

=head1 DESCRIPTION

This is a base class for file (or file like) random data sources.

=head1 ATTRIBUTES

=head2 path

A required attribute, the path to the file to open.

=head1 METHODS

=head2 open_handle

Uses L<IO::File> to open C<path> for reading.

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__


# ex: set sw=4 et:
