#!/usr/bin/perl -w
#
#  parse_test
#
#  Created by Andy Armstrong on 2006-11-25.
#  Copyright (c) 2006 Hexten. All rights reserved.

use strict;
use lib qw(lib);
use Geo::Gpx;
use Data::Dumper;

$| = 1;

while (my $obj = shift) {
    my $xml = undef;
    
    print "$obj\n";
    
    open(my $fr, '<', $obj) or die "Can't read $obj ($!)\n";
    { local $/; $xml = <$fr>; }
    close($fr);
    
    my $gpx = Geo::Gpx->new(xml => $xml); 
    (my $not = $obj) =~ s/[.][^.]*$//;
    $not .= '.xml';
    open(my $fw, '>', $not) or die "Can't write $not ($!)\n";
    print $fw $gpx->xml(), "\n";
    close($fw);

    # system('xml_pp', '-i', $not);
    open(my $dw, '>>', $not) or die "Can't write $not ($!)\n";
    #my $dw = $fw;
    print $dw "----------------------------------\n";
    print $dw Dumper($gpx);
    close($dw);
}
