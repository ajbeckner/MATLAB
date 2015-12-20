% Carlo hw 9 code
% Math 261 afall 2013
% By AJ Beckner

% We will walk through problems 13 and 14 of section 5.1
% and problems 11 and 12 of section 5.2 

%% For problem 13 of 5.1 we must reduce A to U 
% and find the determinant through |A| = +/-|U|  
% First, we reduce A to U

A = [1 1 1;1 2 2; 1 2 3];
L = zeros(length(A),length(A'));
disp(A)
%row operations
U = A;
    L = zeros(length(U'),length(U));
    limit = 1;
    %row operation 
    for c = 1:length(U)
        for r = 0:length(U')
            row = length(U')-r; %row
            col = c; %col
            if row > limit
                m = col;
                L(row,col) = m;
                U = eliminate(U,row,col,m);
                disp(U)
            end
        end
        limit = limit +1;
    end
A = U

%Multiply u by the l's. and +/-
mcount = 0;
for i = 1:length(L)
    for j = 1:length(L')
        if L(i,j) ~= 0 
            mcount = mcount +1;
            A = L(i,j)*A;
        end
    end
end
A = (-1.^mcount)*A;

% then we find the determinant
lAl = det(A)
%%
% First, we reduce B to U

B = [1 2 3;2 2 3; 3 3 3];
L = zeros(length(B),length(B'));
disp(B)
%row operation
U = B;
    L = zeros(length(U'),length(U));
    limit = 1;
    %row operation 
    for c = 1:length(U)
        for r = 0:length(U')
            row = length(U')-r; %row
            col = c; %col
            if row > limit
                m = col;
                L(row,col) = m;
                U = eliminate(U,row,col,m);
                disp(U)
            end
        end
        limit = limit +1;
    end
B = U

%Multiply u by the l's. and +/-
mcount = 0;
for i = 1:length(L)
    for j = 1:length(L')
        if L(i,j) ~= 0 
            mcount = mcount +1;
            B = L(i,j)*B;
        end
    end
end
B = (-1.^mcount)*B;
B = B

% then we find the determinant
lBl = det(B)

%%

C = [1 2 3 0; 2 6 6 1; -1 0 0 3;0 2 0 7];
L = zeros(length(C),length(C'));
disp(C)
%elimination
U = C;
    L = zeros(length(U'),length(U));
    limit = 1;
    %row operation 
    for c = 1:length(U)
        for r = 0:length(U')
            row = length(U')-r; %row
            col = c; %col
            if row > limit
                m = col;
                L(row,col) = m;
                U = eliminate(U,row,col,m);
                disp(U)
            end
        end
        limit = limit +1;
    end
C = U
%Multiply u by the l's. and +/-
mcount = 0;
for i = 1:length(L)
    for j = 1:length(L')
        if L(i,j) ~= 0 
            mcount = mcount +1;
            C = L(i,j)*C;
        end
    end
end
C = (-1.^mcount)*C;

% then we find the determinant
lCl = det(C)

%%
D = [2 -1 0 0; -1 2 -1 0;0 -1 2 -1; 0 0 -1 2] 