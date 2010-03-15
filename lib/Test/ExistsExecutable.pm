package Test::ExistsExecutable;
use strict;
use warnings;
our $VERSION = '0.01';
use base 'Test::Builder::Module';
use 5.008000;
use File::Spec;

use constant WIN32 => $^O eq 'MSWin32';

sub import {
    my $class  = shift;
    my $caller = caller(0);

    # export methods
    {
        no strict 'refs';
        *{"$caller\::test_exists_executable"} = \&test_exists_executable;
    }

    for my $executable (@_) {
        test_exists_executable($executable);
    }
}

sub test_exists_executable {
    my ($executable) = @_;
    my $found = _which($executable);

    unless ($found) {
        my $skip_all = sub {
            my $builder = __PACKAGE__->builder;

            if ( not defined $builder->has_plan ) {
                $builder->skip_all(@_);
            }
            elsif ( $builder->has_plan eq 'no_plan' ) {
                $builder->skip(@_);
                if ( $builder->can('parent') && $builder->parent ) {
                    die bless {} => 'Test::Builder::Exception';
                }
                exit 0;
            }
            else {
                for ( 1 .. $builder->has_plan ) {
                    $builder->skip(@_);
                }
                if ( $builder->can('parent') && $builder->parent ) {
                    die bless {} => 'Test::Builder::Exception';
                }
                exit 0;
            }
        };

        $skip_all->("The test requires '$executable' in PATH");
    }
}

sub _which {
    my ($path) = @_;

    my $quote = WIN32 ? q/"/ : q/'/;
    if ( -x $path ) {
        if ( $path =~ /\s/ && $path !~ /^$quote/ ) {
            $path = "$quote$path$quote";
        }
        return $path;
    }
    else {
        return;
    }
}

=encoding utf-8

=head1 NAME

Test::RequiresExecutable - test if executable exist

=head1 SYNOPSIS

    use Test::More tests => 1;
    use Test::ExistsExecutable qw( 
        /usr/bin/rsync  
    );
    use_ok 'Mouse';

    # or

    use strict;
    use warnings;
    use Test::More tests => 1;
    use Test::ExistsExecutable;

    test_exists_executable '/bin/sh';
    ok 1;

=head1 DESCRIPTION

Test::ExistsExecutable tests if executable exist

=head1 SOURCE AVAILABILITY

This source is in Github:

  http://github.com/dann/

=head1 AUTHOR

dann E<lt>techmemo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
