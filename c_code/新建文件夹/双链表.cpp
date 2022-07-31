/* 
14、输入10个学员的信息，每个学员含有成员名为“学号、姓名、性别、成绩一、成绩二、成绩三、成绩四、成绩五、总分、名次”，分别编写六个函数求：
(1)输入一个学员的姓名，查询该学员的信息并输出，若不存在显示没找到。
(2)输入一个新学员的信息，按学号顺序将该学员的信息插入后输出。
(3)输入一个已存在学员的学号信息，删除该学员的信息后输出。
(4)求每个学员的五门成绩总分并输出；
(5)求所有学员的成绩一、成绩二、成绩三、成绩四、成绩五的总和并输出；
(6)对所有数据按总分从高到低排名后填入名次，并输出信息。
要求：
10个学员的数据用文件存储，每个学员的结构体用数组和单链表，
首先建立一个具有10个学员数据的双链表，并编写输出程序，然后程序执行后先显示“菜单”，当输入为1时，执行第（1）个函数；当输入为2时，执行第（2）个函数；
当输入为3时，执行第（3）个函数；当输入为4时，执行第（4）个函数；当输入为5时，执行第（5）个函数；当输入为6时，执行第（6）个函数；当输入为7时，退出系统，当输入其他数字时，提示输入有错误。
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct student
{
	char name[15];
	int num;
	char sex[5];
	int gra[5];
	int ran;
	int sum;
};

typedef struct Node//结点 
{
	student stu;
	student *next;
	student *before;
}Node,*PNode;

int main()
{
	PNode head,p;
	head->next=NULL;head->before=NULL;
//	read(head);

	int choice;
	do
	{
		printf("\t\t\t┌————————————┐\n");
		printf("\t\t\t|                        |\n");
		printf("\t\t\t|     1：查询            |\n");//1:查询 
		printf("\t\t\t|     2：插入            |\n");//2:插入 
		printf("\t\t\t|     3；删除            |\n");//3:删除
		printf("\t\t\t|     4；单人总分        |\n");//4:单人总分 
		printf("\t\t\t|     5；单科总分        |\n");//5:单科总分 
		printf("\t\t\t|     6；成绩排序        |\n");//6:排序 
		printf("\t\t\t|     7；退出            |\n");
		printf("\t\t\t|                        |\n");
		printf("\t\t\t└──———————————┘ \n");
		printf("\t\t请输入功能选择：");//请输入功能选择
		scanf("%d",&choice);
		if(choice==1)//查询
		{
			
		}
		else if(choice==2)//插入
		{
		}
		else if(choice==3) //删除
		{
		}
		else if(choice==4) //单人总分
		{
		}
		else if(choice==5)//单科总分
		{
		}
		else if(choice==6)//6：排序
		{
		}
		else if(choice==7)//7：结束
			printf("谢谢使用!\n");
		else
			printf("非法输入,请输入1～7之间的数!\n");
	}while(choice!=7);
	return 0;
}
