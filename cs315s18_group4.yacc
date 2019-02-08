%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}
%start program
%token LB RB LP RP SEMICOL
%token REMOVE AT SIZE
%token CHARACTER_VALUE NUMERIC_VALUE
%token VARIABLE
%token VALUE_ASSIGN
%token AND OR LESS GREATER LESS_OR_EQUAL GREATER_OR_EQUAL LOGICAL_AND LOGICAL_OR
%token FUNCTIONLP FUNCTION_DEFINE
%token NOT
%token NUMBER BOOLEAN SET CHAR STRING
%token FORLP 
%token ELSE 
%token RETURN IF
%token NEWLINE
%token OUTPUT
%token DO END
%token INPUT OUTPUT
%token TRUE FALSE
%token COMMENT
%token ADDITION DIFFERENCE
%token CROSS_PRODUCT DIVISION
%token INTERSECTION UNION
%token THE_BEST_OUT THE_BEST_IN
%token EQUALS NOT_EQUAL 
%token POWERSET_SIGN PARTITION_SIGN
%token COMPLEMENT_SIGN 
%token SUBSET_SIGN
%token SUPERSET_SIGN
%token COMMA
%token CALL_SIGN

%left AND OR LESS GREATER LESS_OR_EQUAL GREATER_OR_EQUAL LOGICAL_AND LOGICAL_OR
%nonassoc ELSE 
%left ADDITION DIFFERENCE
%left CROSS_PRODUCT DIVISION
%left INTERSECTION UNION
%left THE_BEST_OUT THE_BEST_IN
%nonassoc EQUALS NOT_EQUAL 
%right POWERSET_SIGN PARTITION_SIGN
%left COMPLEMENT_SIGN 
%right SUBSET_SIGN
%left SUPERSET_SIGN
%%

program: 
DO stmt_list END {  printf("\nValid syntax!\n");
					return 0;}
;

stmt_list: 
stmt 
| stmt_list stmt
;

stmt:
matched_stmt
| unmatched_stmt
;

matched_stmt:
IF condition_stmts DO matched_stmt ELSE matched_stmt END
| non_alternative_stmt
;

unmatched_stmt:
IF condition_stmts DO stmt_list END
| IF condition_stmts DO matched_stmt ELSE unmatched_stmt END
;

condition_stmts:
condition_stmt 
| condition_stmts logical_operator condition_stmt
;

condition_stmt:
boolean
| VARIABLE
;

non_alternative_stmt:
assignment 
| variable_declaration 
| for_loop
| function_stmt 
| io_assignment
| COMMENT 
| NEWLINE
| SEMICOL
;

set_relation : 
superset
| subset
;

powerset: 
POWERSET_SIGN set 
| POWERSET_SIGN powerset
;

partition:
PARTITION_SIGN set 
| PARTITION_SIGN partition
;

complement:
set COMPLEMENT_SIGN
| complement COMPLEMENT_SIGN
;

superset:
set SUPERSET_SIGN set 
| superset SUPERSET_SIGN set
;

subset:
set SUBSET_SIGN set
| set SUBSET_SIGN subset
;

for_loop: 
FORLP assignment SEMICOL condition_stmts SEMICOL assignment RP DO stmt_list END
| FORLP SEMICOL condition_stmts SEMICOL assignment RP DO stmt_list END
| FORLP assignment SEMICOL condition_stmts SEMICOL RP DO stmt_list END
| FORLP SEMICOL condition_stmts SEMICOL RP DO stmt_list END
;

variable_declaration: 
parameter
| variable_type assignment 
;

assignment: 
VARIABLE VALUE_ASSIGN value 

value: 
set_element
| boolean
| math_operation 
| function_call 
| set_relation
| powerset
| partition
| complement
;

math_operation: 
NUMERIC_VALUE math_operator NUMERIC_VALUE 
| math_operation math_operator NUMERIC_VALUE 
;


set_operation:
set_val set_operator set_val
;

set_val:
LB set_elements RB
| VARIABLE
;
	
function_call: 
VARIABLE CALL_SIGN default_function 
| FUNCTIONLP parameter_list RP 
;

function_stmt: 
FUNCTION_DEFINE FUNCTIONLP parameter_list RP DO stmt_list RETURN value SEMICOL END
| FUNCTION_DEFINE FUNCTIONLP parameter_list RP DO stmt_list END
| FUNCTION_DEFINE FUNCTIONLP RP DO stmt_list RETURN value SEMICOL END
| FUNCTION_DEFINE FUNCTIONLP RP DO stmt_list END
;


parameter_list: 
parameter
| parameter_list COMMA parameter
;

parameter: 
variable_type VARIABLE
;

io_assignment: 
input_assignment 
| output_assignment 
;

input_assignment: 
VARIABLE INPUT THE_BEST_IN
;

output_assignment: 
THE_BEST_OUT OUTPUT output_vals
;

output_vals: 
output_vals OUTPUT output_val
| output_val
;

output_val:
value 
| STRING
;

boolean: 
boolean_literal
| comp_val comparison_operator comp_val
;

comp_val:
set_element
| math_operation 
| function_call 
| set_relation
| powerset
| partition
| complement
;

set: 
LB set_elements RB
| set_operation
| VARIABLE
;

logical_operator:
LOGICAL_AND
| LOGICAL_OR
;

set_elements: 
set_elements COMMA set_element
| set_element
;

set_element:
NUMERIC_VALUE
| set
| CHARACTER_VALUE
;	

variable_type:
BOOLEAN
| SET
| NUMBER
| CHAR
;

default_function:
SIZE 
| AT
| REMOVE
;
	
boolean_literal: 
TRUE 
| FALSE
;

math_operator: 
ADDITION
| DIFFERENCE
| DIVISION
| CROSS_PRODUCT
;

set_operator: 
UNION
| INTERSECTION
| DIFFERENCE
| CROSS_PRODUCT
;

comparison_operator:
EQUALS
| LESS
| GREATER 
| LESS_OR_EQUAL
| GREATER_OR_EQUAL
| NOT_EQUAL
;

%%
#include "lex.yy.c"
extern int line_num;

void yyerror( char *s )
{	
	fprintf(stderr,"\nSyntax Error in line: %d\n",line_num);
}

int main(void) {
    yyparse();
    return 0;
}