#!/usr/bin/perl
use strict;

use Test::More 'no_plan';

my $class = 'Geo::Gpx::Waypoint';

use_ok( $class );
can_ok( $class, 'new' );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Test the empty object, no arguments
{
my $waypoint = $class->new();
isa_ok( $waypoint, $class );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Test the empty object, empty hash
{
my $waypoint = $class->new( {} );
isa_ok( $waypoint, $class );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Test the empty object, invalid arg
{
my $waypoint = eval { $class->new( undef ) };
ok( ! defined $waypoint, "Passing undef croaks [$waypoint]" );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Test the empty object, list arguments
{
my $waypoint = eval { $class->new( -87.0, 120.0 ) };
ok( ! defined $waypoint, "Passing list croaks" );
}