package Crypt::Random::Source::Weak;
BEGIN {
  $Crypt::Random::Source::Weak::AUTHORITY = 'cpan:NUFFIN';
}
# ABSTRACT: Abstract base class for weak random data sources
$Crypt::Random::Source::Weak::VERSION = '0.08';
use Any::Moose;

sub is_strong { 0 }

1;

=pod

=encoding UTF-8

=head1 NAME

Crypt::Random::Source::Weak - Abstract base class for weak random data sources

=head1 VERSION

version 0.08

=head1 SYNOPSIS

    use Moose;

    extends qw(Crypt::Random::Source::Weak);

=head1 DESCRIPTION

This is an abstract base class. There isn't much to describe.

=head1 METHODS

=head2 is_strong

Returns false

=head1 AUTHOR

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Yuval Kogman.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__


# ex: set sw=4 et:
