#!/usr/bin/perl -w
#
#  t
#
#  Created by Andy Armstrong on 2006-11-24.
#  Copyright (c) 2006 Hexten. All rights reserved.

use strict;
use lib qw(lib);
use Geo::Gpx;

$| = 1;

my $gpx = Geo::Gpx->new();

print $gpx->_xml( 'test', 'pork' );
print $gpx->_xml( 'link',
  { href => 'http://hexten.net/', name => 'Frob' } );
print $gpx->_xml( 'wpt', { lat => 10, lon => 10, time => time() } );
print $gpx->_xml( 'count',
  [ { name => 'one' }, { name => 'two' }, { name => 'three' } ] );

#
# my @wpt = (
#     {
#         # All standard GPX fields
#         lat           => 54.786989,
#         lon           => -2.344214,
#         ele           => 512,
#         time          => time(),
#         magvar        => 0,
#         geoidheight   => 0,
#         name          => 'My house & home',
#         cmt           => 'Where I live',
#         desc          => '<<Chez moi>>',
#         src           => 'Testing',
#         link          => {
#             href => 'http://hexten.net/',
#             text => 'Hexten',
#             type => 'Blah'
#         },
#         sym           => 'pin',
#         type          => 'unknown',
#         fix           => 'dgps',
#         sat           => 3,
#         hdop          => 10,
#         vdop          => 10,
#         pdop          => 10,
#         ageofdgpsdata => 45,
#         dgpsid        => 247
#     },
#     {
#         # Fewer fields
#         lat           => -38.870059,
#         lon           => -151.210030,
#         name          => 'Sydney, AU'
#     }
# );
#
# $gpx->waypoints(\@wpt);
#
# $gpx->name('Test');
# $gpx->desc('Test data');
# $gpx->author({
#     name    => 'Andy Armstrong',
#     email   => {
#         id      => 'andy',
#         domain  => 'hexten.net'
#     },
#     link    => {
#         href    => 'http://hexten.net/',
#         text    => 'Hexten'
#     }
# });
# $gpx->copyright('(c) Anyone');
# $gpx->link({
#     href => 'http://www.topografix.com/GPX',
#     text => 'GPX Spec',
#     type => 'unknown'
# });
# $gpx->time(time());
# $gpx->keywords(['this', 'that', 'the other']);
#
# print $gpx->xml();
