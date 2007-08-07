use strict;
use warnings;
use Test::More tests => 5;

use Geo::Gpx;

my @wpt = (
    {
        # All standard GPX fields
        lat         => 54.786989,
        lon         => -2.344214,
        ele         => 512,
        time        => time(),
        magvar      => 0,
        geoidheight => 0,
        name        => 'My house & home',
        cmt         => 'Where I live',
        desc        => '<<Chez moi>>',
        src         => 'Testing',
        link        => {
            href => 'http://hexten.net/',
            text => 'Hexten',
            type => 'Blah'
        },
        sym           => 'pin',
        type          => 'unknown',
        fix           => 'dgps',
        sat           => 3,
        hdop          => 10,
        vdop          => 10,
        pdop          => 10,
        ageofdgpsdata => 45,
        dgpsid        => 247
    },
    {
        # Fewer fields
        lat  => -38.870059,
        lon  => -151.210030,
        name => 'Sydney, AU'
    }
);

{
    my $gpx = new Geo::Gpx;
    $gpx->add_waypoint( @wpt );
    is_deeply $gpx->waypoints, \@wpt, "add_waypoint adds waypoints";
}

{
    my $gpx = new Geo::Gpx;
    eval { $gpx->add_waypoint( [] ) };
    like $@, qr/waypoint argument must be a hash reference/, "type check OK";
}

{
    for my $wpt ( {}, { lat => 1 }, { lon => 1 } ) {
        my $gpx = new Geo::Gpx;
        eval { $gpx->add_waypoint( $wpt ) };
        like $@, qr/mandatory in waypoint/, "mandatory lat, lon OK";
    }
}
