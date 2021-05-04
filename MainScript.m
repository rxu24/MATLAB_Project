% Ruidi Xu
% Honors Capstone Segmentation Software

%% Load pre-loaded images
load MDQ_D3.mat
load map.mat

%% Find directory
% cd MDQ_D3 % cd filename
%% Load DICOM Files - MDQ_D3 has resolution 535x535x576
% matrix3D = zeros(535,535);
% for i=1:576
%     matrix3D(:,:,i) = dicomread(['3DSlice',num2str(i),'.dcm']);
% end
%% Restore original directory
% cd ../

%% Define colormap
map = colormap(gray);

%% Define thresholding
% format shortg
% disp("Begin thresholding");
% c = clock %[year month day hour minute seconds]
% matrix3D = MDQ_D3;
% skull = zeros(size(MDQ_D3)); % new matrix of zeros
% lowerBound = 1600; % Define lower threshold for data
% % upperBound =  % Define upper threshold for data
% 
% skull(matrix3D>lowerBound) = matrix3D(matrix3D>lowerBound);
% disp("End thresholding");
% format shortg
% c = clock %[year month day hour minute seconds]

%% Display specific slice
% figure(1);
% imagesc(skull(:,:,300));
% colormap gray;
% colorbar;

%% Display 3D Mesh
% disp("Begin 3D Mesh");
% format shortg
% c = clock
% 
% figure;
% show3D(MDQ_D3(:,:,:),map);
% 
% disp("End 3D Mesh");
% format shortg
% c = clock
% axis square;

%% Post image adjustments
% axis square;
% [n,x] = hist(matrix3D(matrix3D>1000),100);
% figure(3);
% plot(x,n);

%% Slider Testing - Functional
sliceSlider(MDQ_D3);

%% STL Conversion 
% boolSkull = skull;
% boolSkull(skull>0) = 1;
% sz = size(skull);
% gridX = []; %535
% gridY = []; %535
% gridZ = []; %576
% for i=1:sz(1)
%     gridX(i) = 0.3*i;
%     gridY(i) = 0.3*i;
% end
% 
% for j=1:100 % change depending on height of desired STL
%     gridZ(j) = 0.3*j;
% end
% cd STL
% [faces,vertices] = CONVERT_voxels_to_stl('temp.stl',boolSkull(:,:,1:100),gridX,gridY,gridZ,'ascii');
% cd ../
% 

%% Make Shell for Testing
shelled = formShell(MDQ_D3);
% 
% disp("Begin 3D Shell");
% format shortg
% c = clock
% 
% figure;
% show3D(shelled(:,:,:),map);
% 
% disp("End 3D Shell");
% format shortg
% c = clock
% 
% axis square;

%% Segmentation Validation Formulas
% region grow and 2D selection tool

% Iterate through all slices, take most negative and most positive x for
% each y, utilize those values as the exterior mesh (needs region grow)

%% DICE Coefficient - Functional
%Threshold vs Base
%DCoeff1 = DICE(matrix3D,MDQ_D3,0.3,0.3,0.625)
%Threshold vs Shell
DCoeff2 = DICE(MDQ_D3,shelled,0.3,0.3,0.625)

%% Average Surface Distance
% testM = zeros(size(shelled));
% testM(:,1,:) = shelled(:,535,:);
% testM(:,2,:) = shelled(:,534,:);
% for i=3:533
%     testM(:,i,:) = shelled(:,535-i,:);
% end
% asd = ASD(MDQ_D3,shelled)

%% STL Read/Plot
%H_MDQ_D3 = stlread('H_MDQ_D3.stl');
%N_MDQ_D3 = stlread('N_MDQ_D3.stl');

%% Translation and Rotation of Data set - 04/06/2021

