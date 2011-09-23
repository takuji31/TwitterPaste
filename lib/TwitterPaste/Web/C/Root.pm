package  TwitterPaste::Web::C::Root;
use strict;
use warnings;

use parent qw/TwitterPaste::Web::Controller/;

use TwitterPaste::DB;
use Digest::MurmurHash qw(murmur_hash);

sub do_index {
    my ( $class, $c ) = @_;
}

sub do_add {
    my ( $class, $c ) = @_;
    if($c->req->is_post_request) {
        my $body = $c->req->param('body');
        #TODO validation
        if($body) {
            my $db = TwitterPaste::DB->get_db;
            my $row = $db->insert(content => {body => $body});
            $row->refetch;
            $c->redirect('/'.$row->rid);
        }
    }
    $c->redirect('/');
}

sub do_show {
    my ( $class, $c, $rid ) = @_;
    $c->redirect('/') unless $rid;
    my $db = TwitterPaste::DB->get_db;
    my $content = $db->single(content => {rid_hash => murmur_hash($rid), rid => $rid});
    $c->redirect('/') unless $content;
    $c->stash->{content} = $content;
}

use Config::Pit;
use JSON::XS;
use OAuth::Lite::Consumer;
use Time::Piece::MySQL;
use URI;

sub get_consumer {pit_get('twitter_paste', require => { consumer_key => 'Twitter consumer key', consumer_secret => 'Twitter consumer secret' })}

sub do_login {
    my ( $class, $c ) = @_;
    my $uri = URI->new('https://oauth.twitter.com/2/authorize');
    $uri->query_form(
        callback_url => 'http://'.$c->req->uri->host.'/callback',
        oauth_mode   => 'from_web_client',
        oauth_client_identifier => get_consumer()->{consumer_key},
    );
    $c->redirect($uri->as_string);
}

sub do_callback {
   my ( $class, $c ) = @_;

}

1;

