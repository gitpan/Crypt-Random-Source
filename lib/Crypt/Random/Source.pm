package Crypt::Random::Source;
# git description: v0.09-2-ga5f7c6a
$Crypt::Random::Source::VERSION = '0.10';
# ABSTRACT: Get weak or strong random data from pluggable sources

use strict;
use 5.008;
use warnings;

use Sub::Exporter -setup => {
    exports  => [qw(
        get get_weak get_strong
        factory
    )],
    groups => { default => [qw(get get_weak get_strong)] },
};

use Crypt::Random::Source::Factory;

our ( $factory, $weak, $strong, $any );

# silence some stupid destructor warnings
END { undef $weak; undef $strong; undef $any; undef $factory }

sub factory    ()    { $factory ||= Crypt::Random::Source::Factory->new }
sub _weak      ()    { $weak    ||= factory->get_weak }
sub _strong    ()    { $strong  ||= factory->get_strong }
sub _any       ()    { $any     ||= factory->get }

sub get        ($;@) {    _any->get(@_) }
sub get_weak   ($;@) {   _weak->get(@_) }
sub get_strong ($;@) { _strong->get(@_) }

# silence some stupid destructor warnings
END { undef $weak; undef $strong; undef $any; undef $factory }

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source - Get weak or strong random data from pluggable sources

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Crypt::Random::Source qw(get_strong);

    # get 10 cryptographically strong random bytes from an available source
    my $bytes = get_strong(10);

=head1 DESCRIPTION

This module provides implementations for a number of byte oriented sources of
random data.

See L<Crypt::Random::Source::Factory> for a more powerful way to locate
sources, and the various sources for specific implementations.

=head1 EXPORTS

=over 4

=item get

=item get_weak

=item get_strong

These functions delegate to a source chosen by an instance of
L<Crypt::Random::Source::Factory>, calling get

=back

=head1 SEE ALSO

L<Crypt::Random>, L<Crypt::Util>

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 CONTRIBUTORS

=for stopwords Karen Etheridge Florian Ragwitz David Pottage Max Kanat-Alexander

=over 4

=item *

Karen Etheridge <ether@cpan.org>

=item *

Florian Ragwitz <rafl@debian.org>

=item *

David Pottage <spudsoup@cpan.org>

=item *

Max Kanat-Alexander <mkanat@es-compy.(none)>

=back

=cut

__END__


# ex: set sw=4 et
