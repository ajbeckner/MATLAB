%engr180 quiz 8 code
%created by AJ --you're welcome in advance bitches.

%****ONLY RUN AS SECTIONS*****
%AND MAKE SURE YOU TAKE THE PART ONE ANSWERS 
%OUT OF SCIENTIFIC NOTATION.
%just move the decimal ONE PLACE.
%you cant possibly mess that up can you?
%% 
clear all 
clc
set = zeros(50,1);
eyeH = input('what is the eye height?');
screenD = input('what is the length of the screen?');

%eyeH = 6;
%screenD = 34;
screenH = screenD + eyeH;
%eyeH = str2num(eyeH);
%screenD = str2num(screenD);

for i = 1:50
x = 5 + 3*(i-1);
set(i) = atan(screenH/x)-atan(eyeH/x);
end
Max = max(set);
for i = 1:50
    if set(i) == max(set)
        I = i;
        fprintf('the row is %d. \n',I)
    end
end
x = 10;
tenFeetAngle = atan(screenH/x)-atan(eyeH/x);
fprintf('The angle at row %d is %d. \n',I,Max)
fprintf('At 10 feet the angle is %d. \n',tenFeetAngle)
%% 

P = input('what is P?');
rate = input('what is the rate?');
n = 1;
t = input('what is t?');
r = rate/100;
A = P*(1 + (r/n)).^(n*t);

disp(A)
fprintf('the amount is %2f. \n',A)

