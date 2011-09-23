use strict;
use warnings;

use TwitterPaste::Web;
use Plack::Session::Store::Cache::KyotoTycoon;
use Plack::Builder;

my $home = TwitterPaste::Web->base_dir;
builder {
    enable 'Static',
        path => qr{^/(img/|js/|css/|favicon\.ico)},
        root => $home->file('assets/htdocs')->stringify;
    enable 'ReverseProxy';
    enable 'StackTrace';
    enable 'Scope::Container';
    enable 'Session',
        store => Plack::Session::Store::Cache::KyotoTycoon->new;
    TwitterPaste::Web->app;
};

