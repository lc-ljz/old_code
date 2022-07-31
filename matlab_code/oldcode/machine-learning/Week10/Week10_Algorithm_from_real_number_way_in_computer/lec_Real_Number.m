clear;clc;
fprintf("2 + 2 * eps �� 2 �Ƚϣ� ���(logical): %d\n",2 + 2 * eps == 2);
fprintf("1 + 0.5 * eps �� 1 �Ƚϣ� ���(logical): %d\n",1 + 0.5*eps == 1);

a = 315.34293429; 
b = 0.0099832372;
fprintf("a + eps �� a �Ƚϣ� ���(logical): %d\n",a + eps == a);

n = 1;
while(1)
    if(a + n * eps == a)
        n = n + 1;
    else
        n = n - 1;
        break;
    end
end
fprintf("a + n * eps �� a �Ƚϣ� �ý��(logical)Ϊ1���������Ϊ: %d\n",n);

k = -20;
while(1)
    if(b + 2^k * eps == b)
        k = k + 1;
    else
        k = k - 1;
        break;
    end
end
fprintf("b + n * eps (n = 2^k) �� b �Ƚ�, �ý��(logical)Ϊ1���������kΪ: %d\n",k);

% 4. realmax + num ʲôʱ�򲻷���realmax��ֵ�� num��Сȡ����? 
num = 99342923242232322;
while(1)
    if(realmax + num == realmax)
        num = num * 2;
    else
        break;
    end
end
fprintf("realmax + num ������realmax��ֵ�� num��Сȡ: %d\n",num);