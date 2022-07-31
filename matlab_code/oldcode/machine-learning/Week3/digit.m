function A = digit(X)
[row,col] = size(X);
n = 38;
rowA = row * n + row +1;
colA = col * n + col +1;
A = zeros(rowA,colA,3);

for i = 1:row
    for j = 1:col
        if(X(i,j) == 0),continue;
        else
            img_path = ['digit\' int2str(X(i,j)) '.png'];
            img = imread(img_path);
            A((i+(i-1)*n+1):(i+i*n),(j+(j-1)*n+1):(j+j*n),:) = img;
        end
    end
end
A = uint8(A);
A(1:(1+n):rowA, :, 2) = 255;
A(:, 1:(1+n):colA, 2) = 255;