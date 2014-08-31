package Crypt::Random::Source::Weak::devurandom;
# ABSTRACT: A weak random data source using F</dev/urandom>
$Crypt::Random::Source::Weak::devurandom::VERSION = '0.10';
use Any::Moose;

extends qw(
    Crypt::Random::Source::Weak
    Crypt::Random::Source::Base::RandomDevice
);
use namespace::autoclean;

sub default_path { "/dev/urandom" }

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source::Weak::devurandom - A weak random data source using F</dev/urandom>

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Crypt::Random::Source::Weak::devurandom;

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__


# ex: set sw=4 et:
