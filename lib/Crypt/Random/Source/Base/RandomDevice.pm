#!/usr/bin/perl

package Crypt::Random::Source::Base::RandomDevice;
use Squirrel;

extends qw(Crypt::Random::Source::Base::File);

sub rank { 100 } # good quality, pretty fast

has path => (
	builder => "default_path",
);

sub available {
	-r shift->default_path;
}

sub seed {
	my ( $self, @args ) = @_;

	my $fh = $self->open_handle("w+");

	print $fh @args;

	close $fh;
}

sub default_path {
	die "abstract";
}

__PACKAGE__

__END__

=pod

=head1 NAME

Crypt::Random::Source::Base::RandomDevice - Base class for random devices

=head1 SYNOPSIS

	use Squirrel;

	extends qw(Crypt::Random::Source::Base::RandomDevice);

	has '+path' => ( default => "/dev/myrandom" );

=head1 DESCRIPTION

This is a base class for random device sources.

See L<Crypt::Random::Source::Strong::devrandom> and
L<Crypt::Random::Source::Weak::devurandom> for actual implementations.

=cut

