function [value] = ASD(ground,test)
% Average Symmetric Distance Calculation between two input matrices
% Input matrices have same dimensions and are shelled for x

sz = size(ground);
diffCtr = 0;
ctr = 0;
for k=1:sz(3)
    for j=1:sz(2)
        tempG = ground(:,j,k);
        tempT = test(:,j,k);
        %
        minIndexG = -1;
        maxIndexG = -1;
        minIndexT = -1;
        maxIndexT = -1;
        %
        for m=1:length(tempG)
            if (tempG(m)>0)
                minIndexG = m;
                break
            end
        end
        %
        for m=1:length(tempT)
            if (tempT(m)>0)
                minIndexT = m;
                break
            end
        end
        if (maxIndexG ~=-1 && minIndexG ~=-1 && maxIndexT ~=-1 &&maxIndexT ~=-1) 
            diffCtr = diffCtr + abs(minIndexG-minIndexT);
            ctr = ctr +1;
        end
        %
        
        for n=length(tempG):-1:1
            if (tempG(n)>0)
                maxIndexG = n;
                break
            end
        end
        %
        for n=length(tempT):-1:1
            if (tempT(n)>0)
                maxIndexT = n;
                break
            end
        end
        if (maxIndexG ~=-1 && minIndexG ~=-1 && maxIndexT ~=-1 &&maxIndexT ~=-1)
        diffCtr = diffCtr + abs(maxIndexG-maxIndexT);
        ctr = ctr + 1;
        end
    end
end
value = diffCtr*0.3/ctr;
disp("The average symmetric distance between the model boundaries is "+value+"mm.");
end

