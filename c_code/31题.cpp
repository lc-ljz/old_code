//[31]������ѧ���ṹ�嶨�壬��main�����ж���һ��ѧ���ṹ�����飬����5��ѧ����������ѧ�š���ѧ�ɼ�������һ��ѡ�������Ӻ���������ѧ�ɼ��ɸߵ������򣬲���main��������ʾ��������
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
	printf("����5��ѧ����������ѧ�š���ѧ�ɼ���\n");
	for(i=0;i<5;i++)
	{
		scanf("%s %d %d",stu[i].name,&stu[i].num,&stu[i].math);
		printf("\n");
	}
	printf("�����\n");

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
