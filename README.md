# NAME

Nephia::Plugin::Data::Validator - A Nephia plugin that provides data-validation feature

# SYNOPSIS

You may use validator with validate function.

    use Nephia;
    nephia_plugins('Data::Validator)';
    

    path '/some/path' => sub {
        my $params = validate(
            name => { isa => 'Str', default => 'Nameless John' },
            age => { isa => 'Int' }
        );
    };



# DESCRIPTION

Nephia::Plugin::Data::Validator uses Data::Validator for validation backend.

See documentation of validate method and Data::Validator.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
