use Test::More tests => 3;

BEGIN {
	foreach my $class ( qw(Geo::Gpx Geo::Gpx::Waypoint Geo::Gpx::DataValidator) ) {
	   print "Bail out!" unless use_ok( $class );
	 }
}

diag( "Testing Geo::Gpx $Geo::Gpx::VERSION" );
