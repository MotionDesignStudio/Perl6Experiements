#!/opt/rakudo-pkg/bin/perl6


$_ = 3;
my $d =3;
printf "%s \n", "yes" if /"$d"/;
printf "%s \n",  "yes" if /"{1+2}"/;

# The $_ variable is a built in temporary variable holder  
# "$d" must be between doible quotes or it will fail if between ''
# The single quotes will try to do a macth literal
# "{1+2}" Anything between the "{}" if code will be computed 

my $e1="I love hyperlinking! :: ";
printf "%s \n", "$e1 1 Contains 'perl' " if $e1 ~~ /"perl"/;
#printf "%s \n", "$e1 2 Contains 'perl' " if $e1 ~~ /pe rl/; #Uncoment to see how the space is ignored
printf "%s \n", "$e1 3 Contains 'perl' " if $e1 ~~ /"pe rl"/;

# Notice how the third string literal does not match
# Betweent the double quotation marks treats white space a literal
# The second example ignores white space


# Begin Crossword Puzzle Helper 
=begin comment
if  '/usr/share/dict/words'.IO.e {
	for '/usr/share/dict/words'.IO.lines -> $word {
		say $word if lc($word) ~~ / ^ .e.rl $ /;
	}
	
	# for loop that searches for words with _e_rl with the files /usr/share/dict/words
	# lc is a built in function that turn the string to lower case
	# say $word will display the original word not the lower case version

	# for '/home/lex/share/php/homonyms/wordsEn.txt'.IO.lines -> $word {
	
	for $fh -> $word {
		say $word if lc($word) ~~ / ^ .*perl.* $ /;
	}
	
	#for $fh -> $word {
	#	say $word if lc($word) ~~ / ^ .*perl.* $ /;
	#}
	# .* means 0 or more characters before and after the string literal perl 
	# lc is a built in function that turn the string to lower case
	# Search for words that have the string perl within
	
} else {
	printf "%s \n", "File does not exist";
}
=end comment
# Delete this line =end comment and =begin comment above to see how the this crossword puzzle helper works
# End Crossword Puzzle Helper 


my $e2="ab abbb aaaabbbbcc aabbbbbbbbbaaacccccccc ababab :: ";

printf "%s \n", $e2 ~  $e2.match(/ a+ /, :global);
# a is the string literal
# + means one or more a
printf "%s \n", $e2 ~  $e2.match(/ a[b+] /, :global);
# a is the string litreral meaning only one a
# b is the string literal
# + means one or more b
# [ ] is the atom

printf "%s \n", $e2 ~  $e2.match(/ [ab]+ /, :global);
# [ab] This atam contains the strings literal ab
# the + outside the [ab] means one to inifinite recurences of ab

# Regex Quantifiers

printf "%s \n", $e2 ~  $e2.match(/ b ** 4 /, :global);
# b is the string literal
# ** 4 means match exactly 4 b's
printf "%s \n", $e2 ~  $e2.match(/ a ** 2..4 /, :global);
# a is the string literal
# 2..4 means match a range of a's 2-4
printf "%s \n", $e2 ~  $e2.match(/ b ** 2..* /, :global);
# b is the string literal
# ** 2..* means 2 - infinitity

my $e3 = "Letters here 4,294,967,295.00 4,294,967 123.334.523 4,2.99 4,3.99.77,88 4,4.99,77  Words around :: ";
printf "%s \n", $e3 ~  $e3.match(/ [\d+] ** 2..* % ',' /, :global);
# [\d+] is an atom for any numerical character
# ** 2..* % ',' means must have a minimum of two numbers one on each side of a comma ex. 4,2

# Disjunction

my $e4="aab :: ";
printf "%s \n", $e4 ~  $e4.match(/ a+ | \w+ / );
printf "%s \n", $e4 ~  $e4.match(/ a+ || \w+ / );

my $e5="Up to 200 MB , 900  kB 1000 TB 2000TB :: ";

printf "%s \n", $e5 ~  $e5.match( / \d+ <?before \s* <[kMGT]>? B  >   /, :global );
# \d+ match 1 - inifinite characters that are digits
# ?before before the kb, MB, Gb or TB
# \s* means zero - infinite amounts of blank space
# <[kMGT]> character class kMGT
# B string literal
# The character class kMGT before the srting literal B will test positive for
# kB, MB, GB or TB

#say "Letters here 4,294,967,295.00 4,294,967 123.334.523 4,2  Words around :: " ~~ m:global/ [\d+] ** 2..* % "," / ;

my $e6 ="Phone numbers 52-14-54 917.234.5678, 1-526-553-1234, 1.917.123.4567 or FAIL > 1.2.2.212.355.75663  :: ";
my $phonenumber = rx / \d* [<[.-]>]* [ << \d  ** 3..4 >> ] ** 3 % <[.-]> /;
printf "%s \n", $e6 ~  $e6.match( / $phonenumber /, :global );
# This is a reuse of a previous solution to find ip addreses
# This << >> are the most importnat. This is a word bound and will stop the backtracking 
# \d any digit character
# ** 1..4 any number 1 - 4 units in length
# [ ] This must be an atom for it to be quantifiable
# ** 3..* must have a minimum of three numbers seperate by - or . ex 1.917.123 or 1-526-553
# % is where I declare my delimiter
# <[.-]> character class containing . and - either will match those between the phone numbers

#  my $ipv4 = rx / << \d  ** 1..3 >> <?{ $/ >=0 && $/ <= 256 }> /;


# Importants Links
# https://docs.perl6.org/language/io
# https://stackoverflow.com/questions/51230072/perl6-regex-match-conjunction
# https://docs.perl6.org/language/regexes
# say $/.prematch if 'Match the first word.' ~~ / \s /;
# https://docs.perl6.org/language/regexes#Character_classes
# https://stackoverflow.com/questions/6233786/perl-regex-matching-vowels
# https://www.perlmonks.org/?node_id=592867
# https://www.perl.com/pub/2000/11/begperl3.html/
# https://www.perlmonks.org/?node_id=944253
# https://docs.perl6.org/language/regexes
# https://perldoc.perl.org/perlrecharclass.html
# https://docs.perl6.org/routine/match
# https://stackoverflow.com/questions/644714/what-regex-can-match-sequences-of-the-same-character
