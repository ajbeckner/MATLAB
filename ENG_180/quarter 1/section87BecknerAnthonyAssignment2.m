%%biweekly assignment 2 -Anthony Beckner
%assign variables and create vectors
varTen = 50*randn(10,1);
varHundred = 50*randn(100,1);
varThousand = 50*randn(1000,1);
varTT = 50*randn(10000,1);
n = 0;

%%Question 1

%%Part 1 -histogram
%evry three lines is: figure#; generate histogram; title and label
figure(1);
hist(varTen);
title('ten variables');ylabel('frequency');xlabel('bins');
figure(2)
hist(varHundred);
title('one hundred variables');ylabel('frequency');xlabel('bins');
figure(3)
hist(varThousand);
title('one thousand variables');ylabel('frequency');xlabel('bins');
figure(4)
hist(varTT);
title('ten thousand variables');ylabel('frequency');xlabel('bins');


%%Part 2 -greater than 50
for i = 1:length(varTen)
    if varTen(i) > 50
        n = n + 1;
    end
end
probabilityAboveFiftyInTen = n/length(varTen);
n = 0;
for i = 1:length(varHundred)
    if varHundred(i) > 50
        n = n + 1;
    end
end
probabilityAboveFiftyInHundred = n/length(varHundred);
n = 0;
for i = 1:length(varThousand)
    if varThousand(i) > 50
        n = n + 1;
    end
end
probabilityAboveFiftyInThousand = n/length(varThousand);
n = 0;
for i = 1:length(varTT)
    if varTT(i) > 50
        n = n + 1;
    end
end
probabilityAboveFiftyInTT = n/length(varTT);
n = 0;

%%Part 3 -greater than or equal to 50
for i = 1:length(varTen)
    if varTen(i) >= 50
        n = n + 1;
    end
end
probabilityAboveEqualFiftyInTen = n/length(varTen);
n = 0;
for i = 1:length(varHundred)
    if varHundred(i) >= 50
        n = n + 1;
    end
end
probabilityAboveEqualFiftyInHundred = n/length(varHundred);
n = 0;
for i = 1:length(varThousand)
    if varThousand(i) >= 50
        n = n + 1;
    end
end
probabilityAboveEqualFiftyInThousand = n/length(varThousand);
n = 0;
for i = 1:length(varTT)
    if varTT(i) >= 50
        n = n + 1;
    end
end
probabilityAboveEqualFiftyInTT = n/length(varTT);
n = 0;

%%Part 4 -between twenty and fifty
for i = 1:length(varTen)
    if varTen(i) < 50 && varTen(i) > 20
        n = n + 1;
    end
end
probabilitytwentyToFiftyInTen = n/length(varTen);
n = 0;
for i = 1:length(varHundred) 
    if varHundred(i) < 50 && varHundred(i) > 20
        n = n + 1;
    end
 end
probabilitytwentyToFiftyInHundred = n/length(varHundred);
n = 0;
for i = 1:length(varThousand)
    if varThousand(i) < 50 && varThousand(i) > 20
        n = n + 1;
    end
end
probabilitytwentyToFiftyInThousand = n/length(varThousand);
n = 0;
for i = 1:length(varTT)
    if varTT(i) < 50 && varTT(i) > 20
        n = n + 1;
    end
end
probabilitytwentyToFiftyInTT = n/length(varTT);
n = 0;

%%Part 5 -Analyses

%The probabilities are a ration of the number of times what we were looking
%for appeared to the number of times it could have appeared.
%This could range from 0 (none of the time) to 1 (every time). 
%When running the script 1 never appears as a probability because of the
%normal distribution. However, due to varTen's small size, sometimes 0 does
%appear.

%Increasing the vector length increases the adherence to the normal
%distribution. It also Increases the number of significant digits recorded
%in probability. 

%%Question 2
%first generate vector r
r = 15 + (32 - 15).*rand(600,1);

%%part 1 -mean
sumr = 0;
for i = (1:length(r))
    sumr = sumr + r(i);
end
meanr = sumr/length(r);

%%part 2 -standard deviation
Nr = 0;
for i=1:600
    Nr = Nr + ((r(i)- meanr)^2);
end;
   stdr = ((Nr/(600-1))^(1/2));

%%part 3 -check work
%check mean
meanrCheck = mean(r);
if meanrCheck == meanr
    disp('mean calculated correctly')
end
%check std
stdrCheck = std(r);
if stdrCheck == stdr
    disp('stdr calculated correctly')
end

%%part 4 -histogram
figure(5);
hist(r)
title('Histogram of r');xlabel('values');ylabel('frequency');

%%part 5 -Analysis
%matlab is very accurate and powerful.
%but this is limited in some cases.
%one case is when the number of variables in an array is small like in
%varTen. The histogram does not accurately reflect the bell curve.
%This is because the random numbers are only pseudorandom.
%Obviously, the closer the number of elements is to the number of bins the
%less like a bell curve it will look, as with any histogram. 