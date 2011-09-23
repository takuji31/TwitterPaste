use strict;
use warnings;

use TwitterPaste::Web;
use Plack::Builder;

my $home = TwitterPaste::Web->base_dir;
builder {
    enable 'Static',
        path => qr{^/(img/|js/|css/|favicon\.ico)},
        root => $home->file('assets/htdocs')->stringify;
    enable 'StackTrace';
    enable 'Session';
    TwitterPaste::Web->app;
};

