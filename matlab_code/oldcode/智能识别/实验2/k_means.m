clear %清除工作区中所有变量
rng default %为了运行结果的可再现性 for reproducibility
set1 = mvnrnd([0,0],[0.5,0;0,0.5],1000);
set2 = mvnrnd([2,3],[0.6,0.1;0.1,0.6],1000);
set3 = mvnrnd([-2,3],[0.5,-0.1;-0.1,0.5],1000);
scatter(set1(:,1),set1(:,2),'b');
hold on;
scatter(set2(:,1),set2(:,2),'r');
hold on;
scatter(set3(:,1),set3(:,2),'g');

%%

set = [set1;set2;set3];
[result,b] = kmeans(set,3);
c1 = set(result == 1,:);
c2 = set(result == 2,:);
c3 = set(result == 3,:);
scatter(c1(:,1),c1(:,2),'b');
hold on;
scatter(c2(:,1),c2(:,2),'r');
hold on;
scatter(c3(:,1),c3(:,2),'g');
%%
%k-means
set = [set1;set2;set3];
n = size(set,1);
k = 3;
a = zeros(k,1);
center = zeros(k,2);
new_center = zeros(k,2);
for i = 1:k
    a(i,1) = randi(n);
    center(i,:) = set(a(i,1),:);
end

while 1
    distance = zeros(k,n);
    for k1 = 1:k
        distance(k1,:) = sqrt((set(:,1) - center(k1,1)).^2 + (set(:,2) - center(k1,2)).^2 );
    end
    
    [min1,temp] = min(distance,[],1);
    [b,b1] = find(temp == 1);
    p1 = set(b1,:);
    [b,b2] = find(temp == 2);
    p2 = set(b2,:);
    [b,b3] = find(temp == 3);
    p3 = set(b3,:);
    
    new_center(1,:) = mean(p1);
    new_center(2,:) = mean(p2);
    new_center(3,:) = mean(p3);
    
    if isequal(new_center, center) == 1
        break;
    end
    center = new_center;
end

scatter(p1(:,1),p1(:,2),'b');
hold on;
scatter(p2(:,1),p2(:,2),'r');
hold on;
scatter(p3(:,1),p3(:,2),'g');