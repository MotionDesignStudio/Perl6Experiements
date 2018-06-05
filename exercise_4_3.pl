#!/opt/rakudo-pkg/bin/perl6


#Exercise 4-2

class fermatLastTheorem {
	has Int $.a is required;
	has Int $.b is required;
	has Int $.c is required;
	has Int $.n is required;
	
	method checkValues (){
		my $bool = True;
		if $!a <2 || $!b <2 || $!n <2 { 
			$bool=False; 
			}
		if $!c <2 { 
			$bool=False; 
		}
		
		return $bool;
	}
	
	method checkTheorem (){
		my Str $equalOrNot = "=";
		if ( $!a**$!n +  $!b**$!n == $!c**$!n ) == False {
			$equalOrNot = "≠";
		}

		my ($compA, $compB, $compC ) = $!a**$!n, $!b**$!n, $!c**$!n;
		"$compA + $compB $equalOrNot $compC";
	
	}
	
	method traingleInequalityTheorem (){
		$!a+$!b>$!c && $!a+$!c>$!b && $!b+$!c>$!a
	}

}


sub MAIN (Int $mya, Int $myb, Int $myc, Int $myn,){	
	my $testMe = fermatLastTheorem.new( a=>$mya, b=>$myb, c=>$myc, n=>$myn );
	printf "%s \n", "Is a valid triangle : $testMe.traingleInequalityTheorem()";
	printf "%s \n", $testMe.checkTheorem();
}


