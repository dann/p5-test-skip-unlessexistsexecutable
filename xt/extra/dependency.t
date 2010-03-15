use Test::Dependencies
    exclude => [qw/Test::Dependencies Test::Base Test::Perl::Critic Test::ExecutableRequires/],
    style   => 'light';
ok_dependencies();
