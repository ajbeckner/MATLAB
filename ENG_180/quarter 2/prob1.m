function v = prob1
square = [-2 -2 2 2; -2 2 2 -2];


figure
xmin = -5;
xmax = 25;
ymin = -5;
ymax = 125;
axis equal
axis([xmin xmax ymin ymax])
hold on
t = linspace(0, 20, 500);
y= (1/4)*t.^2;
scale = linspace(1, .25, 500);
    for i = 1:500         
         h = fill(scale(i)*square(1,:) + t(i), scale(i)*square(2,:) + y(i), 'r'); 
        
         v.x(i,:)=get(h,'xdata')';
         v.y(i,:)=get(h,'ydata')';
         %pause(0.03);

    end
    
end



