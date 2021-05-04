function sliceSlider(matrix)
close all;
%% Create figure window and components
sz = size(matrix);
sz1 = sz(1);
sz2 = sz(2);
sz3 = sz(3);

%% Z-axis
figure;
subplot(2,2,1);
i=1; %first layer. 
hImage = imagesc(matrix(:,:,i)); % z value is transverse
set(gca,'YDir','normal')
colormap gray;
title("Slices in Z-axis");

fig = uifigure('Position',[75 100 300 300]);
%fig.WindowStyle = 'modal';

% transverse
sld = uislider(fig,...
    'Position',[100 75 120 3],...
    'ValueChangedFcn',@(sld,event) sliderCallback(sld,hImage,matrix));
sld.Limits = [1 sz3];

%% Y-axis
subplot(2,2,2);
j=1; %first layer of y
matY = permute(matrix, [3,1,2]);
hImage2 = imagesc(matY(:,:,j)); % iterate along y
set(gca,'YDir','normal');
colormap gray;
title("Slices in Y-axis");

%fig2 = uifigure('Position',[75 200 300 100]); % [bottom, left ...]
%fig.WindowStyle = 'modal';

% transverse
sld2 = uislider(fig,...
    'Position',[100 150 120 3],...
    'ValueChangedFcn',@(sld2,event) sliderCallback(sld2,hImage2,matY));
sld2.Limits = [1 sz2];

%% X-axis
subplot(2,2,3);
k=1; %first layer of y
matX = permute(matrix, [3,2,1]);
hImage3 = imagesc(matX(:,:,k)); % iterate along y
set(gca,'YDir','normal');
colormap gray;
title("Slices in X-axis");

%fig3 = uifigure('Position',[75 300 300 100]); % [bottom, left ...]
%fig.WindowStyle = 'modal';

% transverse
sld3 = uislider(fig,...
    'Position',[100 225 120 3],...
    'ValueChangedFcn',@(sld3,event) sliderCallback(sld3,hImage3,matX));
sld3.Limits = [1 sz1];

end
%% Region Select Testing
%
% function sliderTest(matrix)
% 
% figure(4);
% i=250 %first layer. 
% hImage = imagesc(matrix(:,:,i));
% colormap gray;
% 
% callback = @(src,evt) sliderCallback( src, hImage, matrix );
% 
% % hSlider = uicontrol( ..., 'Callback', callback );
% 
% hSlider = uicontrol('Callback', callback);
% end

