package Crypt::Random::Source::Strong::devrandom;
BEGIN {
  $Crypt::Random::Source::Strong::devrandom::AUTHORITY = 'cpan:NUFFIN';
}
# ABSTRACT: A strong random data source using F</dev/random>
$Crypt::Random::Source::Strong::devrandom::VERSION = '0.08';
use Any::Moose;

extends qw(
    Crypt::Random::Source::Strong
    Crypt::Random::Source::Base::RandomDevice
);


sub default_path { "/dev/random" }

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source::Strong::devrandom - A strong random data source using F</dev/random>

=head1 VERSION

version 0.08

=head1 SYNOPSIS

    use Crypt::Random::Source::Strong::devrandom;

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__


# ex: set sw=4 et:
