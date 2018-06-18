#!/opt/rakudo-pkg/bin/perl6

#Exercise 5-3

class palindrome {
	has Str $.m is required;
	
	method initMe(){
		#say "initMe";
		self.checkPalindrome($!m);
	}
	
	method checkPalindrome (Str $myWord){
		my Int $halfLength = ($myWord.chars*.5).round;
		my Int $wrdsLngth =  $myWord.chars;
		my Int $middleChar = $halfLength-1;
		
		#first half
		my $firstHalf =(substr $myWord, 0, $middleChar).trans(" "=>"");
		
		my $secondHalf = (substr $myWord, $halfLength, $wrdsLngth).trans(" "=>"");
		
		#Best debugging string test from Util on Irc Freenode:perl6
		#say $secondHalf.perl;
		
		my $reverseSendHalf = $secondHalf.flip;
		#middle char
		my $middleCharNotInt = substr $myWord, $middleChar, 1;
		
		$reverseSendHalf.fc eq $firstHalf.fc;
	}

}

sub MAIN (Str $myWord ){
	#This sub MAIN forces the user to provide two values from the commandline
	#check string length
		if $myWord.chars > 2 {
		my $testMe = palindrome.new( m=>$myWord );
		printf "%s \n", $testMe.initMe();
	}else{
		printf "%s \n", "Your string is not long enough or the length is even.";
	}
}


