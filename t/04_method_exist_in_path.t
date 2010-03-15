use strict;
use warnings;
use Test::More tests => 1;
use Test::ExistsExecutable;

test_exists_executable '/bin/sh';

ok 1;
