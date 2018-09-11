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
	
	# Begin sanity check
	if @wordNnum.elems == 3 { # Check is three parameters have been passed
		if so @wordNnum[1].Numeric { # Check if the second parameter is a number			
			my $testMe = caesarCipher.new( m=>@wordNnum[0], num=>@wordNnum[1], encodeOrDecode=>@wordNnum[2] );
			printf "%s \n", $testMe.initMe();
		}else{
			printf "%s \n", "The second parameter must be a positive or negative whole number such as 13, 2 or 10 etc.";
			printf "%s \n", "USAGE : ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d";
		}
	} else {
		printf "%s \n", "Not enough parameters passed or to many.";
		printf "%s \n", "USAGE : ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d";
	} 
	# End sanity check
}

# USAGE :  ./caesarCipher.pl ibm -1 e   --OR --	./caesarCipher.pl ibm -1 d

# Flow:
# Test if two values were sent.  
# Check the type
# If the second value is empty decipher

# LINKS 
# https://www.perlmonks.org/?node_id=873068
# https://perl6advent.wordpress.com/2009/12/07/day-7-looping-for-fun-and-profit/
# https://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Perl_6