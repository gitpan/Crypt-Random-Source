#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';

use ok 'Crypt::Random::Source::Weak::rand';

{
	my $p = Crypt::Random::Source::Weak::rand->new;

	my $buf = $p->get(1000);

	is( length($buf), 1000, "got 1000 bytes" );

	cmp_ok( $buf, "ne", $p->get(length($buf)), "not equal to more randomness" );
}

