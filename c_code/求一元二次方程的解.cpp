//////////////////////////////////////////////
///���⣺ϵ������Ϊ����
//////////////////////////////////////////////
 
 
#include<stdio.h>
#include<math.h>
int main()
{
	int a,b,c; 
	float delta,p,q;
	printf("����������ϵ�����ö��Ÿ�����\n");
	scanf("%d,%d,%d",&a,&b,&c);
	if(a==0)
	{
		if(b==0)
		{
			if(c==0) printf("x1,x2������⡣\n");
			else  printf("error!\n");
		}
		else
		{
			printf("x1=x2=%f\n",-c/b); 
		}
	}
	else
	{
	    delta=b*b-4.0*a*c;
		if(delta==0.0)
		{
			p=-b/(2.0*a);
			printf("x1=x2=%f\n",p);
		} 
		else if(delta>0.0)
		{
			q=sqrt(delta)/(2.0*a);
			p=-b/(2.0*a);
			printf("x1=%f,x2=%f\n",p+q,p-q);
		}
		else
		{
			q=sqrt(-delta)/(2.0*a);
			p=-b/(2.0*a);
			printf("x1=%f+%fi,x2=%f-%fi",p,q,p,q);	
		}
	}
	return 0;
}
