#!/opt/rakudo-pkg/bin/perl6

#Exercise 5-3

class ackermann {
	has Int $.m is required;
	has Int $.n is required;
	
	method initMe(){
		self.checkTheorem($!m, $!n);
	}
	
	method checkTheorem (Int $myM, Int $myN){
		
		if $myM == 0 {
			return $myN+1;
		} elsif $myM>0 and $myN == 0 {
			return self.checkTheorem($myM-1, 1);
		} else {
			return self.checkTheorem($myM-1, self.checkTheorem($myM, $myN-1));
		}
			
	}

}

sub MAIN (Int $mya, Int $myb ){
	#This sub MAIN forces the user to provide two values from the commandline
	my $testMe = ackermann.new( m=>$mya, n=>$myb );
	printf "%s \n", $testMe.initMe();
}

# https://en.wikipedia.org/wiki/Ackermann_function

