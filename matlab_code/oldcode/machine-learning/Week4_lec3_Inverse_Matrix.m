%% Gauss-Jordan Elimination
A = randn(3);
B = inv(A); % �������Ƿ���ȷ��
AA = [A, eye(3)];
C = rref(AA); % Gauss-Jordan
% �㲻��˵�����������ȷ�ġ� 
%% �ߴ�������ǿ���ĺ��壬����Ľṹ��
img = imread('cameraman.tif');
imshow(img);
img = im2double(img);
img_inverse = inv(img);
figure, imshow(img_inverse); % nonsense

%% ������ѧ� �����Ǿ�����
% ���Ȿ��ѧϰ�ߴ�ʱ�� Ӧ���԰���Ϊ���ģ��������㷨
% �ߵ���ѧ���У� 99% ���������޷����� === û������
% ��ѧ��������ķ�ʽ�� ʲô����õ� === Ψһ��
% ���飬 ��δ֪������ת�����߷ֽ����֪������

%% ѧϰ�����ۣ�����ѧϰ�㷨ʱ�� <�����㷨>�������һ��
