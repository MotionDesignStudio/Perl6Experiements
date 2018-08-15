#!/opt/rakudo-pkg/bin/perl6

# A succession of 10 digits within a longer string

my Str $ex1 = "abcd0123456789EFGHI";

printf "%s \n", "A succession of 10 digits within a longer string ::  $0" if $ex1 ~~ / (\d ** 10) /;  # The number is 0123456789

# A valid octal number (octal numbers use only digits 0 to 7)

my Str $ex2 = "abcd1051710EFGHI3928920";

printf "%s \n", "A valid octal number (octal numbers uses only digits 0 to 7) ::  $0" if $ex2 ~~ / ( <[0..7]> **7..*) /;  

my Str $ex3 = "Theeee first word at the start of a string.";

printf "%s \n", "The first word at the start of a string :: " ~ $/.prematch if $ex3 ~~ / \s /; # prematch displays what was before the match.  
# I am mathcing the first blank space with the \s+

my Str $ex4 = "The first word not all that starts with alpabet letter 'a' :: ";

printf "%s \n", $ex4 ~ $ex4.match(/a\w+/, :global)[0];

my Str $ex5 = "Match all the words of a string starting with a lowercase vowel amen :: ";

printf "%s \n", $ex5 ~  $ex5.match(/ <|w><[aeiou]>\w*<|w> /, :global); 

printf "%s \n", $ex5 ~  $ex5.match(/ <|w><[aeiou]>\w* /, :global); 

printf "%s \n", $ex5 ~  $ex5.match(/ << <[aeiou]>\w* >> /, :global);

printf "%s \n", $ex5 ~  $ex5.words.grep: *.starts-with: any <a e i o u>;

# <|w> starting word boundary
# <[aeiou]> character class a,e,i,o,u this after <|w> mean any word starting with these letters
# \w matches a single word character, i.e. a letter
# * after \w means zero or more characters
# <|w> means word boundary ending with a character or not it is not necessary 

my $ex6 = "French mobile telephone number have 10 digits and start with “06” or “07” such as 061234567P 0712345678 not 2151234567 0787654321 :: ";

printf "%s \n", $ex6 ~  $ex6.match(/ <|w>0<[67]>\d **8 /, :global);

# <|w> is the word boundary stating must start with a 0 in this case
# <[67]> is a character class and means 6 or 7 so it will match 06 or 07
# \d means match a numberical character only
# **8 means match 8 number characters after the 0 and 6 or 7

my $ex7 = "The first word Of a string starting with a vowel in either upper- Or lowercase :: ";

printf "%s \n", $ex7 ~  $ex7.match( / <|w>:i<[aeiou]>\w* /, :global)[0];

# The :i outside the characte class means case insensative
# .match creates an array of matches because of the :global it grab all it can find.  
# [0] is the first position of the array

printf "%s \n", $ex7 ~  $ex7.match( / <|w>:i<[aeiou]>\w* /);

# remove the :global the matching stops at the first positive match ie Of

my $ex8 = "The first occurrence of a double letter (the same letter twice in a row) bookkeeping see three morass :: ";

printf "%s \n", $ex8 ~  $ex8.match( / :i(\w)$0+ /, :global)[0];

#printf "%s \n", $ex8 ~~ m:i:g / (\w)$0+ / ;


my $ex9 = "Christmas 2016-12-25. :: ";

printf "%s \n", $ex9 ~  $ex9.match( / (<[\d-]>+) /, :global);

# I must create a character class using ( )
# < > inside of the is where I place my search it is necessary for a character to have this it must look like this (<>)
# \d means and numerical digit
# - is the cracter I am searching for after any set of digits

printf "%s \n", $ex9 ~  $ex9.match( / (<[\d-]> ** 10 ) /, :global);

# the ** means search for a string with numbers and dashes - between them that is no shorter than 10 characters long

printf "%s \n", $ex9 ~  $ex9.match( / ( \d **4 \- \d\d \- \d\d ) /, :global);

# This is a very descriptive match 
# Because I am using a match I need t oplace them inside a ()
# \d means search for digits
# **4 means four characters in length
# \- escape and search for the -


# Importants Links
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

