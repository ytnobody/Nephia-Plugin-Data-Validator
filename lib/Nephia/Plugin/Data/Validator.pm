package Nephia::Plugin::Data::Validator;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Data::Validator;

sub validate {
    my $caller = caller();
    no strict ('refs', 'subs');
    no warnings 'redefine';
    my $req = *{$caller.'::req'};
    my $validator = Data::Validator->new(@_);
    return $validator->validate( %{$req->()->parameters->as_hashref_mixed} );
}

1;
__END__

=encoding utf-8

=head1 NAME

Nephia::Plugin::Data::Validator - A Nephia plugin that provides data-validation feature

=head1 SYNOPSIS

You may use validator with validate function.

  use Nephia;
  nephia_plugins('Data::Validator)';
  
  path '/some/path' => sub {
      my $params = validate(
          name => { isa => 'Str', default => 'Nameless John' },
          age => { isa => 'Int' }
      );
  };


=head1 DESCRIPTION

Nephia::Plugin::Data::Validator uses Data::Validator for validation backend.

See documentation of validate method and Data::Validator.

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

