function [frames, tiltFactor, spin] =  getValidInput
%function gets and checks user input for the UFO animation

%strings for dialogue box
prompt = {'How many frames should be used?(','how much should the UFO tilt?','How much should the UFO spin?'};
dlg_title = 'Animation settings';
%stores answers in matrix
answerMatrix = inputdlg(prompt,dlg_title)

%loop checks each answer for numeric string
for i = 1:1:length(answerMatrix)
str = answerMatrix(i);
pat = '\d+';
answerStrings(i) = regexp(str, pat, 'match')
end

%adds the values; if all input is numeric returns 0
checkNumeric = isempty(answerStrings{1})+isempty(answerStrings{2})+isempty(answerStrings{3})

%conditional uses numeric values or tries to get new input if values are
%chars/other
if checkNumeric == 0
    
%converts numeric strings into doubles
frames = str2double(answerStrings{1}{1});
tiltFactor = str2double(answerStrings{2}{1});
spin = str2double(answerStrings{3}{1});

%next section modifies input to "good" values

frames = abs(frames) + 1;%prevents 0 or negative frame animation

%keeps framerate low enough to run well
while frames > 500
    frames = frames/10;
end
%keeps tiltfactor low enough not to go "crazy"
while abs(tiltFactor) >= 8
    if tiltFactor > 0
        tiltFactor = tiltFactor - 2;
    else
        tiltFactor = tiltFactor + 2;
    end
end

else%second case gets new values to check
    
[frames, tiltFactor, spin] =  getValidInputend

end

