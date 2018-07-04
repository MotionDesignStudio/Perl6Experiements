#!/opt/rakudo-pkg/bin/perl6


class myFactorial {
	has Int $.numOfFactorial is required;

	my Int $nextValue;
	
	method doCalculation (){
	
		for 1..$!numOfFactorial {
			$nextValue*=$_;
		}
		
		self.displayReults;
	}
	
	method displayReults(){
		printf "%s \n", $nextValue;
	}

}

sub MAIN (Int $mya){	
	my $testMe = myFactorial.new( numOfFactorial=>$mya );
	$testMe.doCalculation();
}


