function [outTrace] = PbooTinitSimTrace(A,T0,t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate the vector of the Tinit in the closed-form temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if size(A,1) ~= size(A,2)
    error('should be square matrix');
end

if  ~isvector(T0) || ~isvector(t)
    error('PbooTinitSimTrace: input T0 or t Not Vector.  Must be vectors!');
end

sizeA = size(A,1);
sizeT = size(T0,1);

if sizeT~=sizeA
    error('T0 must have the same line number with A!');
end
% simTrace = cell(sizeA,sizeA);
% 
% for i=1:sizeA
%     for j=1:sizeA
%         simTrace{i,j} =[zeros(size(t))];
%     end
% end

[U,D]=eig(A);
INVU=inv(U);

for i=1:sizeA
    for j=1:sizeA
        for k=1:sizeA
            SS(i,j,k) = U(i,k)*INVU(k,j);
        end
    end
end

baseTrace = zeros(sizeA, size(t,2));

for i=1:sizeA
    baseTrace(i,:) = exp(D(i,i).*t);
end


outTrace=zeros(sizeA,size(t,2));
for i=1:sizeA
    for j=1:sizeA
        tempTrace = zeros(size(t));
        for k=1:sizeA
        tempTrace =tempTrace + SS(i,j,k)*baseTrace(k,:);
        end
        outTrace(i,:) = outTrace(i,:) + tempTrace*T0(j);
    end
end




    
