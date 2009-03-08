#!/usr/bin/perl -w
#
#  xind - Simple XML indenting
#
#  Created by Andy Armstrong on 2006-11-25.
#  Copyright (c) 2006 Hexten. All rights reserved.

use strict;

$| = 1;

my $depth = 0;

while ( my $ln = <> ) {
  $depth = 0 if $depth < 0;
  chomp $ln;
  my $spec = '';
  while ( $ln =~ m{<([^>]*)>}g ) {
    my $tag = $1;
    if ( $tag =~ m{^\w} && $tag !~ m{/$} ) {
      $spec .= 'i';
    }
    elsif ( $tag =~ m{^/} ) {
      $spec .= 'o';
    }
  }
  if ( $spec =~ m{^(o+)(.*)$} ) {
    $depth -= length( $1 );
    $spec = $2;
  }
  my $pad = '  ' x $depth;
  print "$pad$ln\n";
  $depth += ( $spec =~ m{i}g ) - ( $spec =~ m{o}g );
}
