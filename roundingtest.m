clear all; clc
n = 1;
m = 3;
test = 0;

while (test*3 ~= 1)
test = test + m*10^(-n);
n = n+1;
fprintf('n is %.30f \n',n)
fprintf('test is %.30f \n',test)
fprintf('test*3 is %.30f \n\n',test*3)
end
