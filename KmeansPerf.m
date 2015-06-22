function [ClusterAssignments] = kmeansPerf(Xtest, Means)
% where Xtest 2 RNtestD contains Ntest test samples arranged in rows 
% Means 2 RKD containing the cluster mean vectors (one for each cluster)
% arranged in rows. 
% The return argument is ClusterAssignments whose components
% are the cluster assignments for each test sample.



[N d] = size(Xtest);

%% Initilize mean matrices considering one of the training sample from that class
%% points to remember while selecting the initial means
[k d] = size(Means);
Mnew1 = Means;
E_distance = zeros(N,k);

%% Iterations to update the mean of clusters


%% calculation of euclidean distance
for i = 1: k
Mnew(:,:,i) = repmat(Mnew1(i,:),N,1);
E_distance(:,i) = sqrt(sum((Xtest-Mnew(:,:,i)).^2,2));
end  


%% training of centroids
% find the samples closest to the current centroids values
[M , I] = (min (E_distance(:,:),[],2)); 

% % M = minimum value of a sample from all of k means
% % I is nothing but the cluster label
% % i.e if for first sample distance from cluster k is min
% % I(1,1) = 1 , indicating the sample is currently close to centroid k

ClusterAssignments = I ;

end

