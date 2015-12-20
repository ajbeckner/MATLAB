clear all
clc
Array = {'the fat cat sat on the mat','the fat rat sat on the cat','the cat mat sat on the rat','the fat sat cat on the mat','the cat cat cat on the cat'}
n = 0
for i = 1:length(Array)
    searchCharacters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0',' ','-','_',',','.','/','\'};
    clear totalInstnceseach
    for j = 1:length(searchCharacters)
    instances = length(strfind(Array{i},searchCharacters{j}));
    if exist('totalInstances','var') == 0
        totalInstances = instances
    totalInstances = totalInstances + instances
    if exist('totalInstancesEach','var') == 0
        totalInstncesEach = totalInstances;
    else
        totalInstncesEach = [totalInstncesEach totalInstnces];
    end
    end
    disp(length(totalInstncesEach))
end