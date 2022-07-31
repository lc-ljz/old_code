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
%k-medoids聚类算法

set = [set1;set2;set3];
n = size(set,1);
k = 3;
a = zeros(k,1);
center = zeros(k,2);
new_center = zeros(k,2);
for i = 1:k
    a(i,1) = randi(3000);
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
    
    %不同

      d = zeros(size(p1,1),1);
      d1 = zeros(1,size(p1,1));
      for i = 1:size(p1,1)
          d = sqrt((p1(i,1) - p1(:,1)).^2 + (p1(i,2) - p1(:,2)).^2);
          d1(1,i) = sum(d);
      end
      [~,temp] = min(d1,[],2);
      new_center(1,:) = p1(temp,:);
      
      d = zeros(size(p2,1),1);
      d1 = zeros(1,size(p2,1));
      for i = 1:size(p2,1)
          d = sqrt((p2(i,1) - p2(:,1)).^2 + (p2(i,2) - p2(:,2)).^2);
          d1(1,i) = sum(d);
      end
      [~,temp] = min(d1,[],2);
      new_center(2,:) = p2(temp,:);
      
      d = zeros(size(p3,1),1);
      d1 = zeros(1,size(p3,1));
      for i = 1:size(p3,1)
          d = sqrt((p3(i,1) - p3(:,1)).^2 + (p3(i,2) - p3(:,2)).^2);
          d1(1,i) = sum(d);
      end
      [~,temp] = min(d1,[],2);
      new_center(3,:) = p3(temp,:);
     
    
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