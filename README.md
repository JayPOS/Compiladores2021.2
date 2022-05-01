# Final homework for Compilers UFRRJ's CS course discipline (2021.2)

* This repository contains 3 tasks:

## Task 1

* Just a lexer that recieves an alpha numeric token and checks if its palidrome or not. Anything else is considered as an error.

## Task 2

* There are 2 programs in this task, one is the testeYACC that is just an experimental program in order to test the combination of flex and bison(yacc), the other one is a calculator (called opYACC) that comports storage of data.

* Let's enter in details about both programs:

    * First, about the testeYACC: it recieves 2 tokens, a alphabet input string and a integer number. If it is a string than it says it is a string. if it is a number, then checks if it is greater than or less or equal than a previously set number.

    * Now about the opYACC: The calculator works in a way close to python terminal, in terms of usage for mathematical operations. Except that not all math functions are implemented yet, and the variables only comport lower case words with size of maximum 32 characters. It comports the following operations actually:
        * \+ (sum)
        * \- (subtraction)
        * \* (multiplication)
        * \/ (division)
        * \^ (power)
        * data storage (variables creation)
    
    * 

    * The implementation of built in functions for the calculation is ongoing, soon enough functions as sin, cos, atan, log and others will be available.

## Task 3

 * not implemented yet.