use strict;
use warnings;
use Test::More tests => 1;
use Test::Skip::UnlessExistsExecutable;

test_exists_executable '/bin/sh';
test_exists_executable 'perl';

ok 1;
