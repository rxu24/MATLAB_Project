function show3D(ia,map)

% Commands taken from Matlab Help Pages. 

ias = smooth3(ia);                          %This command smooths the data (default: in  [3 3 3] - neighborhood)
hiso = patch(isosurface(ias,5),...
    'FaceColor',[1,.75,.65],...
    'EdgeColor','none');                   %This command defines color on isosurfaces


hcap = patch(isocaps(ia,5),...
    'FaceColor','interp',...
    'EdgeColor','none');                   %This command defines appearance at end caps
colormap(map)

view(45,30)                                % Angles of 3D View 
% axis tight % DEFAULT is axis tight
axis square
daspect([1,1,.4])

lightangle(45,30); lighting phong         % Light Angles in 3D
isonormals(ias,hiso)
set(hcap,'AmbientStrength',.6)
set(hiso,'SpecularColorReflectance',0,'SpecularExponent',50)

end

