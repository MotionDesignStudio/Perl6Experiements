#!/opt/rakudo-pkg/bin/perl6


#Exercise 4-1

printf "%s \n", "Enter Seconds To Convert";
sub MAIN (Int $numSeconds){	
	#printf "%s \n", "Entered $numSeconds seconds.";
	computeTime $numSeconds;
}

sub computeTime (Int $computeMe ){
	#day 86400
	#hour 3600
	printf "%s \n", "Entered $computeMe seconds.";
	my $days = $computeMe div 86400; #div rounds down
	my $numHours = ($computeMe % 86400) div 3600; # % modulo gives me the remainder
	my $myMinutes = (($computeMe % 86400) % 3600) div 60;
	my $mySecond = (($computeMe % 86400) % 3600) % 60;
	printf "%s \n", "Day(s) : $days | Hour(s) :  $numHours | Minute(s) : $myMinutes | Second(s) : $mySecond";
}


=begin comment

my ($a, $b, $c, $d) = 2,3,5,10;
my $value = 360;

$value /=$_ for $a, $b, $c, $d;
say $value;

for 2..10 -> $x {
	printf "%s \n", $x;
}

=end comment

=begin comment
printf "%s \n", "";


sub half(Int $number){
	return $number / 2
}


printf "%s \n", half(3);

=end comment

#printf "%s \n", round(42.45, .1);

#printf "%s \n", 10/2/2.5;

#printf "%s \n", 4 * atan 1;

#"Hello, World\n".print();
#"Hello, World\n".say();
#(43.0).WHAT.say;

#my $num = 17.3;

#say $num.WHAT;

#say $num.numerator, " / ", $num.denominator;

#my $result = 0.3-0.2-0.1;

#printf "%.50f \n", $result;

#printf "%s \n", $result == 0;

#say 02 2;