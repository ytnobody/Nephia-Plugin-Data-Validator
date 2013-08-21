use inc::Module::Install;
all_from 'lib/PrimalNephia/TestApp.pm';

requires 'PrimalNephia' => 0.01;

tests 't/*.t';

test_requires 'Test::More';

WriteAll;
