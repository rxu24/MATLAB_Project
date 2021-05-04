function [score] = DICE(ground,test,x,y,z)
% 2*(intersect(ground,reference))/(ground + reference)
% x,y,z represent voxel dimensions in mm

ng = length(ground(ground>0));
nt = length(test(test>0));
volG = ng *x*y*z; % ground truth volume
volT = nt *x*y*z; % reference volume

disp("The volume of the ground truth is "+volG + "mm^3.");
disp("The volume of the test is "+volT + "mm^3.");
sz = size(ground); % size of input matrix
sharedVol = 0; % counter for shared volumes

%Iterate through all voxels
for k=1:sz(3)
    for i=1:sz(1)
        for j=1:sz(2)
            if (ground(i,j,k)>0 && test(i,j,k)>0)
                sharedVol = sharedVol + 1;
            end
        end
    end
end
% Shared volume of two input volumes
sharedVol = sharedVol *x*y*z;
% Calculate DICE Score
score = 2*sharedVol/(volG + volT);
end