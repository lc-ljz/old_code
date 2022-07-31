//#include<stdio.h>
//int main()
//{
//	char a[20]="I am a boy!";
//	printf("%s\n",a);
//	return 0;
//}


//#include<stdio.h>

//int main()
//{
//	char str[3][20];
//	int i,d;
//	printf("enter str:\n");
//	for(d=0;d<3;d++)
//    	gets (str[d]);
//    printf("put str:\n");
//	for(i=0;i<3;i++)
//	{		   
//		printf("%s\n",str[i]);
//	}
//	return 0;
//}

#include<stdio.h>

int main()
{
	char a[80];
	int i,n1=0,n2=0,n3=0;
	printf("please enter an array:\n");
	gets(a);
	for(i=0;i!='\n';i++)
	{
		if((a[i]<='z'&&a[i]>='a')||(a[i]>='A'&&a[i]<='Z'))
		    n1=n1+1;
		else if(a[i]<='9'&&a[i]>='0')
		    n2=n2+1;
		else
		    n3=n3+1;
	}
	printf("字符串中有%d个英文字母\n",n1);
	printf("字符串中有%d个数字\n",n2);
	printf("字符串中有%d个其它字符\n",n3);
	return 0;
}

