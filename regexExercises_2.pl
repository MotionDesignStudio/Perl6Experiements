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


my $e2="ab abbb aaaabbbbcc abbbbbbbbbcccccccc ababab :: ";

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

#printf "%s \n", $e2 ~  $e2.match(/ !wb /, :global);






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
