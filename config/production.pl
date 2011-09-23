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
        master => +{
            dsn => 'dbi:mysql:twitter_paste;user=root',
        },
    },
    hostname => +{
    },
    plugins => +{
    },
};


