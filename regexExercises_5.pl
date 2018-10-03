#!/usr/bin/perl6
#!/opt/rakudo-pkg/bin/perl6


grammar IPv4Address {
	token byte { \d ** 1..3 <?{ $/.Int <= 255 }> } ;
	token TOP { <byte> ** 4 % "." } ;
}

my $strOfIp = "127.0.0.1";

if IPv4Address.parse( $strOfIp ) {
	printf "%s ", "Example 47 : " ;
	say join ", ", $<byte>.list;
}
 
say "Example 48 : " ~ IPv4Address.subparse( $strOfIp, :rule<byte>);
printf "%s ", "Example 49 : " ;
say IPv4Address.parse( $strOfIp, :rule<byte> );


grammar StandardSQL {
	regex TOP { 'SELECT' \s+ <name>  };
	regex name { <indentifier> | <quoted_name>  };
	regex quoted_name { \" <-["]>+ \"  };
	regex indentifier { << <:alpha> \w* >> };
}

say StandardSQL.parse('SELECT salary');
say StandardSQL.parse('SELECT "monthly salary"');


if "Hello, World" ~~ /  (\w+) ", " (\w+) / {
	printf "%s \n", "Example 23 : Greeting : $0 , Audience : $1";
}
# ( ) these are called captures
# \w any character not a number
# + 1 - inifinite
# ", " string literal
# Repeat Same as above

printf "%s \n", "Example 24 : ";

my $e28 = "abcd 9 ten hello world :: ";
if $e28 ~~ / (\d+) \s+ (\w+) / {
	say $0.^name;
	printf "%s \n", "$1 ";
	say  $1.from;
	say  $1.to;
}

# ( ) these are called captures
# \d only match characters that are numbers
# + 1 - inifinite
# \s blank space
# + 1 - inifinite
# ( ) these are called captures
# \w any character not a number
# + 1 - inifinite


my $e29 = "127.0.0.1";

if $e29 ~~ /  (\d+) ** 4 % "."  /  {
	printf "%s \n", "Example 25 :  Elemes : " ~ $0.elems ~ " | 3rd position of the array : " ~ $0[3];
}
# ( ) these are called captures
# \d only match characters that are numbers
# + 1 - inifinite
# ** 4 means match exactly four capture set of digits
# % "." capture set must be seperated by a .

my $e30 = "Hello, World";

if $e30 ~~ /  $<greeting_2>= [\w+] ", " $<audience_2>=[\w+]  / {
	printf "%s \n",  "Example 26 : greeting variable : " ~ $<greeting_2> ~ " | audience variable : " ~ $<audience_2>  ;
}
# $<greeting_2>= declaring the variable to store the capture from [\w+]
# [ ] a contained capture
# \w any character not a number
# + 1 - inifinite
# ", " string literal searching for a ,
# $<audience_2>= declaring the variable to store the capture from [\w+]



my regex e31 {  \d ** 1..3 <?{ $/.Int <= 255  }>  } ;

if "127.0.0.1" ~~  /  ^<e31> ** 4 % "." $  / {
	for $<e31>.list -> $byte {
		printf "%s \n", "Example 27 : " ~ $byte;
	}

}
# \d only match characters that are numbers
# ** 1..3 match a number in length of 1 - 3 characters for example 1 - 999
# <?{ }> a place for computation that check to see if the capture meet the criteria
# $/ temporary variable that stores the capture
# .Int convert the capture to an integer
# <= 255 numerical comparison if less than equal to 255


my $e32 = "Hello, World";

my regex word2 { \w+ };

if $e32 ~~ / <greeting_3=word2> ", " <audience_3=word2>/ {
	printf "%s \n", "Example 28 :  Greeting variable : " ~ $<greeting_3> ~ " | Audience : " ~ $<audience_3> ;
}
# \w any character not a number
# + 1 - inifinite
# < > declares the variable
# greeting_3 variable declaration for regex
# word2 my regex


# Backreferences

printf "%s ", "Example 29 : Looking for duplicate duplicate words.  :: " ;
printf "%s \n", "Looking for duplicate duplicate words. " ~~ / (\w+) \s+ $0 / ;
# ( ) these are called captures
# \w any character not a number
# + 1 - inifinite
# \s blank space
# + 1 - inifinite
# $0 this variable stores the value found on the left of this regex with the capture (\w+)

