package  TwitterPaste::Web::C::Root;
use strict;
use warnings;

use parent qw/TwitterPaste::Web::Controller/;

sub do_index {
    my ( $class, $c ) = @_;
    $c->stash->{body} = "Hello Chiffon World!";
}

1;

