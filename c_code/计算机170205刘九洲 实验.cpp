#include<stdio.h>
#include<math.h>
bool lsprime(int x);

int main()
{																																																		
	int n;
	printf("������һ���������� ");
	scanf("%d",&n);
	if(n==1) printf("1��������\n");
	else
	{
		if(lsprime(n))   printf("%d��������\n",n);
        else             printf("%d������\n",n);
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

