# $Id: 05options.t 3 2003-11-11 22:49:11Z struan $

use Test::More tests => 3;
use WebService::Validator::HTML::W3C;

my $v = WebService::Validator::HTML::W3C->new(
            validator_uri   =>  'http://example.com/',
            http_timeout    =>  10,
        );

ok($v, 'object created');
is($v->validator_uri(), 'http://example.com/', 'correct uri set');
is($v->http_timeout(), 10, 'correct http timeout set');

