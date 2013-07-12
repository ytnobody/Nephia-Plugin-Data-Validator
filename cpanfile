requires 'perl', '5.008001';
requires 'Data::Validator', 0;
requires 'Nephia', 0.32; # There is incompatible changes into logic that loading plugins.

on 'test' => sub {
    requires 'Test::More', '0.98';
};

