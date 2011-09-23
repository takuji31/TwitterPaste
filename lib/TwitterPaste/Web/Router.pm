package  TwitterPaste::Web::Router;
use strict;
use warnings;

use Chiffon::Web::Router;

connect(
    '/login',
    {controller => 'Root', action => 'login'},
    {},
);

connect(
    '/callback',
    {controller => 'Root', action => 'login'},
    {},
);

connect(
    '/add',
    {controller => 'Root', action => 'login'},
    {},
);

connect(
    '/:uuid',
    {controller => 'Root', action => 'show'},
    {
        pass => [qw(uuid)]
    },
);

1;

