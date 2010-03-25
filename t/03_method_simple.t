use strict;
use warnings;
use Test::More tests => 10;
use Test::Skip::UnlessExistsExecutable;

test_exists_executable '/usr/bin/notfound';

fail 'do not reach here';
