//�������ж�����������int a[5]={5,4,8,-1,2},b[10]={1,-1,2,4,8,4,0,9,3,7};
//���Ӻ���ʵ�ִ�С�����ð�������Ӻ���Ϊvoid bubble(int [ ],int);
//Ҫ��������������ʾ����ǰ���������a��b��Ԫ�ء�

#include<stdio.h>

void bubble(int[],int);

int main()
{
	int a[5]={5,4,8,-1,2},b[10]={1,-1,2,4,8,4,0,9,3,7};
	int i,j;
	printf("a���飺");
	for(i=0;i<5;i++)
	   printf("%d ",a[i]);
    printf("\n");
    printf("b���飺"); 
    for(i=0;i<10;i++)
	   printf("%d ",b[i]);
    printf("\n");
    printf("�����\n");
    
    bubble(a,5);bubble(b,10);
    
    printf("a���飺");
    for(i=0;i<5;i++)
	   printf("%d ",a[i]);
    printf("\n");
    printf("b���飺");
    for(i=0;i<10;i++)
	   printf("%d ",b[i]);
    printf("\n");
}
void bubble(int a[],int b)
{
	int i,j,t;
	for(i=0;i<b;i++)
	{
		for(j=0;j<b-i;j++)
		{
			if(a[j]>a[j+1])
			{
				t=a[j];a[j]=a[j+1];a[j+1]=t;
			}
		}
	}

}
