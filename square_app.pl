#!/usr/bin/perl
use strict;
use warnings;
use FFI::Platypus;
 
my $VERSION = '0.03';
my $input   = shift;
die("square_app.pl: $VERSION\nSyntax:\n  square_app.pl [number]\n\n") unless defined $input;
my $ffi     = FFI::Platypus->new( api => 1 );
$ffi->find_lib(lib => 'square');
my $output  = $ffi->function( _square => ['double'] => 'double' )->call($input);
printf "%0.7f\n", $output;


