#!/usr/bin/perl
#
# Copyright 2014 Pierre Mavro <deimos@deimos.fr>
# Copyright 2014 Vivien Didelot <vivien@didelot.org>
# Copyright 2014 Andreas Guldstrand <andreas.guldstrand@gmail.com>
#
# Licensed under the terms of the GNU GPL v3, or any later version.

use strict;
use warnings;
use utf8;
use Getopt::Long;

# Color thresholds.
my $t_norm = 25;
my $t_warn = 50;
my $t_crit = 80;
my $cpu_usage = -1;

sub help {
    print "Usage: cpu_usage\n";
    exit 0;
}

GetOptions("help|h" => \&help);

# Get CPU usage
$ENV{LC_ALL}="en_US"; # if mpstat is not run under en_US locale, things may break, so make sure it is
open (MPSTAT, 'mpstat 1 1 |') or die;
while (<MPSTAT>) {
    if (/^.*\s+(\d+\.\d+)\s+$/) {
        $cpu_usage = 100 - $1; # 100% - %idle
        last;
    }
}
close(MPSTAT);

$cpu_usage eq -1 and die 'Can\'t find CPU information';

# Print short_text, full_text
printf "%4.1f%%\n", $cpu_usage;
printf "%4.1f%%\n", $cpu_usage;

# Print color, if needed
if ($cpu_usage >= $t_crit) {
    print "#FF0000\n";
    # exit 33;
} elsif ($cpu_usage >= $t_warn) {
    print "#FF6600\n";
} elsif ($cpu_usage >= $t_norm) {
    print "#FFFC00\n";
} else {
    print "#00FF00\n";
}

exit 0;
