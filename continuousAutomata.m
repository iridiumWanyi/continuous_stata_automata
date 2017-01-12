clc 
clf
n=16; % lattice size
depth=3; % neighborhood depth
l=.6; % diminishing factor
K=60; % steps
% a(:,:,1)=rand(n)./d;
% a(:,:,1)=round(rand(n));
% a=rand(n);
% the patched matrix
% [[a(n,n),a(n,:),a(n,1)];[a(:,n),a,a(:,1)];[a(1,n),a(1,:),a(1,1)]]

lx=kron(1:n,ones(n,1));
ly=kron((1:n)',ones(1,n));
%%
% initialization
a=zeros(n,n,K); 
a(:,:,1)=rand(n);
% automata running
for k=1:K-1 % steps loop
    imagesc(a(:,:,k))
    pause(.1)
    for i=1:n % horizontal axes loop
        for j=1:n % vertical axes loop
            dis=mod(lx-i,n)+mod(ly-j,n); % computing the hadamas distance for all grids to the current grid 
            s=0; % initialize the interaction values
            for m=1:depth
                s=s+(sum(a(find(dis<m+1)))-a(i,j,k))/m^l;
            end
            a(i,j,k+1)=max(a(i,j,k)+1.1-abs(2.8-s)/2,0);
        end
    end
end