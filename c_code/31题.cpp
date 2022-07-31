//[31]有如下学生结构体定义，在main函数中定义一个学生结构体数组，输入5个学生的姓名、学号、数学成绩，定义一个选择排序法子函数，按数学成绩由高到低排序，并在main函数中显示排序结果。
struct student 
{  
     char  name[20]; 
     int   num;        
     int   math;    
};
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
void sort(student a[],int); 

int main()
{
	student stu[5];int i;int a[5];
	printf("输入5个学生的姓名、学号、数学成绩：\n");
	for(i=0;i<5;i++)
	{
		scanf("%s %d %d",stu[i].name,&stu[i].num,&stu[i].math);
		printf("\n");
	}
	printf("排序后：\n");

	sort(stu,5);
	
	for(i=0;i<5;i++)
	{
		printf("%s %d %d\n",stu[i].name,stu[i].num,stu[i].math);
	}
	return 0;
}
void sort(student a[],int n)
{
	int i,j;student t;
	for(j=0;j<n;j++)
	{
		for(i=0;i<n-j;i++)
		{
			if(a[i].math<a[i+1].math)
			{
				t=a[i];a[i]=a[i+1];a[i+1]=t;
			}
		}
	}
}
