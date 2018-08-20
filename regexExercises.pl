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

# (\w) means a word character, if you wanted any character in a language use . there insted
# $0 mean go back into what was found in the (\w) and use that as the character next to it
# + means 1 to inifinite repeation of the same character


my $ex9 = "All occurrences of words with double letters twice in a row) bookkeeping see three morass :: ";

printf "%s \n", $ex9 ~  $ex9.match( / \w*(\w)$0+\w* /, :global);

# \w* any character that is a letter the * means zero - infinity times
# (\w) means a word character, if you wanted any character in a language use . there insted
# $0 mean go back into what was found in the (\w) and use that as the character next to it
# + means 1 to inifinite repeation of the same character
# \w* any character that is a letter the * means zero - infinity times after finding occurance of the same letter

my $ex10 = "The second occurrence of a double letter :: ";

printf "%s \n", $ex10 ~  $ex10.match( / (\w)$0+ /, :global)[1];

# (\w)$0+ this explained above will create a list of all the double letters found.  
# You reference the second position of the list by using the [1]


my $ex11 = "Christmas 2016-12-25. :: ";

printf "%s \n", $ex11 ~  $ex11.match( / (<[\d-]>+) /, :global);

# I must create a character class using ( )
# < > inside of the parentheses is where I place my search it is necessary for a character to have this it must look like this (<>)
# \d means and numerical digit
# - is the cracter I am searching for after any set of digits

printf "%s \n", $ex11 ~  $ex11.match( / (<[\d-]> ** 10 ) /, :global);

# the ** means search for a string with numbers and dashes - between them that is no shorter than 10 characters long

printf "%s \n", $ex11 ~  $ex11.match( / ( \d **4 \- \d\d \- \d\d ) /, :global);

my $v1 = $ex11 ~~ /(\d ** 4) \- (\d\d) \- (\d\d)/;

printf "%s \n", $v1.prematch;
printf "%s \n", $v1.postmatch;

my $ex12 = "Christmas 4018 12, 30. :: ";

my $yr = rx / \d **4..* <?{ $/ >=1900  }> /;

# \d mean searching for a digit
# **4..* means four or more digits in length that is never below 1000 less than infinity
# <?{ $/ >=1900  }> thi si san ifthen state that checks my match to make sure the number is greater than or equal to 1900

my $mnth = rx / \d **2 <?{ 1 <= $/ <= 12 }> /;

# \d mean searching for a digit
# **2 mean it has to be one - two digits in length
# <?{ 1 <= $/ <= 12 }> this is an if then statement the number for a month must be greater than 0 less than 12 

my $theday = rx / \d **2 <?{ 1 <= $/ <= 31 }> /;

#printf "%s \n", $ex12 ~  $ex12.match( / (\d **4 \s \d\d \, \s \d\d) /, :global);

printf "%s \n", $ex12 ~  $ex12.match( / ($yr \s $mnth \, \s $theday) /, :global);

my $mnth2 = rx / 1<[0..2]> || 0<[1..9]> /;
#my $theday2 = rx / 0<[1..9]> || 1<0..9]> || 2<[0..9]> || 3<[0..1]> /;

my $theday2 = rx / 0<[1..9]> || 1<[0..9]> || 2<[0..9]> || 3<[0..1]> /;

my $yr2 = rx / <[2..9]> <[0..9]><[0..9]> <[0..9]>   /;


printf "%s \n", $ex12 ~  $ex12.match( / ( $yr2 \s $mnth2 \, \s $theday2) /, :global);

#my $yr2 = rx //;


# This is a very descriptive match 
# Because I am using a match I need to place them inside a ()
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
# https://stackoverflow.com/questions/644714/what-regex-can-match-sequences-of-the-same-character

