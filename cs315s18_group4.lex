%{
int line_num = 1;	
%}
lb			\{
rb			\}
lp			\(
rp			\)
or			\|
and			\&
not			\!
logical_or 		"||"
logical_and		"&&"
variable		@[A-Za-z][A-Za-z0-9]*
assign_value		=|\+=|\-=|\<=|\>=|\+\+|\-\-
equals			==
not_eq			\!=
greater			\>\>
greater_eq		\>=\>
less			\<\<
less_eq			\<=\<
do			do
end			end
comment			\/\*\*.*\*\*\\
newline			\n
for			for\(
tbin			tbin
tbout			tbout
in			=\<
out			=\>
true			true
false			false
string			\".*\"
return			return
function_def		function
char_val 		\'.*\'
num_val			[+-]?[0-9]+
num			num
boolean			boolean
char			char
set			set
union			\<
intersection		\>
difference		\-
cross_product		\*
addition		\+
division		\/
if 			if
else 			else
function_name        	[A-Za-z][A-Za-z0-9]*\(
df_at			at\[[0-9]*\]
df_size			size
df_remove     	remove\[[0-9]*\]
semicol		\;
powerset_sign		\%
complement_sign	\^
partition_sign		\#
subset_sign		\/\<
superset_sign		\/\>
comma 		\,
call_sign 		\-\>

%%
[ \t]			{}
{lb}			return LB;
{rb}			return RB;
{lp}			return LP;
{rp}			return RP;
{or}			return OR;
{and}			return AND;
{not}			return NOT;
{variable}		return VARIABLE;
{assign_value}		return VALUE_ASSIGN;
{equals}		return EQUALS;
{comment}		return COMMENT;
{newline}		{line_num++;
				return NEWLINE;}
{true}			return TRUE;
{false}			return FALSE;
{string}			return STRING;
{return}		return RETURN;
{do}			return DO;
{end}			return END;
{not_eq}		return NOT_EQUAL;
{greater}		return GREATER;
{greater_eq}		return GREATER_OR_EQUAL;
{less}			return LESS;
{less_eq}		return LESS_OR_EQUAL;
{function_def} 		return FUNCTION_DEFINE;
{num}			return NUMBER;
{boolean}		return BOOLEAN;
{num_val}		return NUMERIC_VALUE;
{set}			return SET;
{for}			return FORLP;
{tbin}			return THE_BEST_IN;
{tbout}			return THE_BEST_OUT;
{in}			return INPUT;
{out}			return OUTPUT;
{union}			return UNION;
{intersection}		return INTERSECTION;
{difference}		return DIFFERENCE;
{cross_product}	return CROSS_PRODUCT;
{addition}		return ADDITION;
{division}		return DIVISION;
{char}			return CHAR;
{if}			return IF;
{else}			return ELSE;
{function_name}	return FUNCTIONLP;
{char_val}  		return CHARACTER_VALUE;
{df_size}		return SIZE;
{df_at}			return AT;
{df_remove}   		return REMOVE;
{logical_or} 		return LOGICAL_OR;
{logical_and}		return LOGICAL_AND;
{semicol}		return SEMICOL;
{powerset_sign}	return POWERSET_SIGN;
{complement_sign}	return COMPLEMENT_SIGN;
{partition_sign}	return PARTITION_SIGN;
{subset_sign}		return SUBSET_SIGN;
{superset_sign}		return SUPERSET_SIGN;
{comma}				return COMMA;
{call_sign}		return CALL_SIGN;
. 				return -1;
%%
yywrap() { return 1; }


