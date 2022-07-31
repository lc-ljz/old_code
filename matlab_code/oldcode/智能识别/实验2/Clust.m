set1 = mvnrnd([0,0],[0.1,0;0,0.1],2000);
set2 = mvnrnd([1.5,1],[0.07,0;0,1],2000);
set = [set1;set2];
scatter(set(:,1),set(:,2));
axis equal;

n = size(set,1);
k = 2;
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
    
    new_center(1,:) = mean(p1);
    new_center(2,:) = mean(p2);
    
    if isequal(new_center, center) == 1
        break;
    end
    center = new_center;
end

figure;
scatter(p1(:,1),p1(:,2),'b');
hold on;
scatter(p2(:,1),p2(:,2),'r');
axis equal;
