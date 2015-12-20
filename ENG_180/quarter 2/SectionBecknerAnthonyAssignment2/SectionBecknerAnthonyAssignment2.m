%%
clear all;close all;clc

%sets default coordinates
square = [0,0,2,2;0,2,2,0];
translate = zeros(2,length(square));

%performs first **special** iteration of loop
newSquare = square;

%sets axies correctly
axis([-1 8 -1 8])
axis square
hold on



%%
for i = 2:12 %starts at 2 to modify calculations correctly
    
    %waits and then draws each frame
    pause(.1)
    s = fill(newSquare(1,:),newSquare(2,:),'b');
    
    
    val = 1/(.5*i);% creates value for alpha value and modifies it
    %conditional is necesary to prevent first iteration from throwing an
    %error
    if val <= 1
        set(s,'FaceAlpha',val)
    end
    
    %calculates translation factor and creates matrix to perform
    %translation
    l = abs(newSquare(1,2) - newSquare(2,2));
    translate(1,:) = translate(1,:) + (l+ l*.1);
    translate(2,:) = translate(2,:) + (l + l*.1);
    
    newSquare = square*(1/i);%scales 
    newSquare = newSquare + translate;%translates from original place
    
end

shg%brings graphs to front
