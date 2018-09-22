#!/usr/bin/perl6
#!/opt/rakudo-pkg/bin/perl6


my $e10 = "abc";

if $e10 ~~ m/b./ {
	printf "%s ", "Example 1 : match :: ";
	printf "%s \n", $e10 ~~ m/b./;
}

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


my $e20 = "Jump to Jump the left and then to the right again.  :: ";

$e20 ~~ s:g:i/ <?before Jump> /⇑ /;
$e20 ~~ s:g:i/ <?before left> /← /;
$e20 ~~ s:g:i/ <?after right> / →/;


printf "%s \n", "Example 15 : Jump to Jump the left and then to the right again.  :: $e20";

my $e21 = "Jump to Jump the left and then to the right again.  :: ";

$e21 ~~ s:g:i/ << /← /;

printf "%s \n", "Example 16 : Jump to Jump the left and then to the right again.  :: $e21";

my $e22 = "Jump to Jump the left and then to the right again.  :: ";
$e22 ~~ s:g:i/ << / →/;

printf "%s \n", "Example 17 : Jump to Jump the left and then to the right again.  :: $e22";

my $e23 = "Jump to Jump the left and then to the right again.  :: ";
$e23 ~~ s:g:i/ << /→/;
$e23 ~~ s:g:i/ >> /←/;

printf "%s \n", "Example 17 : Jump to Jump the left and then to the right again.  :: $e23";


my $e24 = "A file 75MB and 400GB each :: ";
$e24 ~~ s:g:i/ \d+ <?before <[MG]> B> /500/;
printf "%s \n", "Example 18 : A file 75MB and 400GB each ::  $e24";












# EXTRA 


# Importants Links
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
