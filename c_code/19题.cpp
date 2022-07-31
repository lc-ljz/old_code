//主函数中定义两个数组int a[5]={5,4,8,-1,2},b[10]={1,-1,2,4,8,4,0,9,3,7};
//用子函数实现从小到大的冒泡排序，子函数为void bubble(int [ ],int);
//要求在主函数中显示排序前、后的数组a和b的元素。

#include<stdio.h>

void bubble(int[],int);

int main()
{
	int a[5]={5,4,8,-1,2},b[10]={1,-1,2,4,8,4,0,9,3,7};
	int i,j;
	printf("a数组：");
	for(i=0;i<5;i++)
	   printf("%d ",a[i]);
    printf("\n");
    printf("b数组："); 
    for(i=0;i<10;i++)
	   printf("%d ",b[i]);
    printf("\n");
    printf("排序后：\n");
    
    bubble(a,5);bubble(b,10);
    
    printf("a数组：");
    for(i=0;i<5;i++)
	   printf("%d ",a[i]);
    printf("\n");
    printf("b数组：");
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
