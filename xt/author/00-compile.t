use 5.006;
use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.044

use Test::More 0.94 tests => 12 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'Crypt/Random/Source.pm',
    'Crypt/Random/Source/Base.pm',
    'Crypt/Random/Source/Base/File.pm',
    'Crypt/Random/Source/Base/Handle.pm',
    'Crypt/Random/Source/Base/Proc.pm',
    'Crypt/Random/Source/Base/RandomDevice.pm',
    'Crypt/Random/Source/Factory.pm',
    'Crypt/Random/Source/Strong.pm',
    'Crypt/Random/Source/Strong/devrandom.pm',
    'Crypt/Random/Source/Weak.pm',
    'Crypt/Random/Source/Weak/devurandom.pm',
    'Crypt/Random/Source/Weak/rand.pm'
);



# no fake home requested

my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};

BAIL_OUT("Compilation problems") if !Test::More->builder->is_passing;
