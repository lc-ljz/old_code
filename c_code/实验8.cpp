#include<stdio.h>
#include<string.h>

struct student
{
	int num;
	char name[20];
	int grade;
	struct student *next;
};
int main()
{
	struct student student1,student2,student3,*p,*head=NULL;
	char a[4]="ab",b[4]="cd",c[5]="ef";
	
	head=&student1;student1.next=&student2;student2.next=&student3;student3.next=NULL;
	student1.num=1;strcpy(student1.name,a);student1.grade=80;
	student2.num=2;strcpy(student2.name,b);student2.grade=70;
	student3.num=3;strcpy(student3.name,c);student3.grade=90;
	
	p=head;
	while(p!=NULL)
	{
		printf("Ñ§ºÅ£º%d  ÐÕÃû£º%s  ³É¼¨£º%d\n",p->num,p->name,p->grade);
		p=p->next;
	}
	p=NULL;
	return 0;
}
