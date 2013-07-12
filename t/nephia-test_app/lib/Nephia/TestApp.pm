package Nephia::TestApp;
use strict;
use warnings;
use Nephia;
use utf8;

our $VERSION = 0.04;

nephia_plugins 'Data::Validator';

use Mouse::Util::TypeConstraints;
enum 'Sex' => qw( male female shemale );

path '/validate' => sub {
    return validate (
        name => { isa => 'Str' },
        age => { isa => 'Int', default => 72 },
        sex => { isa => 'Sex', default => 'shemale'}
    );
};

1;
__END__

=head1 NAME

Nephia-TestApp - Test Web Application for Nephia

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

Nephia::TestApp is web application based Nephia.

=head1 AUTHOR

ytnobody

=head1 SEE ALSO

Nephia

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
