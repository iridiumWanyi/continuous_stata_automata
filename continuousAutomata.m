clc 
clf
n=16; % lattice size
depth=3; % neighborhood depth
l=.6; % diminishing factor
K=42; % steps
lx=kron(1:n,ones(n,1)); % x coordinates of all grids
ly=kron((1:n)',ones(1,n)); % y coordinates of all grids
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
            a(i,j,k+1)=max(a(i,j,k)+1.1-abs(2.8-s)/1,0);
        end
    end
end