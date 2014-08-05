use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.08

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Crypt/Random/Source.pm',
    'lib/Crypt/Random/Source/Base.pm',
    'lib/Crypt/Random/Source/Base/File.pm',
    'lib/Crypt/Random/Source/Base/Handle.pm',
    'lib/Crypt/Random/Source/Base/Proc.pm',
    'lib/Crypt/Random/Source/Base/RandomDevice.pm',
    'lib/Crypt/Random/Source/Factory.pm',
    'lib/Crypt/Random/Source/Strong.pm',
    'lib/Crypt/Random/Source/Strong/devrandom.pm',
    'lib/Crypt/Random/Source/Weak.pm',
    'lib/Crypt/Random/Source/Weak/devurandom.pm',
    'lib/Crypt/Random/Source/Weak/rand.pm',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/blocking.t',
    't/dev_random.t',
    't/factory.t',
    't/proc.t',
    't/rand.t',
    't/reread.t',
    't/sugar.t',
    'xt/author/00-compile.t',
    'xt/release/changes_has_content.t',
    'xt/release/cpan-changes.t',
    'xt/release/distmeta.t',
    'xt/release/eol.t',
    'xt/release/kwalitee.t',
    'xt/release/minimum-version.t',
    'xt/release/mojibake.t',
    'xt/release/no-tabs.t',
    'xt/release/pod-no404s.t',
    'xt/release/pod-syntax.t',
    'xt/release/portability.t'
);

notabs_ok($_) foreach @files;
done_testing;
