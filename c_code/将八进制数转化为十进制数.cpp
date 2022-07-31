#include"stdio.h"
#include<math.h>
#include<string.h>
int otoi(char b[]);

int main()
{
	char a[80];
	int d;
	printf("请输入一个八进制的数：");
    gets(a);
	printf("\n");
	d=otoi(a);
	printf("把八进制数%s转化为十进制数为%d\n",a,d);
	return 0;
}
int otoi(char b[])
{
	int i,m,c=0;
	m=strlen(b);
	for(i=0;i<=m;i++)
	{
		if(b[i]>'0'&&b[i]<'8')
		{
			c=(b[i]-'0')*pow(8,m-1-i)+c;
		}
	}
	return c;
}

