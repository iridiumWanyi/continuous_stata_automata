clc 
clf
n=16; l=3;
s=zeros(l,1)
% central distance
% d=zeros(n);
% for i=1:n
%     for j=1:n
%         d(i,j)=abs(i-n/2)+abs(j-n/2);
%     end
% end
K=60;
% a(:,:,1)=rand(n)./d;
% a(:,:,1)=round(rand(n));
% a=rand(n);
% the patched matrix
% [[a(n,n),a(n,:),a(n,1)];[a(:,n),a,a(:,1)];[a(1,n),a(1,:),a(1,1)]]
depth=3;
lx=kron(1:n,ones(n,1));
ly=kron((1:n)',ones(1,n));
%%
a=zeros(n,n,K);
a(:,:,1)=rand(n);
for k=1:K-1
    a(:,:,k)
%     [[a(n,n,k),a(n,:,k),a(n,1,k)];[a(:,n,k),a(:,:,k),a(:,1,k)];[a(1,n,k),a(1,:,k),a(1,1,k)]]
    imagesc(a(:,:,k))
    pause(.1)
    for i=1:n
        for j=1:n
            dis=mod(lx-i,n)+mod(ly-j,n);
            s=0;
            for m=1:depth
                s=s+sum(a(find(dis<m+1)))/m;
            end
            a(i,j,k+1)=max(a(i,j,k)+1.1-abs(2.8-s)/2,0);
        end
    end
end