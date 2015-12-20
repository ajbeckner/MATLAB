function drawAnimation81
repeat = 1000;
waitTime = .01;
% waitTime = input('\nWhat would you like the wait time to be? ');
% if waitTime <= 1 && waitTime > 0
% else
%     drawAnimation81( repeat)
% end
polarAngles = (1/16:1/8:1)*2*pi;

xCoor = cos(polarAngles)*cos(2*pi/16);
yCoor = sin(polarAngles)*cos(2*pi/16);

for i = 1:1:repeat 
    for j = 0:1:100
        
        clf
        hold on
        axis([-5 15 -5 15]) ;
        grid on
        
        large = fill(xCoor*(j/100)*5 ,yCoor*(j/100)*5,'k');
        medium = fill(xCoor*(j/100)*4 ,yCoor*(j/100)*4,'r');
        small = fill(xCoor*(j/100)*3 ,yCoor*(j/100)*3,'y');   
        
        pause(waitTime)
    end
    for k = 0:1:100  
        
        clf
        hold on
        axis([-5 15 -5 15]) 
        grid on
        
        large = fill(xCoor*5 + k/10,yCoor*5 + k/10,'k');
        medium = fill(xCoor*4 + k/10,yCoor*4 + k/10,'r');
        small = fill(xCoor*3 + k/10,yCoor*3 + k/10,'y');   
        
        pause(waitTime)
    end
    clear k
    for k = 0:1:100
        
        clf
        hold on
        axis([-5 15 -5 15]) 
        grid on
        
        large = fill(xCoor*(1 - k/100)*5 + 10,yCoor*(1 - k/100)*5 + 10,'k');
        medium = fill(xCoor*(1 - k/100)*4 + 10,yCoor*(1 - k/100)*4 + 10,'r');
        small = fill(xCoor*(1 - k/100)*3 + 10,yCoor*(1 - k/100)*3 + 10,'y');  
        
        pause(waitTime)
    end
end



end

