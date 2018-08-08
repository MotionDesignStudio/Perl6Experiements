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

#printf "%s \n", "The first word not all that start with alpabet letter 'a' :: "  if $ex4 ~~ / (a\w+) /;

printf "%s \n", $ex4 ~ $ex4.match(/a\w+/, :global)[0];

# Importants Links
# https://docs.perl6.org/language/regexes
# say $/.prematch if 'Match the first word.' ~~ / \s /;

