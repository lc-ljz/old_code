#include"stdio.h"
#include<math.h>
#include<string.h>
int otoi(char b[]);

int main()
{
	char a[80];
	int d;
	printf("������һ���˽��Ƶ�����");
    gets(a);
	printf("\n");
	d=otoi(a);
	printf("�Ѱ˽�����%sת��Ϊʮ������Ϊ%d\n",a,d);
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

