# NAME

PrimalNephia::Plugin::Data::Validator - A PrimalNephia plugin that provides data-validation feature

# SYNOPSIS

You may use validator with validate function.

    use PrimalNephia;
    nephia_plugins('Data::Validator)';
    

    path '/some/path' => sub {
        my $params = validate (
            name => { isa => 'Str', default => 'Nameless John' },
            age => { isa => 'Int' }
        );
    };



# DESCRIPTION

PrimalNephia::Plugin::Data::Validator uses Data::Validator for validation backend.

See documentation of validate method and Data::Validator.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
