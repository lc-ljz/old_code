function imageshow(A, P1, P2)

if(isequal(P1,eye(length(P1))) && isequal(P2,eye(length(P2))))
    imshow(digit(A));
elseif(isequal(P1, eye(length(P1))))
    subplot(1,3,1); 
    imshow(digit(A)); xlabel('A 右乘 ');
    subplot(1,3,2);
    imshow(digit(P2)); xlabel('P 的结果是');
    subplot(1,3,3);
    imshow(digit(A*P2)); xlabel('AP');
elseif (isequal(P2, eye(length(P2))))
    subplot(1, 3, 1); 
    imshow(digit(P1)); xlabel('P 乘以 ');
    subplot(1, 3, 2);
    imshow(digit(A)); xlabel(' A 等于');
    subplot(1, 3, 3);
    imshow(digit(P1*A)); xlabel('PA');
else
    subplot(1,4,1); 
    imshow(digit(P1)); xlabel('P1');
    subplot(1,4,2);
    imshow(digit(A)); xlabel('A');
    subplot(1,4,3);
    imshow(digit(P2)); xlabel('P2');
    subplot(1,4,4);
    imshow(digit(P1*A*P2)); xlabel('结果');
end
        
end