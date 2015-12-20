function [r, n, i] = collatzPower(n) 

    function n2 = collatzSeries(n1)
    n1 = int64(n1); 
    n2 = 3*n1 + 1;
    end
i = 0;
while (~ mod(n,2) == 0)
    i = i + 1;
    n = collatzSeries(n);
end
r = log2(double(n));
end