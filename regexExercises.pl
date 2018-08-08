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

my Str $ex5 = "Match all the words of a string starting with a lowercase vowel :: ";

#printf "%s \n", $ex5 ~ $ex5.match(/ <[aeiou]> <|w> <|w> \s /, :global);

#say "Match all the words of a string starting with a lowercase vowel :: ".match(/ <[aeiou]><|w><|w>\s /, :global);

say "Match all the words of a string starting with a lowercase vowel amen :: ".match(/ <|w><[aeiou]>\w*<|w> /, :global); 

say "Match all the words of a string starting with a lowercase vowel amen :: ".match(/ <|w><[aeiou]>\w* /, :global); 

say "Match all the words of a string starting with a lowercase vowel amen :: ".match(/ << <[aeiou]>\w* >> /, :global);

say "Match all the words of a string starting with a lowercase vowel :: ".words.grep: *.starts-with: any <a e i o u>;

# <|w> starting word boundary
# <[aeiou]> character class a,e,i,o,u this after <|w> mean any word starting with these letters
# \w matches a single word character, i.e. a letter
# * after \w means zero or more characters
# <|w> means word boundary ending with a character or not

# Importants Links
# https://docs.perl6.org/language/regexes
# say $/.prematch if 'Match the first word.' ~~ / \s /;
# https://docs.perl6.org/language/regexes#Character_classes
# https://stackoverflow.com/questions/6233786/perl-regex-matching-vowels
# https://www.perlmonks.org/?node_id=592867

