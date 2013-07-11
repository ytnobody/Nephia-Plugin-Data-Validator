use strict;
use warnings;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use URI;
use JSON;

use lib qw( ./t/nephia-test_app/lib );
use Nephia::TestApp;
use t::Util;

test_psgi 
    app => Nephia::TestApp->run( test_config ),
    client => sub {
        my $cb = shift;

        subtest "normal request" => sub {
            my $uri = URI->new('/validate');
            my $test_req = sub {
                my %opts = @_;
                $uri->query_form( $opts{query} );
                my $res = $cb->(GET $uri);
                for my $key ( keys %{$opts{expect}} ) {
                    if ( $key eq 'content' ) {
                        my $data = JSON->new->decode( $res->$key );
                        if ($data->{error}) {
                            like $data->{error}, $opts{expect}->{$key}{error}, "error lile as ".$opts{expect}->{$key}{error};
                        }
                        else {
                            is_deeply( $data, $opts{expect}->{$key} );
                        }
                    }
                    else {
                        is $res->$key, $opts{expect}->{$key}, "$key is ".$opts{expect}->{$key};
                    }
                }
            };

            my %expect_basic = ( code => 200, content_type => 'application/json' );

            $test_req->( 
                query => { name => 'Borgira', sex => 'female', age => 22 },
                expect => { %expect_basic, 
                    content => { name => "Borgira", sex => "female", age => 22 }
                }
            );

            $test_req->( 
                query => { name => 'Johnny' },
                expect => { %expect_basic, 
                    content => { name => "Johnny", sex => "shemale", age => 72 }
                }
            );

             $test_req->( 
                 query => { name => 'Johnny', sex => 'mail' },
                 expect => { 
                     content => { error => qr/^Invalid value for 'sex'/ },
                 }
             );
 
             $test_req->( 
                 query => {},
                 expect => {
                     content => { error => qr/^Missing parameter: 'name'/ },
                 }
             );
        };
    }
;

done_testing;
