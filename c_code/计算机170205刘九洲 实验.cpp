#include<stdio.h>
#include<math.h>
bool lsprime(int x);

int main()
{																																																		
	int n;
	printf("请输入一个正整数： ");
	scanf("%d",&n);
	if(n==1) printf("1不是素数\n");
	else
	{
		if(lsprime(n))   printf("%d不是素数\n",n);
        else             printf("%d是素数\n",n);
	}
	
    return 0;
}
bool lsprime(int x)
{
	int i;
	for(i=2;i<=x-1;i++)
	{
		if(x%i==0)  
		    return true;
		else
		    continue; 
	}
	return false;
}

