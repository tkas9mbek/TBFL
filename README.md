# TBFL
CS 315 - Programming Languages team project.
<br />
TBFL(The Best Friendly Language) is a simple language designed for operations on sets. It provides users to declare a new data type ‘set’, as well as other data types, such ‘num’, ‘char’ and ‘boolean’. For example,
<br /> 	set @X = { 1, 5, 6};	is declaration and initialization of ‘set’ data type.
<br />User can do set operations and some mathematical operations on the sets: union(<), intersection(>), difference(-), cross product(*). For example,
<br />set @Y = @X - { 2, 5, 6};    /** @Y = { 1 } **\
<br />Also it provides user to write comments on code, define functions, use for-loop and if-else statement and some other features:
<br />	/** for-loop **\
<br />	for ( num @n = 0; @n << 10; @n ++) do
<br />		/** if statement **\
<br />		if( @X->size << 10) do
<br />			@X < @n;
<br />		end
<br />	end
