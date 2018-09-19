#!/opt/rakudo-pkg/bin/perl6
#!/usr/bin/perl6



my $e10 = "abc";

if $e10 ~~ m/b./ {
	printf "%s ", "Example 1: match :: ";
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

printf "%s \n", "Example 4: " ~ ($e11 ~~  (m:g:i/  h.mm\w*  /)).elems;



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
# \d+ matches 1 - inifinite characters that are digits
# ?before before the kb, MB, Gb or TB
# \s* means zero - infinite amounts of blank space
# <[kMGT]> character class kMGT
# B string literal
# The character class kMGT before the srting literal B will test positive for
# kB, MB, GB or TB

my $e6 ="Phone numbers  917.234.5678, 1-526-553-1234, 1.917.123.4567 or FAIL > 0.0.0.000.000.00000, 1..111.111.1111 , 22-222-222-2222 , 52-14-54 :: ";
my $phonenumber = rx / <?after [^|\s]> \d? [<[.-]>]?  [ << \d  ** 3..4 >> ] ** 3 % <[.-]> /;

printf "%s \n", $e6 ~  $e6.match( / $phonenumber /, :global );

#say ("Phone numbers  917.234.5678, 1-526-553-1234, 1.917.123.4567 or FAIL > 0.0.0.000.000.00000, 1..111.111.1111 , 22-222-222-2222 , 52-14-54" ~~ m:g/<?after [^|\s]> [\d <[.-]>]? [\d ** 3] ** 2 % <[.-]> <[.-]> \d ** 4/)>>.subst: /\D+/, "", :g ;

# say "Phone numbers  917.234.5678, 1-526-553-1234, 1.917.123.4567 or FAIL > 0.0.0.000.000.00000, 1..111.111.1111 , 22-222-222-2222 , 52-14-54" ~~ m:g/ <?after [^|\s]>  [\d <[.-]>]?  [\d ** 3] ** 2 % <[.-]>  <[.-]> \d ** 4 / ;

# This is a reuse of a previous solution to find ip addreses

# \d any character that is a digit
# * matches 0 - infinite any character that is a digit
# [ ] creating a capture group 
# <[]> Character class capture
# .- either a dot or dash will work as a delimter here
# # * matches 0 - infinite 

# Conjunction

printf "%s \n", "Conjunction Example 1 : " ~ $e6 ~  $e6.match( / <$phonenumber> & .* 917 . * /, :global );

# & joins the logic together
# .* 0 or infinite amout of charcter(s) before 
# 917 is a string literal
# .* means 0 or infinite amout of charcter(s) after 
# This will search the string literal within the properly formatted found telephone numbers

printf "%s \n", "Conjunction Example 2 : " ~ $e6 ~  $e6.match( / <$phonenumber> & <-[9]>*  /, :global );

# - will reject any of the phone numbers with a 9 in it.

# Look Ahead Assertion

my $e7 ="Numbers before category 100 200 MB 3000 kB 4000 GB 5000 TB :: ";

my $numberfore1 = rx / \d+ <?before \s* <[kMGT]>? B >  /;
printf "%s \n", "Look Ahead Assertion 1 : " ~ $e7~  $e7.match( / <$numberfore1> /, :global );

# \d+ matches 1 - inifinite characters that are digits
# <?before > everything after the number(s) is what we will exclude
# \s* zero - infinite amounts of blank space
# <[kMGT]> character class, matches kMG or T before the string literal B
# ? zero or once of the characters within the character class
# B is a string literal


my $noNumBerfore = rx / << \d+ >> <!before \s* <[kMGT]>? B >  /;
printf "%s \n", "Look Ahead Assertion 2 : " ~ $e7~  $e7.match( / <$noNumBerfore> /, :global );

# << >> is a word bound to macth the entire number.  This prevent look behind and it testing
# positive for 20, 300, 400 or 500
# <!before > the ! mark match a number that is not followed by such a unit


my $e8 = "After commas 400,300 600,500 :: ";
my $afterComma = rx / <?after \, > \d+  /;
printf "%s \n", "Look Back Example 1 : " ~ $e8~  $e8.match( / <$afterComma> /, :global );

# <?after finds things after the pattern
# \ the slash allows me search for a comma literal
# , this is a string literal 
# \d+ matches 1 - inifinite characters that are digits

my $afterCommaNegate = rx / <!after \, > << \d+ >>  /;
printf "%s \n", "Look Back Example 2 With Negate : " ~ $e8~  $e8.match( / <$afterCommaNegate> /, :global );
#  <!after the ! means return the values before the comma

my $e9 = "If I had a hammer, I'd hammer in the morning :: ";
my $findHammer = rx / h.mm\w*  /;

printf "%s \n", "Find hammer : " ~ $e9~  $e9.match( / <$findHammer> /, :global );





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
