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
use Scalar::Util qw(looks_like_number);

# default values
my $t_warn = 50;
my $t_crit = 80;
my @cpu_usages; # Array holding cpu usages.

sub help {
    print "Usage: cpu_usage [-w <warning>] [-c <critical>]\n";
    print "-w <percent>: warning threshold to become yellow\n";
    print "-c <percent>: critical threshold to become red\n";
    exit 0;
}

GetOptions("help|h" => \&help,
           "w=i"    => \$t_warn,
           "c=i"    => \$t_crit);

# Get CPU usage
$ENV{LC_ALL}="en_US"; # if mpstat is not run under en_US locale, things may break, so make sure it is
open (MPSTAT, 'mpstat -P ALL 1 1 |') or die;

# Loop over lines of mpstat output.
my $total_usage = 0;
while (my $line = <MPSTAT>) {
    # Split output over spaces.
    my @words = split / /, $line;

    if ($words[0] eq "Average:") {
        # Only look at the averaged values.
        if (looks_like_number($words[-1])) {
            # Only look at lines where the last column (%idle) is numeric.
            # print $line;
            # print $words[-1];
            $total_usage = $total_usage + 100 - $words[-1];
            push @cpu_usages, 100 - $words[-1]; # 100% - %idle
        }
    }
}
close(MPSTAT);

@cpu_usages eq 0 and die 'Can\'t find CPU information';

# Sum load per core.
$total_usage = $total_usage - $cpu_usages[0];

# Replace the first element (total usage) with the sum of the rest of the entries.
# splice @cpu_usages, 0, 1;

# Print short_text, full_text
printf "%4.1f%%", $total_usage;
# printf "%4.1f " x @cpu_usages . " ", @cpu_usages;

# Print color, if needed
if ($total_usage >= $t_crit) {
    print "#FF0000\n";
    exit 33;
} elsif ($total_usage >= $t_warn) {
    print "#FFFC00\n";
}

exit 0;
