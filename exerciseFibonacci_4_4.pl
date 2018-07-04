#!/opt/rakudo-pkg/bin/perl6


#Exercise 4-2

class fibonacci {
	has Int $.lastNumInFib is required;
	my @arrayOfNumber = <0 1>;

	my Int $nextValue;
	
	
	method doCalculation (){
	
			for @arrayOfNumber -> $x {
				#Exit loop
				last if @arrayOfNumber.elems == $!lastNumInFib;
				
				$nextValue = $x + @arrayOfNumber[@arrayOfNumber.elems-1];
				@arrayOfNumber.push: $nextValue;
			}
		self.displayReults;
	}
	
	method displayReults(){
		for @arrayOfNumber -> $x {
			printf "%s ", $x;
		}
		printf "%s \n",""; # This is for a line break
	}

	
}

sub MAIN (Int $mya){	
	my $testMe = fibonacci.new( lastNumInFib=>$mya );
	$testMe.doCalculation();
}


