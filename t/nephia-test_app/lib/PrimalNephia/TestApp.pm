package PrimalNephia::TestApp;
use strict;
use warnings;
use PrimalNephia;
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

PrimalNephia-TestApp - Test Web Application for PrimalNephia

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

PrimalNephia::TestApp is web application based PrimalNephia.

=head1 AUTHOR

ytnobody

=head1 SEE ALSO

PrimalNephia

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
