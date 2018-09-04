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

# The :i outside the character class means case insensative
# .match creates an array of matches because of the :global it grab all it can find.  
# [0] is the first position of the array

printf "%s \n", $ex7 ~  $ex7.match( / <|w>:i<[aeiou]>\w* /);

# remove the :global the matching stops at the first positive match ie Of

my $ex8 = "The first occurrence of a double letter (the same letter twice in a row) bookkeeping see three morass :: ";

printf "%s \n", $ex8 ~  $ex8.match( / :i(\w)$0+ /, :global)[0];

# (\w) means a word character, if you wanted any character in a language use . there instead
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

my $yr2 = rx / <[1..9]> <[0..9]><[0..9]> <[0..9]>   /;

# This solutions range is 1000 - 9999

printf "%s \n", $ex12 ~  $ex12.match( / ( $yr2 \s $mnth2 \, \s $theday2) /, :global);

my $ex13 = "This is an IPv4 address 192.168.1.222 it must have 4 sets of numbers ranging from 1 - 255  27.36.1.255 FAIL > 77 999.569.22.40 :: ";


my $myIP1 = rx / ( << \d+ >> ) ** 4 % '.' <?{ $0.all < 256}>  /;

# () this creates a capture set, something I can compare a contain of my search
# << >> are called word boundaries, so am searchung for a boundary of numbers
# \d means and numerical character
# # + means 1 to inifinite repeation of the same things being searched for
# ** means search for this : ( << \d+ >> )  four times 
# % % modifier to any of the above quantifiers to specify a separator that must occur between each of the matches.
# For example, a+ % ',' will match a or a,a or a,a,a, etc.
# % '.'  means search for a . between my four sets of numbers
# $0.all this is a little confusing.  I know the $0 is the first found of an array of founs objects and all 
# I think means every object in the array to be tested for less than 256 


printf "%s \n", $ex13 ~  $ex13.match( / $myIP1 /, :global);

my $ex14 = "27.36.1.255, 77, 999.569.22.40, 444.55.66.88, 99.87.78.90 and 192.168.1.266 :: ";

my $ipv4 = rx / << \d  ** 1..3 >> <?{ $/ >=0 && $/ <= 256 }> /;

printf "%s \n", $ex14 ~  $ex14.match( / $ipv4 ** 4 % "." /, :global);

# This solution for searching for ipv makes more sense.
# This << >> are the most importnat. This is a word bound and will stop the backtracking 
# \d means any digit character
# ** 1..3 means any number 1 - 3 units in length
# <?{  }> This is an if then statment.
# $/ is the variable that stores the found atom
# >=0 && is the atrom or found number greater than or equal to 0
# <255 is the atrom or found number less than or equal to 255

my $ex15 = "abcdefg :: ";

printf "%s \n", $ex15 ~ $ex15.subst( /c \w+ f/, "SUBST");

# subst is a subroutine to substitue one string for another
# /  / are the boundaryies of the regex
# c means starting at this character
# \w+ mean any letter character at least one to infinity
# f is the last found atom in the regex 
# this means starting at c one or more letter characters ending with f
# "SUBST" is what will replace it

my $ex16 = "abcdefg :: ";
$ex16 ~~ s/ c \w+ f /SUBST/;
printf "%s \n", $ex16 ;

my $ex17 = "There can be twly two :: ";
$ex17 ~~ s/tw/on/;
printf "%s \n", $ex17;

# Match the string literal tw
# /on replace tw with on

my $ex18 = "Xmas = 2016-12-25";
$ex18 ~~ s/ (\d **4) \- (\d\d) \- (\d\d) / $2-$1-$0  /;
printf "%s \n", $ex18;

# (\d **4) means find a number four digits in length
# (\d\d) means find a number 2 digits in length
# \- escapes the -
# the ( ) around the atom is important.  It groups them so I can refere to them with the $0, $1 and $2
# $2 is the 3rd found atom that contains the day of the month
# $1 is the 2nd found atom that contains the month
# $0 is the 1st found atom that contains the year


#say "27.36.1.255 FAIL > 77 999.569.22.40".match(/ ( « \d+ » ) ** 4 % '.' <?{ $0.all < 256}> /, :global);



# Importants Links
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
