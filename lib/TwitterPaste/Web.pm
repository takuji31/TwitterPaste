package  TwitterPaste::Web;
use strict;
use warnings;

use parent qw(TwitterPaste Chiffon::Web);

__PACKAGE__->set_use_modules(
    request    => 'TwitterPaste::Web::Request',
    response   => 'TwitterPaste::Web::Response',
    router     => 'TwitterPaste::Web::Router',
    view       => 'Chiffon::View::Xslate',
);

1;

