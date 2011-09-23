use strict;
use warnings;

use TwitterPaste;

my $home = TwitterPaste->base_dir;
return +{
    app_name => 'twitter_paste',
    view => {
        'Chiffon::View::Xslate' => +{
            path   => $home->file('assets/template')->stringify,
            cache     => 1,
            cache_dir => '/tmp/twitter_paste',
            syntax    => 'Kolon',
            type      => 'html',
            suffix    => '.html',
        },
    },
    datasource => +{
        master => [
            'dbi:mysql:twitter_paste',
            'root',
            '',
            { RaiseError => 1, mysql_connect_timeout => 4, mysql_enable_utf8 => 1 },
        ],
    },
    hostname => +{
    },
    plugins => +{
    },
};


