function [A,B,C,D] = problem1(x)

sizes= size(x);
sizeSum = sizes(1) + sizes(2);
testing = sizeSum - 1;
newx = [];

if sizes(1) == 1 && sizes(2) == 1
    fprintf('Scalar \n')
    newx = x;
elseif sizes(1) == testing && sizes(2) ~= testing
    fprintf('Vector1 \n')
    newx = x;
elseif sizes(1) ~= testing && sizes(2) == testing
    fprintf('Vector2 \n')
    newx = x;
elseif sizes(1) ~= testing && sizes(2) ~= testing
    fprintf('Matrix \n')
    for i = 1:sizes(1)
        newx = [newx x(i,:)];
    end
    
end

A = mean(newx);
B = std(newx);
C = median(newx);
D = max(newx);


end