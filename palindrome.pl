#!/opt/rakudo-pkg/bin/perl6

#Exercise 5-3

class palindrome {
	has Str $.m is required;
	has Int $.halfLength = ($!m.chars*.5).round;
	has Int $.wrdsLngth =  $!m.chars;
	has Int $.middleChar = $!halfLength-1;
	
	method initMe(){
		#say $!halfLength.perl;
		
		#Not all palindromes behave the same.  If I have an even length example then both characters in the middle will be the same such as lexxel.
		if $!m.chars%2 == True {
			self.checkPalindrome($!m);
		} else {
			self.checkPalindromeEven($!m);
		}
	}
	
	method checkPalindrome (Str $myWord){
		#first half
		my $firstHalf =(substr $myWord, 0, $!middleChar);
		my $secondHalf = (substr $myWord, $!halfLength, $!wrdsLngth);
		
		#Best debugging string test from Util on Irc Freenode:perl6
		#say $secondHalf.perl;
		
		my $reverseSendHalf = $secondHalf.flip;
		#middle char
		my $middleCharNotInt = substr $myWord, $!middleChar, 1;
		
		$reverseSendHalf.fc eq $firstHalf.fc;
	}
	
	method checkPalindromeEven (Str $myWord){
		my $middleChar = $myWord.chars*.5;
		#first half
		my $firstHalf =(substr $myWord, 0, $middleChar);
		#second half
		my $secondHalf = (substr $myWord, $middleChar, $!wrdsLngth);
		my $reverseSendHalf = $secondHalf.flip;
		$reverseSendHalf.fc eq $firstHalf.fc;
	}

}

sub MAIN (Str $myWord ){
	#This sub MAIN forces the user to provide two values from the commandline
	#check string length
	my $myWordStrippedOfBlankSpace = $myWord.trans(" "=>"");
	if $myWordStrippedOfBlankSpace.chars > 2 {
		my $testMe = palindrome.new( m=>$myWordStrippedOfBlankSpace );
		printf "%s \n", $testMe.initMe();
	}else{
		printf "%s \n", "Your string is not long enough";
	}

}


