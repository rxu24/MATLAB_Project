function sliderCallback(sld, hImage, map )

idx = round(sld.Value);

hImage.CData = map(:,:,idx);

%% try distinguishing using slider limits
end