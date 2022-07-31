//[17]输入一行字符，分别统计出其中英文字母、数字、空格和其他字符的个数。 (不用数组，不限制输入字符个数) 
//                                                              错误！ 
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main()
{
	char *a;
	int i,b,n1=0,n2=0,n3=0,n4=0;
	printf("请输入一行字符：\n");
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
	printf("字母个数：%d\n",n1);
	printf("数字个数：%d\n",n2);
	printf("空格个数：%d\n",n3);
	printf("其它符号个数：%d\n",n4);
	a=NULL;
	return 0;
}







//[18]编写一个子函数，主函数用字符数组作为实参，统计字符串中字母、数字、空格以及其他符号的个数，要求主函数中显示统计结果。
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
	printf("输入一个字符串：\n");
	gets(a);
	num(a);
	printf("字母个数为：%d\n",n1);
	printf("数字个数为：%d\n",n2);
	printf("空格个数为：%d\n",n3);
	printf("其它符号个数为：%d\n",n4);
	return 0;
}

*/
