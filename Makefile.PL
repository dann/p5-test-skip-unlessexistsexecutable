use inc::Module::Install;
name 'Test-ExistsExecutable';
all_from 'lib/Test/ExistsExecutable.pm';

requires( 'File::Which' => 1.09, );
build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
