# TBFL
CS 315 - Programming Languages team project.
<br />
TBFL(The Best Friendly Language) is a simple language designed for operations on sets. It provides users to declare a new data type ‘set’, as well as other data types, such ‘num’, ‘char’ and ‘boolean’. 
<br />For example,
<br />&nbsp;&nbsp;&nbsp;&nbsp;set @X = { 1, 5, 6};	is declaration and initialization of ‘set’ data type.
<br />User can do set operations and some mathematical operations on the sets: union(<), intersection(>), difference(-), cross product(*). For example,
<br />&nbsp;&nbsp;&nbsp;&nbsp;set @Y = @X - { 2, 5, 6};    /** @Y = { 1 } **\\
<br />Also it provides user to write comments on code, define functions, use for-loop and if-else statement and some other features:
<br />&nbsp;&nbsp;&nbsp;&nbsp;	/** for-loop **\\
<br />&nbsp;&nbsp;&nbsp;&nbsp;	for ( num @n = 0; @n << 10; @n ++) do
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/** if statement **\\
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if( @X->size << 10) do
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	@X < @n;
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end
<br />&nbsp;&nbsp;&nbsp;&nbsp;end
