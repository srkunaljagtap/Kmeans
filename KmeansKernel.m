clc;
clear;
close all;
%% This is the matlab implementation for iris flower data set 
% using the K means algorithm and kernels function
% load your own iris data set or use the data set I uploaded
load('iris1.mat');
Xtrain = Pattern(:,3:4);
figure(1);
hold off
plot(Xtrain(:,1),Xtrain(:,2),'ko'); 
Lambda = 1;
K = input('enter the value of K =');

N = size(Xtrain,1);
Ke = zeros(N);

for i = 1:N
    for j = 1:N
        Ke(i,j) = exp(-Lambda*sum((Xtrain(i,:)-Xtrain(j,:)).^2));
    end
end
% Kernel K-means is *very* sensitive to initial conditions. 
% Try altering this initialisation to see the effect.
converged = 0;
Z = zeros(N,K);
Z(1:50,1) = 1;
Z(51:100,2) = 1;
Z(101:150,3) = 1;

switch K
    case  3
T(1:25,1) = 1;
T(50:75,2) = 1;
T(100:125,3) = 1;
case 4
    T(1:25,1) = 1;
T(50:75,2) = 1;
T(100:125,3) = 1;
T(25:150,4) = 1;
    case 5
        T(1:25,1) = 1;
T(50:75,2) = 1;
T(100:125,3) = 1;
T(25:150,4) = 1;
T(75:100,5) = 1;

   otherwise
end
 distance = zeros(N,K);

while ~converged

    for k = 1:K
         Nk(k)= sum(Z(:,k)); 
        % Compute kernelised distance
        distance(:,k) = diag(Ke) - (2/(Nk(k)))*sum(repmat(Z(:,k)',N,1).*Ke,2) + ...
            Nk(k)^(-2)*sum(sum((Z(:,k)*Z(:,k)').*Ke));
    end
    oldZ = Z;
    Z = (distance == repmat(min(distance,[],2),1,K));
     % to make it scalar
   Z = 1.0 * Z ;                            
   if sum(sum(oldZ~=Z))==0
       converged = 1;
   end
 
end  

TrainClusterAssignments = Z ;




 for j = 1:K  
        Indx{j} = find(Z(:,j)==1);      
     end




figure(2);
if (k==3)
%%Plot the data with the means
plot(Xtrain(Indx{1,1},1),Xtrain(Indx{1,1},2),'b.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,2},1),Xtrain(Indx{1,2},2),'g.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,3},1),Xtrain(Indx{1,3},2),'r.','MarkerSize' ,12);

legend('Cluster 1','Cluster 2','Cluster 3','Location','NW');
title ('Kmeans clustering of Iris data Set');

else if (k==4)
plot(Xtrain(Indx{1,1},1),Xtrain(Indx{1,1},2),'b.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,2},1),Xtrain(Indx{1,2},2),'g.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,3},1),Xtrain(Indx{1,3},2),'r.','MarkerSize' ,12);
hold on
plot(Xtrain(Indx{1,4},1),Xtrain(Indx{1,4},2),'y.','MarkerSize' ,12);

legend('Cluster 1','Cluster 2','Cluster 3','Location','NW');
title ('Kmeans clustering of Iris data Set');

    else if(k==5)
plot(Xtrain(Indx{1,1},1),Xtrain(Indx{1,1},2),'b.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,2},1),Xtrain(Indx{1,2},2),'g.','MarkerSize',12 );
hold on
plot(Xtrain(Indx{1,3},1),Xtrain(Indx{1,3},2),'r.','MarkerSize' ,12);
hold on
plot(Xtrain(Indx{1,4},1),Xtrain(Indx{1,4},2),'y.','MarkerSize' ,12);
hold on
plot(Xtrain(Indx{1,5},1),Xtrain(Indx{1,5},2),'k.','MarkerSize' ,12);

legend('Cluster 1','Cluster 2','Cluster 3','Location','NW');
title ('Kmeans clustering of Iris data Set');
        end
    end
end


 convergenceStatus = converged;
    
    
