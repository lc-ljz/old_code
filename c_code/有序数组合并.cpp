#include<stdio.h>
void hebing(int a[],int b[],int c[]);
int main()
{
	int j;
	int a[7]={1,8,9,12,13,18,25},b[8]={2,6,13,18,21,56,78,86},c[15];
	hebing(a,b,c);
	for(j=0;j<7;j++)
	    printf("%d ",a[j]);
	printf("\n");
	for(j=0;j<8;j++)
	    printf("%d ",b[j]);
	printf("\n");
	for(j=0;j<15;j++)
	    printf("%d ",c[j]);
	printf("\n");
	return 0;
}
void hebing(int a[],int b[],int c[])
{
	int i=0,j=0,k=0;
	while(i<7&&j<8)
	{
		if(a[i]<=b[j])
		{
			c[k++]=a[i];i++;
		}	
		else
		{
			c[k++]=b[j];j++;
		}    
	}
	if(i>=7)
	{
		for(;j<8;j++)
			c[k++]=b[j];
	}
    if(j>=8)
	{
		for(;i<=7;i++)
			c[k++]=a[i];
	}
}
