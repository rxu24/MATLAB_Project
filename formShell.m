function [shelled] = formShell(matrix)
% Hollows out Volume in a specified Axis
shelled = zeros(size(matrix));
sz = size(matrix);
for k=1:sz(3)
    for j=1:sz(2)
        temp = matrix(:,j,k);
        %
        minIndex = -1;
        maxIndex = -1;
        for m=1:length(temp)
            if (temp(m)>0)
                minIndex = m;
                break
            end
        end
        for n=length(temp):-1:1
            if (temp(n)>0)
                maxIndex = n;
                break
            end
        end
        %
        if (minIndex == maxIndex && minIndex ~= -1)
            shelled(maxIndex,j,k) = matrix(maxIndex,j,k);
        elseif (minIndex ~= maxIndex && minIndex ~=-1)
            shelled(maxIndex,j,k) = matrix(maxIndex,j,k);
            shelled(minIndex,j,k) = matrix(minIndex,j,k);
        end
    end
end
end

