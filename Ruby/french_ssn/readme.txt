>> CONTEXT <<<

What's your number?

Write a #french_ssn_info method extracting info from French SSN (Social Security Number) using RegExp.

Valid French social security numbers have the following pattern:

1 84 12 76 451 089 46

Gender (1 == man, 2 == woman)
Year of birth (84)
Month of birth (12)
Department of birth (76, basically included between 01 and 99)
6 random digits (451 089)
A 2 digits key (46, equal to the remainder of the division of (97 - ssn_without_key) by 97.)
The method must return the following strings:

french_ssn_info("1 84 12 76 451 089 46")
=> "a man, born in December, 1984 in Seine-Maritime."

french_ssn_info("123")
=> "The number is invalid"

>> IMPORTANT TOPICS FOR SY TO COVER <<
1) Why RegEx is useful, what two contexts they are useful?
2) Value of TDD, review the concept of rspec
3) Guard clauses in our code
4) Matchdata and capture groups & their importance
5) Requiring things in Ruby
6) Sneak peak into parsing (Think of how we got the departments)
7) Coding Sequence (tests > psuedocode > code for concept > code for performance > code for elegance)

>> WHAT WE ALREADY HAVE <<
1) file structure set up for spec
2) french departments yml

