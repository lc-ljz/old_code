//[17]����һ���ַ����ֱ�ͳ�Ƴ�����Ӣ����ĸ�����֡��ո�������ַ��ĸ����� (�������飬�����������ַ�����) 
//                                                              ���� 
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	char *a;
	int i,b,n1=0,n2=0,n3=0,n4=0;
	printf("������һ���ַ���\n");
	gets(a);
	b=strlen(a);
	printf("%d",b);
    for(i=0;i<b;i++)
	{
		if((*(a+i)>='a'&&*(a+i)<='z')||(*(a+i))>='A'&&*(a+i)<='Z')
		   n1=n1+1;
		else if(*(a+i)>='0'&&*(a+i)<='9')
		   n2=n2+1;
		else if(*(a+i)==' ')
		   n3=n3+1;
		else
		   n4=n4+1;
    }
	printf("��ĸ������%d\n",n1);
	printf("���ָ�����%d\n",n2);
	printf("�ո������%d\n",n3);
	printf("�������Ÿ�����%d\n",n4);
	a=NULL;
	return 0;
}







//[18]��дһ���Ӻ��������������ַ�������Ϊʵ�Σ�ͳ���ַ�������ĸ�����֡��ո��Լ��������ŵĸ�����Ҫ������������ʾͳ�ƽ����
/*
#include<stdio.h>
#include<string.h>

int n1=0,n2=0,n3=0,n4=0;
void num(char b[])
{
	int i,c;
	c=strlen(b);
	for(i=0;i<c;i++)
	{
		if((b[i]>='a'&&b[i]<='z')||(b[i]>='A'&&b[i]<'Z'))
		   n1=n1+1;
		else if(b[i]>='0'&&b[i]<='9')
		   n2=n2+1;
		else if(b[i]==' ')
		   n3=n3+1;
		else 
		   n4=n4+1;
	}
}
int main()
{
	char a[81];
	printf("����һ���ַ�����\n");
	gets(a);
	num(a);
	printf("��ĸ����Ϊ��%d\n",n1);
	printf("���ָ���Ϊ��%d\n",n2);
	printf("�ո����Ϊ��%d\n",n3);
	printf("�������Ÿ���Ϊ��%d\n",n4);
	return 0;
}

*/
