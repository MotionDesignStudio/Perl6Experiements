#!/opt/rakudo-pkg/bin/perl6


#Exercise 4-2

class fermatLastTheorem {
	has Int $.a is required;
	has Int $.b is required;
	has Int $.c is required;
	has Int $.n is required;
	
	
	#%$self = (
	#	printf "%s \n", "SHIT";
	#}
	
	method checkValues (){
		my $bool = True;
		#printf "%s \n", "a = $!a b = $!b c = $!c n = $!n";
		if $!a <2 || $!b <2 || $!n <2 { 
			$bool=False; 
			}
		if $!c <2 { 
			$bool=False; 
		}
		
		return $bool;
	}
	
	method checkTheorem (){
		#return $!a**$!n +  $!b**$!n == $!c**$!n
		#my $compA = $!a**$!n;
		my ($compA, $compB ) = $!a**$!n, $!b**$!n;
		return "$compA + $compB";
	
	}

}

#my $testMe = fermatLastTheorem.new( a=>3, b=>3, c=>4, n=>3 );


#printf "%s \n", $testMe.checkValues();

#printf "%s \n", $testMe.checkTheorem();

sub MAIN (Int $mya, Int $myb, Int $myc, Int $myn,){	
	my $testMe = fermatLastTheorem.new( a=>$mya, b=>$myb, c=>$myc, n=>$myn );
	printf "%s \n", $testMe.checkTheorem();
}


=begin comment

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

=end comment


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