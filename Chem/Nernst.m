function [K] = Nernst(E,n)
K = exp(((n*E)/(.0592))*log(10));
end