use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    ( MM->can( 'signature_target' ) ? ( SIGN => 1 ) : () ),
    NAME          => 'Geo::Gpx',
    AUTHOR        => 'Andy Armstrong <andy@hexten.net>',
    VERSION_FROM  => 'lib/Geo/Gpx.pm',
    ABSTRACT_FROM => 'lib/Geo/Gpx.pm',
    LICENSE       => 'perl',
    PL_FILES      => {},
    PREREQ_PM     => {
        'Test::More'     => 0,
        'version'        => 0,
        'Date::Format'   => 0,
        'Date::Parse'    => 0,
        'HTML::Entities' => 0,
        'Scalar::Util'   => 0,
        'Time::Local'    => 0,
        'XML::Descent'   => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Geo-Gpx-*' },
);
