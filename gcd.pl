#!/opt/rakudo-pkg/bin/perl6

class Euclidean_algorithm {
	has Int $.a is rw;
	has Int $.b is rw;
	
	# initMe will check the lowest number of the two sent to the class and then send them to the 
	# subtratFRom method
	method initMe(){
		if $!a > $!b {
			self.subtractFrom($!a, $!b);
		} else {
			self.subtractFrom($!b, $!a);
		}
	}
	
	# This is the heart of the Eucliden algorith
	method subtractFrom (Int $largerNum, Int $smallerNum ){
		
		my Int $subtrahend = $smallerNum;
		my Int $difference;
		my Int $countIngDownFrom = $largerNum;
		my Int $GCM;
		
		repeat {
			$difference = $countIngDownFrom - $subtrahend;
			# use this for debugging
			#printf "%s \n", $difference;

			if $difference == 0 {
				$GCM = $countIngDownFrom;
				return $GCM;
			}	
			
			$countIngDownFrom = $difference;
		} until $difference < $smallerNum;
		
		if $difference >0 {
			self.subtractFrom( $subtrahend, $difference);
		}
	}

}

sub MAIN ( *@numbers){

	my Int $storedGCM;
	my $testMe = Euclidean_algorithm.new();
	
	if @numbers.elems >1 {
		# Clean up array search for redundant numbers and place the largest number first
		@numbers = @numbers.unique;
		@numbers = @numbers.sort;
		@numbers = @numbers.reverse;

		# Using the first two numbers of the array and will check other number(s) in the array for the GCF
		$testMe.a=@numbers.shift;
		$testMe.b=@numbers.shift;
		$storedGCM = $testMe.initMe();

		for @numbers -> $varB {
			$testMe.a=$storedGCM;
			$testMe.b=$varB;
			$storedGCM = $testMe.initMe();
			# I must remove the first character of the array
			@numbers.shift;
		}

		printf "%s \n", $storedGCM;
	} else {
		printf "%s \n", "You need a minimum of two numbers.";
	}
}


# Importants Links
# http://perl6maven.com/parsing-command-line-arguments-perl6
# https://docs.perl6.org/routine/is%20rw
