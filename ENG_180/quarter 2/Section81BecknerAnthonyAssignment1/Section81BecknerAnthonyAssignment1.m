%Engr 180
%Assignment one
%created by Anthony Beckner
clear all;close all;clc

%% Question 1
fprintf('\n QUESTION 1\n')
r = 12; 
C = 2*r*pi;
A = pi*r*r;

fprintf('\n The circumfrence is: %.2f \n and the Area is: %.2f\n',C,A)
%% question 2
fprintf('\n QUESTION 2\n')
rowVector = (1:2:19);
columnVector = transpose(2:2:20);
sizeRowVector = size(rowVector);
sizeColumnVector = size(columnVector);
transColumnVector = columnVector';
sizeTransColumnVector = size(transColumnVector);
result1 = rowVector + transColumnVector;
matrix = columnVector*rowVector;
scalar = rowVector*columnVector;
productMatrix = rowVector.*transColumnVector;
fprintf('\n a) The size of the vectors are: %d by %d and %d by %d.',sizeRowVector(1),sizeRowVector(2), sizeColumnVector(1),sizeColumnVector(2));
fprintf('\n b) this is the transposed column vector:\n')
disp(transColumnVector)
fprintf('\n c) The size of the row vector is: %d by %d \n The size of the column vector is: %d by %d \n The size of the Transposed vector is: %d by %d',sizeRowVector(1),sizeRowVector(2),sizeColumnVector(1),sizeColumnVector(2),sizeTransColumnVector(1),sizeTransColumnVector(2))
fprintf('\n d) The sum of the two vectors is:\n')
disp(result1)
fprintf('\n e) The two products of matrix multiplication are either the scalar value, %d, or the matrix,\n',scalar)
disp(matrix)
fprintf(' The product of element-wise multiplication is:\n')
disp(productMatrix)

%% question 3
fprintf('\n QUESTION 3\n\n  ** see graphs\n')


x = (1:100);%creates x vals
y = 20*rand(1,100);%calculates random y vals with constants for std and mean
figure(1)
%subplot(2,1,1) , plot(x,y);
hold on%so that both can be on same plot

%create first plot and appropriate labels
plot(x,y,'bD--')
title 'plot of 100 random numbers';
xlabel 'order of number';
ylabel 'value of number';

% a = x + ones(1,length(x));
% b = y + ones(1,length(y));
%subplot(2,1,2) , plot(x,y,'rx-');

%create second plot nd appropriate variablea
plot(x,y,'rx:');
title 'plot of 100 random numbers';
xlabel 'order of number';
ylabel 'value of number';

%format legend and gridlines
legend('series1','series2')
grid on

%% question 4
fprintf('\n QUESTION 4\n')

%initialize values for std and mean as well as counters
meanVal = 0;
stdVal = 50;
numbers = meanVal + stdVal.*randn(1000,1);
count1 = 0;
count2 = 0;
count3 = 0;

%for loop counts based on conditional statements
for I = 1:1:size(numbers)
    if numbers(I) > 50
        count1 = count1 + 1;
    end
    if numbers(I) >= 50
        count2 = count2+1;
    end
    if numbers(I) <= 50 && numbers(I) > 20
        count3 = count3+1;
    end
end

%printout of results
fprintf('\n a) The probability the chosen number is greater than 50 is: %.4f.',count1/1000)
fprintf('\n b) The probability the chosen number is greater than (or equal to) 50 is: %.4f.',count2/1000)
fprintf('\n c) The probability the chosen number is between 20 and 50 is: %.4f.\n',count3/1000)

%% question 5 
fprintf('\n QUESTION 5\n')

   uniformRandomNumbers = 500*rand(1000,1);%generate numbers
   
   %initialize counts
   count4 = 0;
   count5 = 0;
   count6 = 0;
   
   %for loop counts based on conditionals
   for I = 1:length(uniformRandomNumbers);
       if uniformRandomNumbers(I) > 150;
           count4 = count4 + 1;
       end
       if uniformRandomNumbers(I) >= 150; 
        count5 = count5 + 1;
       end
       if numbers(I) <= 150 && numbers(I) > 120
        count6 = count6+1;
       end
   end
   %printout of results
fprintf('\n a) The probability the chosen number is greater than 150 is: %.4f.',count4/1000)
fprintf('\n b) The probability the chosen number is greater than (or equal to) 150 is: %.4f.',count5/1000)
fprintf('\n c) The probability the chosen number is between 120 and 150 is: %.4f.\n',count6/1000)    
%% q6
fprintf('\n QUESTION 6\n')
%do calculations with the function
ca = findHypotenuse(6,8);
cb = findHypotenuse(5,12);
cc = findHypotenuse(7,24);
cd = findHypotenuse(10,10);
%print the formatted answers
fprintf('\n a) The hypotenuse, c, is: %d',ca)
fprintf('\n b) The hypotenuse, c, is: %d',cb)
fprintf('\n c) The hypotenuse, c, is: %d',cc)
fprintf('\n d) The hypotenuse, c, is: %d\n',cd)
%% q7 
fprintf('\n QUESTION 7\n')
%do calculations with the function
sum1 = matrixAdder( 10,10,0,100 );
sum2 = matrixAdder( 100,1,10,10 );
sum3 = matrixAdder( 1000,760,-25,50 );
%print the formatted answers
fprintf('\n The first sum is: %d.\n the second sum is: %d.\n The thrid sum is: %d.\n',sum1,sum2,sum3)

%% q8
fprintf('\n QUESTION 8\n')

%initialize matrix of values for calculations
matrix= [6 8 ; 5 12 ; 7 24 ; 10 10];
%character array for fprintf
strings = {'a','b','c','d'};
%for loop puts in each set of inital conditions, calculates and then prints
%the answers
for I = (1:1:4)
    a = matrix(I,1);
    b = matrix(I,2);
    [ c,p,A,i ] = findHypotenuse( a,b );
    fprintf('\n%s) The hypotenuse, c, is %d.\n The perimeter is: %d\n The area is: %d',strings{I},c,p,A)
    %conditional for last printout
    if i == 1
        fprintf('\n The triangle is isoceles.\n\n')
    elseif i == 0
        fprintf('\n The triangle is not isoceles.\n\n')
    end
end