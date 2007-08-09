package Geo::Gpx::DataValidator;

my $singleton = undef;

sub new {
	return $singleton if defined $singleton;
	
	$singleton = '';
	bless \$singleton, $_[0];
	}
	
sub xsd_dateTime {
	$_[1] =~ /\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}\z/
	}
	
sub xsd_decimal {
	sprintf( "%f", $_[1] ) eq $_[1]
	}

sub xsd_nonNegativeInteger {
	int($_[1]) eq $_[1] and $_[1] >= 0
	}

sub xsd_string {
	length $_[1]
	}


sub degreesType {
	&xsd_decimal and $_[0]->_between( $_[1], 0, 360 )
	}

sub dgpsStationType {
	&xsd_nonNegativeInteger and $_[0]->_between( $_[1], 0, 1023 )
	}

sub extensionsType {
	}

sub fixType {
	scalar grep { $_ eq $_[1] } qw(none 2d 3d dgps pps)
	}

sub latitudeType {
 	&_non_null and &xsd_decimal and $_[0]->_between( $_[1], -90, 90 )
	}

sub linkType {

	return 1;
	}

sub longitudeType {
 	&_non_null and &xsd_decimal and $_[0]->_between( $_[1], -180, 180 )
	}

sub _non_null {
	defined $_[1]
	}
	
sub _between {
	$_[2] <= $_[1] and $_[1] <= $_[4]
	}

1;