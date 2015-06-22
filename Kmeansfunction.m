function [Means] = KmeansFunction( X , k )
%%
%Kmeans Clustering 
%%
% This Kmeans_classify function has following atttributes
%Input arguments:
% X = it contains N samples of d dimestion
% k = number of clusters
% centroids = means for all clusters as Kxd matrix
% Idx = cluster indices of each point nx1
%%

[N d] = size(X);

% Initilize mean matrices considering one of the training sample from that class
% points to remember while selecting the initial means
% means should not be equal
% means should not be to close
M = zeros(k,d);
for i=1:k 
  M(i,:)= X(i,:) +i ;    
end  

%%
Mnew1 = M;
E_distance = zeros(N,k);

%% Iterations to update the mean of clusters
for m = 1: 1000

%% calculation of euclidean distance
for i = 1: k
Mnew(:,:,i) = repmat(Mnew1(i,:),N,1);
E_distance(:,i) = sqrt(sum((X-Mnew(:,:,i)).^2,2));
end  

%%
S = zeros(N,k);

%% training of centroids
% find the samples closest to the current centroids values
[M , I] = (min (E_distance(:,:),[],2)); 

% % M = minimum value of a sample from all of k means
% % I is nothing but the cluster label
% % i.e if for first sample distance from cluster k is min
% % I(1,1) = 1 , indicating the sample is currently close to centroid k

NumberOfsamples = zeros(k,1);
for i = 1: N
    
    for j = 1: k 
        
        if ( I(i,1) == j)
            NumberOfsamples(j) = NumberOfsamples(j)+1;
     
        
        end
    end
end

for i=1:k
Indx{i} = zeros(NumberOfsamples(i),1);

end
for j = 1:k  
        Indx{j} = find(I(:,1)==j);      
end

%% calculation for the sum of samples from same cluster
Mean = zeros(k,d); 
for j= 1:k
temp = Indx{j};
for i = 1: NumberOfsamples(j)
    temp1(i,:) = X(temp(i),:);
Mean(j,:) = temp1(i,:) + Mean(j,:);    
end
end

for j = 1 : k
    Mnew2(j,:)= (1/NumberOfsamples(j)).*(Mean(j,:));
end

Mnew1 = Mnew2 ;


end

Means = Mnew1 ;
Samplesfromeachclass = NumberOfsamples;


