clear all;clc
% check pH
pHreply = input('Do you know the pH? Y/N [N]:','s');
if isempty(pHreply)
    pHreply = 'N';
end
if pHreply == 'Y'
    pH = input('What is the pH?');
end

% check pOH
pOHreply = input('Do you know the pOH? Y/N [N]:','s');
if isempty(pOHreply)
    pOHreply = 'N';
end
if pOHreply == 'Y'
    pOH = input('What is the pOH?');
end

%check hydronium conc
H3OConcreply = input('Do you know the hydronium concentration? Y/N [N]:','s');
if isempty(H3OConcreply)
    H3OConcreply = 'N';
end
if H3OConcreply == 'Y'
    H3OConc = input('What is the hydronium concentration?');
end

%Check hydroxide conc
OHConcReply = input('Do you know the hydroxide concentration? Y/N [N]:','s');
if isempty(OHConcReply)
    OHConcReply = 'N';
end
if OHConcReply == 'Y'
    OHConc = input('What is the hydroxide concentration?');
end

%calculations from ph or poh
if exist('pH','var') || exist('pOH','var')
    %calc of like unknown
    if exist('pH','var')
        pOH = 14 - pH;
    elseif exist('pOH','var')
        pH = 14 - pOH;
    end
    
    %calc of other two unknowns
    H3OConc = exp(-pH*log(10));
    OHConc = exp(-pOH*log(10));
end

%calculations from conc values
if exist('OHConc','var') || exist('H3OConc','var')
    %calc of like unknown
    kw = 10^-14;
    if exist('OHConc','var')
        H3OConc = kw/OHConc;
    elseif exist('H3OConc','var')
        OHConc = kw/H3OConc;
    end
    
    %calc of other two unknowns
    pH = -log(H3OConc)/log(10);
    pOH = -log(OHConc)/log(10);
end

%printout of info
clc
fprintf('pH is %.2f.\n',pH);
fprintf('pOH is %.2f.\n',pOH);
fprintf('hydronium concentration is %d.\n',H3OConc);
fprintf('hydroxide concentration is %d.\n',OHConc);