printf "%s ", "Example 30 : Looking for same same words.  :: " ;
printf "%s \n", "Looking for same same words. " ~~ / << $<repeatWord>=\w+ \s+ $<repeatWord> >> / ;
# << >> are word boundaries.  They prevent regex from being greedy.
# $<repeatWord>= declaring the variable to store the capture from \w+
# \w any character not a number
# + 1 - inifinite
# \s blank space
# + 1 - inifinite
# $<repeatWord> this variable stores the value found on the left of this regex 


printf "%s \n", "Example 31 :: " ~ 50101.is-prime;
# .is-prime boolean output from s bilut in method

say "Example 32 :: ";
say "abc" ~~ /../;
# . one character 
# . one character next to the first character

say "Example 33 :: ";
say "abc" ~~ /.(.)(.)/;
# . one chacater
# ( ) these are called captures


say "Example 34 :: ";
say "abc" ~~ /.(.(.))/;
# ( ( ) ) these are nested captures

say "Example 35";
say "abc" ~~ / .(.$<char>=[.])  /;
# ( )  these are called captures
# $<char>= declaring the variable to store the capture from [.]

my $e33 = 'Searching "for all" words between "quotation marks." ::  ';

printf "%s \n", "Example 36 : " ~ $e33~  $e33.match(:global, / \" (.*?) \"  / ) ;

# :global searches the entire string and does not stop at the first find
# \" allows me to search for the string literal "
# ( ) these are called captures
# . any character
# * 0 - inifinite
# ? quantifier makes the preceding atom match zero or once
# \" allows me to search for the string literal "


# Regex in action evgery step of the way
say "aaaaaa" ~~ / ^(a+) { say "Example 37 : $0" } b /;

say "aaaaaa" ~~ / ^(a+:) { say "Example 38 : $0" } b /;
# : possessive quantifier , because the quantifier never gives up what it once possessed

say "aaaaaa" ~~ / ^(:ratchet a+) { say "Example 39 : $0" } b /;
# A second way to disable backtracking is to use the :ratchet (or :r)
# modifier, which you can also use inside a group [...] or a capture (...)

my $e34 = "Look it is <a href='..:'> my link text </a> html. :: ";
my $html-re = rx:ignorecase { '<' $<tag>= [ <[a..z]>+: ] <-[ > ]>*  '>' ( .* )  '</' $<tag> '>' };
printf "%s ", "Example 40 : $e34";
say $e34 ~~ $html-re ;


printf "%s ", "Example 41 : ";
say "abcde" ~~ /  ab | a.*  /;
printf "%s ", "Example 42 : ";
say "abcde" ~~ /  ab | a {} .*  /;


printf "%s ", "Example 43 : ";
say "alongwordbeforeadot." ~~ / \w+ >> <?before \.>  /;

# Match a balanced quoted string
my $e35 = 'This has "quotes one", "quotes two" "this fails :: ';
printf "%s \n", "Example 44 : " ~ $e35~  $e35.match(:global, /  \" <-["]>* \"  / );

# Outputting string literal without having to escape special charaters
say Q"Exmaple 45 : a\\b";

my token mynum2 { \d+ };
my rule sum { <mynum2> "+" <mynum2> };
say "Exmaple 46 : ";
say "1 + 2" ~~ / ^ <sum> $ /;

# EXTRA 


# Importants Links
# https://stackoverflow.com/questions/6448242/git-push-error-insufficient-permission-for-adding-an-object-to-repository-datab
# https://stackoverflow.com/questions/171480/regex-grabbing-values-between-quotation-marks
# https://docs.perl6.org/language/io
# https://stackoverflow.com/questions/51230072/perl6-regex-match-conjunction
# https://docs.perl6.org/language/regexes
# https://docs.perl6.org/language/regexes#Character_classes
# https://stackoverflow.com/questions/6233786/perl-regex-matching-vowels
# https://www.perlmonks.org/?node_id=592867
# https://www.perl.com/pub/2000/11/begperl3.html/
# https://www.perlmonks.org/?node_id=944253
# https://docs.perl6.org/language/regexes
# https://perldoc.perl.org/perlrecharclass.html
# https://docs.perl6.org/routine/match
# https://stackoverflow.com/questions/644714/what-regex-can-match-sequences-of-the-same-character
