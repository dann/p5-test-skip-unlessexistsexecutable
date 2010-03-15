use inc::Module::Install;
name 'Test-ExistsExecutable';
all_from 'lib/Test/ExistsExecutable.pm';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
