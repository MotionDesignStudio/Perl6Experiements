#!/opt/rakudo-pkg/bin/perl6

class Euclidean_algorithm {
	has Int $.a is required;
	has Int $.b is required;
	
	method initMe(){
		if $!a > $!b {
			self.subtractFrom($!a, $!b);
		} else {
			self.subtractFrom($!b, $!a);
		}
	}
	
	method subtractFrom (Int $largerNum, Int $smallerNum ){
		
		my Int $subtrahend = $smallerNum;
		my Int $difference;
		my Int $countIngDownFrom = $largerNum;
		my Int $GCM;
		
		repeat {
			$difference = $countIngDownFrom - $subtrahend;

			if $difference == 0 {
				$GCM = $countIngDownFrom;
				printf "%s \n", "GCM : $GCM";
			}	
			
			$countIngDownFrom = $difference;
			#printf "%s \n", "$difference"; 
		} until $difference < $smallerNum;
		
		if $difference >0 {
			self.subtractFrom( $subtrahend, $difference);
		}
		
	}

}

sub MAIN (Int $a, Int $b ){

	my $testMe = Euclidean_algorithm.new( a=>$a, b=>$b );
	$testMe.initMe();

}


