# $Id: 02validate.t 25 2003-11-25 15:16:18Z struan $

use Test::More tests => 7;

use WebService::Validator::HTML::W3C;

my $v = WebService::Validator::HTML::W3C->new();

ok($v, 'Object created');

is($v->validator_uri(), 'http://validator.w3.org/check', 'correct default validator uri');

SKIP: {
    skip "no internet connection", 5 if -f "t/SKIPLIVE";
    
    ok($v->validate('http://exo.org.uk/code/www-w3c-validator/valid.html'), 'validates page');
    ok($v->is_valid, 'page is valid');
    is($v->num_errors, 0, 'no errors in valid page');
    is($v->errors, undef, 'no information on errors returned');
    is($v->uri, 'http://exo.org.uk/code/www-w3c-validator/valid.html', 'uri correct');
}
