function [ v, theta, phi ] = readAccFull( accelerometer, calCo )
[T,GX,VX,SX,GY,VY,SY,GZ,VZ,SZ] = makevecs(1,200);

tic
seeking = true;
while (seeking)
    t = toc;
    [gx, gy, gz]=readAcc(accelerometer,calCo) ;
    [vx,sx] = antider(gx,t,GX(end),VX(end),SX(end),T(end));
    [vy,sy] = antider(gy,t,GY(end),VY(end),SY(end),T(end));
    [vz,sz] = antider(gz,t,GZ(end),VZ(end),SZ(end),T(end));
    [T,GX,VX,SX,GY,VY,SY,GZ,VZ,SZ] = shifvecs({T GX VX SX GY VY SY GZ VZ SZ},{t gx vx sx gy vy sy gz vz sz});
    
    if (gy > 2)
        v = vx*50;
        for index = (0:length(GY)-1)
            n = length(GY)-index;
            if(GY(n) <1 && GY(n) > 0)
                theta = GY(n)*90;
                phi = GZ(n)*90;
                seeking = false;
            end
        end
    end
end

    %sets up accel for reading
    function [accelerometer,calCo] = accelsetup
        closeSerial
        comPort='/dev/tty.usbmodem1421';
        [accelerometer.s,~]=setupSerial(comPort);
        calCo=calibrate(accelerometer.s);
    end

    %makes vectors with buffer
    function varargout = makevecs(r,c)
        varargout = cell(1,nargout);
        for i = 1:1:nargout
            varargout{i} = zeros(r,c);
        end
    end

    %uses antiderivative formula
    function [v, s] = antider(g,t,g0,v0,s0,t0)
        v = v0+((t-t0)*((g+g0)/2));
        s = s0+((t-t0)*((v+v0)/2));
    end

    %shifts vectors and adds new points
    function varargout = shifvecs(vecs,pts)
        varargout = cell(1,nargout);
        for i = 1:1:nargout
            varargout{i} = shift(vecs{i},pts{i});
        end
        
        function vec = shift(vec, pt)
            vec = [vec(2:end) pt];
        end
    end
end

