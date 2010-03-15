use strict;
use warnings;
use Test::More tests => 10;
use Test::ExistsExecutable qw(
    /usr/bin/notfound
);

fail 'do not reach here';

