%% PROBLEM 1

%Set variables for the first equation
x = 5;
a = (pi/2);
y = 3*x + a;
%comupte and display
Equation1 = (x*(a^4-5))/(2*y-x*a);
disp(Equation1)

%second equation
num = -1;
%compute
Equation2 = (((sin(3*pi/2))*(cos(pi/4)))/(2^(1/2))) - num;
disp(Equation2)

%third equation
%set up variables
x = -900;
y = x;
z = -x;
Equation3 = (3*y/(4-2*(3*x)))+(33*x*(z-10));
disp(Equation3)

%% PROBLEM 2

anglesDegrees = (0:10:1080);
sineDegrees = sind(anglesDegrees);
cosineDegrees = cosd(anglesDegrees);
sqSum = sineDegrees.^2 + cosineDegrees.^2;
disp(sqSum)

%% Problem 3

figure(1)
plot(anglesDegrees, sineDegrees,'b-')
hold on
plot(anglesDegrees, cosineDegrees, 'r-')
plot(anglesDegrees, sqSum, 'g-')

X = [0:1080]; Y = [0]
plot(X,Y,'r--') 

figure(2)
t = (0:0.01:5);
y = exp(-t/2);
plot(t,y)

%% Problem 4

figure(1)
legend('sineDegrees','cosineDegrees','sqSum')
title('sine, cosine and square sum of angles')
xlabel('Angles')
ylabel('functions')
grid on
axis([0 1080 -1.5 1.5]) 

figure(2)
title('exponential graph')
xlabel('t')
ylabel('y')
grid on

%% Problem 5

numbers = rand(1,1000);

for i = 1:1000;
    if i == 641 || i == 501 || i == 795 || i == 999;
        if numbers(i) > .5
            disp(numbers(i))
        end
    end

end
