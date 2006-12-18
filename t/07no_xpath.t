# $Id: 07no_xpath.t 640 2006-12-03 17:58:45Z struan $

use Test::More tests => 3;

BEGIN {
    SKIP: {
        skip "no Test::Without::Module", 3, if -f 't/SKIPWITHOUT';

        require Test::Without::Module;
        import Test::Without::Module qw( XML::XPath );

        use WebService::Validator::HTML::W3C;

        my $v = WebService::Validator::HTML::W3C->new(
                    http_timeout    =>  10,
                    detailed        =>  1,
                );

        SKIP: {
            skip "no internet connection", 3 if -f 't/SKIPLIVE';

            ok($v, 'object created');

            my $r = $v->validate('http://exo.org.uk/code/www-w3c-validator/invalid.html');

            unless ($r) {
                if ($v->validator_error eq "Could not contact validator")
                {
                    skip "failed to contact validator", 2;
                }
            }
            
            ok($r, 'page validated');
                    
            ok(!$v->errors(), 'no errors returned if no XML::XPath');
            
        } 
    }
}
