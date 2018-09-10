#!/opt/rakudo-pkg/bin/perl6

class caesarCipher {
	has Str $.m is required;
	has Int $.num;
	has Str $.encodeOrDecode;

	method initMe(){
		if $!encodeOrDecode eq "d" {
			self.caesarCipherDecrypt($!m);
		}elsif $!encodeOrDecode eq "e" {
			self.caesarCipherEncrypt($!m);
		} else {
			printf "%s \n", "USAGE : ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d";
		}
	}
	
	method caesarCipherEncrypt ( Str $myWord ) {	
		my $searchFOrChar = rx / (.) /;  # This regex searches for each character in the string
		
		my $arrayChar = $myWord.match( / $searchFOrChar /, :global ); 
		# This variable stores an array of characters from the string 
		# hence the $ declarations before
		
		my $ordVal;
		my $ordValConvert;
		my $newStrn="";
		
		$arrayChar.map:{ 
			$ordVal = ord($^a);
			$ordValConvert = chr (ord($^a) + $!num).Str;
			$newStrn =$newStrn ~ $ordValConvert;
			#printf "%s \n", "ordVal :: $ordVal | ordValConvert :: $ordValConvert" ;
		};

		$newStrn;
	}
	
	method caesarCipherDecrypt ( Str $myWord ) {
		my $searchFOrChar = rx / (.) /;  # This regex searches for each character in the string		
		my $arrayChar = $myWord.match( / $searchFOrChar /, :global ); 
		# This variable stores an array of characters from the string 
		# hence the $ declarations before
		
		my $ordVal;
		my $ordValConvert;
		my $newStrn="";
		
		$arrayChar.map:{ 
			$ordVal = ord($^a);
			$ordValConvert = chr (ord($^a) - $!num).Str;
			$newStrn =$newStrn ~ $ordValConvert;
			#printf "%s \n", "ordVal :: $ordVal | ordValConvert :: $ordValConvert" ;
		};

		$newStrn;
	}

}

sub MAIN ( *@wordNnum ){
	
	if @wordNnum.elems == 3 {
		#printf "%s \n", "Enough Elements";
		my $testMe = caesarCipher.new( m=>@wordNnum[0], num=>@wordNnum[1], encodeOrDecode=>@wordNnum[2] );
		printf "%s \n", $testMe.initMe();
	} else {
		printf "%s \n", "Not Enough Elements";
		printf "%s \n", "USAGE : ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d";
	}
}

# USAGE :  ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d

# Flow:
# Test if two values were sent.  
# Check the type
# If the second value is empty decipher

# LINKS 
# https://www.perlmonks.org/?node_id=873068
# https://perl6advent.wordpress.com/2009/12/07/day-7-looping-for-fun-and-profit/