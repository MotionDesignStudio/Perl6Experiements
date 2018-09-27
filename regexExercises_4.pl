#!/opt/rakudo-pkg/bin/perl6
#!/usr/bin/perl6




if "Hello, World" ~~ /  (\w+) ", " (\w+) / {
	printf "%s \n", "Example 23 : Greeting : $0 , Audience : $1";
}

printf "%s \n", "Example 24 : ";

my $e28 = "abcd 9 ten hello world :: ";
if $e28 ~~ / (\d+) \s+ (\w+) / {
	say $0.^name;
	printf "%s \n", "$1 ";
	say  $1.from;
	say  $1.to;
}


my $e29 = "127.0.0.1";

if $e29 ~~ /  (\d+) ** 4 % "."  /  {
	printf "%s \n", "Example 25 :  Elemes : " ~ $0.elems ~ " | 3rd position of the array : " ~ $0[3];
}

my $e30 = "Hello, World";

if $e30 ~~ /  $<greeting_2>= [\w+] ", " $<audience_2>=[\w+]  / {
	printf "%s \n",  "Example 26 : greeting variable : " ~ $<greeting_2> ~ " | audience variable : " ~ $<audience_2>  ;
}


my regex e31 {  \d ** 1..3 <?{ $/.Int <= 255  }>  } ;

#if "127.0.0.1" ~~  /  ^ <e31> ** 4 % "." $  /{
	#for $<e31>.list -> $byte {
		#printf "%s \n", "Example 27 : " ~ $byte;
	#}

#}

printf "%s \n", "Example 40 :: " ~ 50101.is-prime;


say "Example 41 :: ";
say "abc" ~~ /../;

say "Example 42 :: ";
say "abc" ~~ /.(.)(.)/;

say "Example 43 :: ";
say "abc" ~~ /.(.(.))/;

say "Example 44";
say "abc" ~~ / .(.$<char>=[.])  /;

my $e32 = 'Amanda sighed.  "It was madness", she said. "Sheer madness" ::  ';

printf "%s \n", "Example 45 : " ~ $e32~  $e32.match(:global, / \" (.*?) \"  / ) ;

#if $e32 ~~ /  \" .* \"   / {
	#printf "%s \n","Example 45 :: " ~  $/.Str;

#}




my $e11 = "If I had a hammer, I'd hammer in the morning in my Hummer :: ";
printf "%s \n", "Example 2 : " ~ $e11~  $e11.match(:global, /  h.mm\w*  / ).join("|");

# .match searching for a match
# :global search the entire string do not stop at the first found example
# h.mm matches h (any single character) mm
# \w* 0 - infinity of characers
# .join("|") places a | delimeter between the found regex 


printf "%s \n", "Example 3 : " ~ ($e11 ~~  (m:g:i/  h.mm\w*  /)).join("|");

# ($e11 this outer parenthesis is required so the return value can be passed as a list to
# method join.
# m:g:i m = match, :g = global search entire string,  :i = caseinsensitive
# h.mm string literal h
# . any single character here
# mm string literal
# \w any character not a number
# * 0 - infinity
# .join("|") returns all found regex and places a | between them

printf "%s \n", "Example 4 : " ~ ($e11 ~~  (m:g:i/  h.mm\w*  /)).elems;

# .elems counts the number of found regex

my $e12 = "1308 5th Avenue 999 :: ";
printf "%s \n", "Example 5 : " ~ $e12~  $e12.comb(/  \d+/  );
# \d any numerical character
# + 1 - inifinite

my ($city, $area, $popul) = "Berlin;891.8;3671000".split(/";"/);
printf "%s \n", "Example 6 : City : $city , Area : $area , Population : $popul ";
# split(/";"/) search for a ; and split the vaues into a array

my ($city_2, $remainder_0,) = "Berlin;891.8;3671000".split(";", 2);
printf "%s \n", "Example 7 : City : $city_2 , Remainder : $remainder_0 ";
# split(";", 2) search for a ; and split the vaues into a array all values after the first 
# elent are stored in the second position of the array

my $allResults = "Berlin;891.8;3671000".split(/";"/);
printf "%s \n", "Example 8 : City : $allResults[0] , Area : $allResults[1] , Population : $allResults[2] ";
# This demonstrates the return valaue is an array 

# SUBSTITUTION

my $e13 = "42 eur :: ";
printf "%s \n", "Example 9 : "~ $e13~  $e13.subst( rx:i/ << eur >> /, "€" );
# subst substitute
# rx regular exppression search 
# :i = caseinsensitive
# <<  >> word bounds
# eur string literal
# € string literal that replaces the regex atom eur

my $e14 = "R E M O V E | S P   A   C E  42 eur :: ";
printf "%s \n", "Example 10 : "~ $e14~  $e14.subst( :g, / \s+ /, "" );
# subst substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# \s blank space
# + 1 - inifinite
# "" string literal that replaces the regex atom \s+

my $e15 = "9 of spades, 40 of hearts, 76 of diamonds :: ";
printf "%s \n", "Example 11 : "~ $e15~  $e15.subst( :g, / \d+ /, -> $m { $m + 1} );
# :g shorthand for :global search the entire string do not stop at the first found example
# \d any numerical character
# + 1 - inifinite
# -> pass found atom a number \d+ to anonymous function 
# $m variable storing found atom a number \d+
# { } anonymous function  declaration
# $m + 1 the number add one

my $e16 = "1 2   3 :: ";
$e16 ~~ s:g/ \s+ //;
printf "%s \n", "Example 12 : 1 2   3 ::  "~ $e16;
# This modifies a variable in place
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# \s blank space
# + 1 - inifinite

my $e17 = ' "replace parenthesis around this with" << >> "AGAIN":: ';
$e17 ~~ s:g/ \" (.*?) \" /<<$0>>/;
printf "%s \n", 'Example 13 : "replace parenthesis around this with" << >> "AGAIN":: '~ $e17;
# This modifies a variable in place
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# \" the \ before the " is neccessary to search for the special character "
# ( ) creates a regex grouping
# . any character
# * 0 - inifinite
# ? quantifier makes the preceding atom match zero or once
# \" the \ before the " is neccessary to search for the special character "
# <<  >> word bounds
# $0 first found grouping in regex, because of the :g declaration each new found grouping 
# becomes $0

my $e18 = ' "replace parenthesis around this with" << >> "AGAIN":: ';

my $e19 = "I will multiple all numbers by 4 10 20 100 200 :: ";
$e19~~ s:g[  \d+  ] = 4 * $/ ;
printf "%s \n", "Example 14 : I will multiple all numbers by 4 10 20 100 200 :: $e19"  ;

# $e19~~ replaces the values stored within the variable $e19
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# [ ] grouping
# \d any numerical character
# + 1 - inifinite
# = will assign the compuation to the rigth to the regex on the left 
# 4 * $/ 4 coefficient of the regex number that was found

my $e20 = "Jump to Jump the left and then to the right again.  :: ";

$e20 ~~ s:g:i/ <?before Jump> /⇑ /;
$e20 ~~ s:g:i/ <?before left> /← /;
$e20 ~~ s:g:i/ <?after right> / →/;

# $e20~~ replaces the values stored within the variable $e20
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# :i = caseinsensitive
# / / / seperators for substituion
# <?before > places the substition to the left of regex
# Jump string leteral
# ⇑ string literal and the blank space are treated as literal
# <?after places the substition to the right of regex

printf "%s \n", "Example 15 : Jump to Jump the left and then to the right again.  :: $e20";

my $e21 = "Jump to Jump the left and then to the right again.  :: ";

$e21 ~~ s:g:i/ << /← /;

# $e21~~ replaces the values stored within the variable $e21
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# :i = caseinsensitive
# / / / seperators for substituion
# << matches all strings or characters with a space between and places the match to the left
# ← string literal and the blank space are treated as literal

printf "%s \n", "Example 16 : Jump to Jump the left and then to the right again.  :: $e21";

my $e22 = "Jump to Jump the left and then to the right again.  :: ";
$e22 ~~ s:g:i/ << / →/;

printf "%s \n", "Example 17 : Jump to Jump the left and then to the right again.  :: $e22";

my $e23 = "Jump to Jump the left and then to the right again.  :: ";
$e23 ~~ s:g:i/ << /→/;
$e23 ~~ s:g:i/ >> /←/;

# << matches all strings or characters with a space between and places the match to the left
# >> matches all strings or characters with a space between and places the match to the right

printf "%s \n", "Example 17 : Jump to Jump the left and then to the right again.  :: $e23";


my $e24 = "A file 75MB and 400GB each :: ";
$e24 ~~ s:g:i/ \d+ <?before <[MG]> B> /500/;
printf "%s \n", "Example 18 : A file 75MB and 400GB each ::  $e24";

# $e24~~ replaces the values stored within the variable $e24
# s shorthand for substitute
# :g shorthand for :global search the entire string do not stop at the first found example
# :i = caseinsensitive
# / / / seperators for substituion
# \d any numerical character
# + 1 - inifinite
# <?before > places the substition to the left of regex
# <[ ]> this is a character class declaration
# MG matches M or G before the B 
# B is the string literal
# 500 string literal will replace the numbers before the MB or GB

my $e25 = "Hello, World";
my $audience = "World";
my $greeting = "Hello";

if $e25 ~~ / $greeting ', ' $audience  / {
	printf "%s \n", "Example 19 : Executed Stuff Here";
}

# $audience $greeting demonstrates how to store strings in variables used as regex

# If you want to interpret the contents of a variable as a regex, you have to include it in angle brackets: 
# Moritz Lenz-Parsing with Perl 6 Regexes and Grammars. A Recursive Descent into Parsing-Apress (2017)

my $audience_2 = "\\w+";
my $greeting_2 = "Hello";

# \\ backslash introduces an escape sequence (such as \n for a newline, or \t for a tabulator)

if $e25 ~~ / $greeting_2 ', ' <$audience_2>  / {
	printf "%s \n", "Example 20 : Executed Stuff Here";
}

# <$audience_2> the < > interprets the contents of variable $audience_2 as a regex

my @numArray = "one", "two", "three";
my $rx_1 = /  @numArray /;

# $rx_1 is equivalent $rx_2
my $rx_2 = /  [ "one" | "two" | "three"]  /;

my $counter_1 = 0;
my $e26 = "How 10 many 20 numbers 30, 40 | 50 \ 60 / 70 & 80 :: ";

if $e26 ~~ /  [ \d+ { $counter_1++ } \D*  ]+  / {
	printf "%s \n", "Example 21 : $e26 $counter_1";
}

# [ ] regex cluster
# \d any numerical character
# + 1 - inifinite
# { } anonymous function  declaration
# $counter_1++ adds 1 to the variable $counter_1
# \D matches a single character that is not a digit
# * Zero or more

my $e27 = / ^ \d ** 0..3 $ <?{ $/.Int <= 255 }>  / ;

for 0, 100, 255, 256, 1000 -> $num_10 { 
	#printf "%s \n", $num_10;
	if $num_10 ~~ $e27 {
		printf "%s \n", "Example 22 : $num_10";
	}
}

# ^ line start with
# \d any numerical character
# ** 0..3 the numerical match must be in lengths of 1 to 3 charactes
#  $ end of line match
# <?{ ... }> You can use the form <?{ ... }> instead to influence the regex match. If the code
# inside that block returns a false value, the match fails
# $/ variable that stores the the found regex to the left
# .Int converts value to number
# <= 255 is the integer found less than or equal to 255



# EXTRA 


# Importants Links
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
