function drawShape()
clc

%function fro drawing n sided regular polygons
    function regPoly(nSides,color)
        polarangles = (pi/nSides) *(1:2:(2*nSides - 1));
        X = cos(polarangles);
        Y = sin(polarangles);
        fill(X,Y,color)
        axis square
    end

%initializes variables for error handling
error = 0;% this also resets this value in case of errors
validColor = 0;
colorVals = {'m','y','c','b','r','g','w','k','magenta','cyan','yellow','blue','red','green','white','black','Magenta','Cyan','Yellow','Blue','Red','Green','White','Black'};

%prints instructions, options, and inputs
fprintf('\n 1. Right Angled Triangle \n 2. Circle \n 3. Square \n 4. Pentagon \n 5. Hexagon \n 6. Octagon \n 7. Star \n 8. Rhombus \n 9. Trapezoid \n\n ')
shape = input('Which shape would you like to see? \n (watch spelling please) \n\n shape: ','s');
color = input('Which color would you like it to be? \n (watch spelling please) \n\n color: ','s');

%for loop for drawings; each 'if' is a different shape and accepts
%numerical or textual input with 'or'; 
for i = 1:length(colorVals)
    if strcmp(color,colorVals{i})
        validColor = 1;
    end
end
    if validColor == 1
        if strcmpi(shape,'Right Angled Triangle') ==1 || strcmp(shape,'1') ==1
            %triangle uses modified version of the function for a square
            nSides = 4;
            polarangles = (pi/nSides) *(1:2:(2*nSides - 2));
            X = cos(polarangles);
            Y = sin(polarangles);
            fill(X,Y,color)
            axis square %fixes sizing issues 
        elseif strcmpi(shape,'circle') == 1 || strcmp(shape,'2') == 1
            nSides = 360;%circle is represented bu 360 sided polygon rather than sin/cos curves
            regPoly(nSides,color)
        elseif strcmpi(shape,'square') == 1 || strcmp(shape,'3') == 1
            nSides = 4;
            regPoly(nSides,color)
        elseif strcmpi(shape,'Pentagon') == 1 || strcmp(shape,'4') == 1
            nSides = 5;
            regPoly(nSides,color)
        elseif strcmpi(shape,'hexagon') == 1 || strcmp(shape,'5') == 1
            nSides = 6;
            regPoly(nSides,color)
        elseif strcmpi(shape,'octagon') == 1 || strcmp(shape,'6') == 1
            nSides = 8;
            regPoly(nSides,color)
        elseif strcmpi(shape,'Star') == 1  || strcmp(shape,'7') == 1
            starCart = [10,9,4,8,6,10,14,12,16,11;16,12,12,9,4,7,4,9,12,12];%star uses directly cartesian coordinates from the lab
            fill(starCart(1,:),starCart(2,:),color);
            axis square
        elseif strcmpi(shape,'Rhombus') == 1 || strcmp(shape,'8') == 1
            rhomCart = [0,1,2,1;0,1,1,0];%modified square coordinates
            fill(rhomCart(1,:),rhomCart(2,:),color);
            axes square
            
        elseif strcmpi(shape,'Trapezoid') == 1 || strcmp(shape,'9') == 1
            trapCart = [0,1,2,3;0,1,1,0];%modified rhombus coordinates
            fill(trapCart(1,:),trapCart(2,:),color);
            
        else%last conditional is for errors to avoid aborting the run
            fprintf('\n\nERROR: invalid input \n-make sure your spelling is correct.\n')
            ender = input('[Hit "return" to try again or ''n'' to cancel]','s');
            
            error = 1;%reassignment denotes error
        end
    else%this loop is for errors with color
        fprintf('\n\nERROR: invalid input for color \n-make sure your spelling is correct.\n')
        ender = input('[Hit "return" to try again or ''n'' to cancel]','s');
        
        error = 1;% denotes error
    end
    if error == 1 && strcmp(ender,'n') == 0
        drawShape()% retries running program if errors present
    elseif error == 1 && strcmp(ender,'n') == 1 %allows program to be ended safely in case of error
    end
    clc
end

