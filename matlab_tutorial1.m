%%
%{
Welcome to Matlab (MATRIX LABORATORY)
1.1 Introduction to Matlab Coding and File systems
%}

%% 1.1 Comment and Creating Sections (blocks)

%Clearing the console
clc
%clearing the workspace
clear

% This creates a single line comment
a = 1;

%{
This is how 
to create multi line
comments
%}

b = 2;

%If we put two '%' next to each other, we create a section
%This allows us to segment the code for purposes of debugging and ease of
%tasking.


%% 1.2 Basics of Matlab Coding

%Printing values into the console
a 

b; %using a semicolon supresses console output

a+b, a-b, a*b, a/b

a1 = a+b
a2 = a-b
a3 = a*b
a4 = a/b

a5 = A/b % Matlab is case sensitive

%% 1.3 Matricies and Arrays (Data Types)

[1,2,3]

A = [] %empty array

A1 = [1,2,3,4,5]; %simple array

A2 = ['a','b','c']; %array of strings, characters


B = [1,2,3
    4,5,6
    7,8,9] % using multilines

B1 = [1 2 3;4 5 6;7 8 9] % using semi colons

C = [[1 2;3 4];[5 6; 7 8]] %Array of Arrays

%calling particular values within an array
C12 = C(1,2) %printing the value of C in row 1, column 2

%changing a particular value
C(1,3) = 10

%creating a sub array
C_1 = [C(1,2) C(2,2) C(3,2)]

%Manipulating an array
C_A = C + 5
C_B = C - 20
C_C = C * 3
C_D = C / 4

%size of an array
size(C)
%% 1.4 Creating Values
% you can always write your own
D = [1 2 3 4 5 6];

%colon operator 
D2 = [1:1:6.6] % when you have a min and max value and want a particular spacing between values

%linspace
D3 = linspace(1,10,25) % when you have a min and max value and want a particular nuumber of values.

E0 = zeros(5)
E1 = ones(5,2)
E2 = eye(4,6)


%% 1.5 Important Operators

A = 4;
%if loops are used as a conditional check to perform a task

% if A<10
%     A2 = 33;
% elseif A > 10
%     A2 = 44;
% elseif A > 100
%     "damn"
% else
%     A2 = 22;
% end
% A2

%while loops are again conditional, in this case for a larger set of
%conditions
while A < 10,
    "Adding one"
    A = A+1
end

%for loops are conditional, where the set is based on 
for i = 1:3:20
    E2(i) = 10;
end
E2

%% 1.6 Functions

%Functions can be used to simplify repetitive tasks and reduce on screen
%code

%write a code that does all 4 algebraic operations
alg(4,5)

function [tot] = alg(x,y)
add = x+y;
sub = x-y;
mult = x*y;
div = x/y;
tot = [add sub mult div];
end
