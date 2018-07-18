#!/opt/rakudo-pkg/bin/perl6

class CollatzConjecture {
	has Int $.a is rw;
	
	method initMe(){
		self.countingDown($!a);
		
	}
	
	# This returns numbers towards 1
	method countingDown ( Int $startHere ){
		#say $startHere;
		my $posInteger = $startHere;
		while $posInteger != 1 {
			printf "%s ", $posInteger;
			if $posInteger %% 2 {  # $startHere is an even number
				$posInteger = $posInteger/2;
				} else { # $startHere is an odd number
				$posInteger = $posInteger*3 +1;
			}
		
		}
		# add line break
		printf "%s \n", "1";
	
	}

}

sub MAIN ( *@numbers){

	my Int $storedGCM;
	my $testMe = CollatzConjecture.new();
	$testMe.a=@numbers[0];

	if @numbers.elems >0 {
		$testMe.initMe();
	} else {
		printf "%s \n", "You need a minimum of one positive natural number.";
	}
	
}

# Importants Links
