/*      这是通讯录系统
      开始时间：2017年12月27日
	    制作人：李腾
		版本：2.0 
*/
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

struct address_book
{     
	  char important;//重要性
      char name[20]; //姓名
      char sex[10];  //性别
      char email[30]; //电子信箱
      char addr[50];//地址
      char qqnum[15];   //QQ号码
      char tel[15]; //固定电话
      char mtel[11]; //手机
      struct address_book  *next;
};
struct address_book  *head=NULL,*end=NULL;

void AddTail(); //表尾添加元素
void AddHead(); //表头添加元素
void SaveList();  //保存链表数据
void ReadList();  //打开文件，读入链表数据
void ShowList();  //显示链表
void FindSomeone(); //查询元素
void DeleteSomeone(); //删除元素
void alter();//修改元素
void num();//统计人数

void main()
{
	ReadList(); 
    int choice;
	do
	{
		printf("\t\t *****通讯录***** \n");                               
		printf("\t\t┌───────┐\n");                   
		printf("\t\t│ 1. 添加信息  │\n"); 
		printf("\t\t│ 2. 删除信息  │\n"); 
		printf("\t\t│ 3. 查询信息  │\n"); 
		printf("\t\t│ 4. 显示信息  │\n"); 
		printf("\t\t│ 5. 修改信息  │\n");
		printf("\t\t│ 6. 统计人数  │\n"); 
		printf("\t\t│ 0. 退出程序  │\n"); 
		printf("\t\t└───────┘\n"); 
		printf("\t\t请您选择(0-6):"); 
		scanf("%d",&choice);
		getchar();
		if(choice==1)
		{  
			AddTail();//AddHead();
			ShowList( ); 
			SaveList( );
		}
        else if(choice==2) 
		{
		             DeleteSomeone();
					 ShowList();
		             SaveList();
		}
		else if(choice==3) 
		{
		             FindSomeone();
		}
		else if(choice==4)
		{
 	                 ShowList();
		}
		else if(choice==5)
		{
 	                 alter();
					 ShowList();
		             SaveList();
		}
		else if(choice==6)
		{
			         num();
		}
		else if(choice==0)
		{
		            SaveList();
		            printf("谢谢使用!\n"); break;
		}
		else
		            printf("非法输入,请输入0～6之间的数!\n");
        
	}while(choice!=6);
}
void ReadList()
{
	struct address_book  *newaddress=NULL;
	FILE *fp;
	fp=fopen("d:\\address_book.txt","r");
	if(fp!=NULL)//打开文件成功，读入数据
	{
		int flag;   
		while(1)
		{
			newaddress=(struct address_book *)malloc(sizeof(struct address_book));
			flag=fscanf(fp,"%c %s %s %s %s %s %s %s\n",&newaddress->important,newaddress->name,newaddress->sex,newaddress->email,newaddress->addr,newaddress->qqnum,newaddress->tel,newaddress->mtel);
			if(flag==EOF)//EOF是end of file的缩写
				break;
			if(head==NULL)
				head=newaddress;
			else
				end->next=newaddress;
			end=newaddress;
		}
		if(head!=NULL)
		{
			end->next=NULL;
			printf("已从文件中读入数据创建链表!\n");
		}
		free(newaddress);
		fclose(fp);
	}
}
void SaveList()//保存链表上的数据
{
	struct address_book  *t;
	FILE *fp;
	fp=fopen("d:\\address_book.txt","w+");
	if(fp==NULL)
	{
		printf("无法创建文件!");
		return;
	}
	t=head;
	while(t)
	{
		fprintf(fp,"%c %s %s %s %s %s %s %s\n",t->important,t->name,t->sex,t->email,t->addr,t->qqnum,t->tel,t->mtel);
		t=t->next;
	}
	fclose(fp);
}
void ShowList()//显示链表上的数据
{
	struct address_book *per=head;
	printf("----------------------------------------------------------------------\n"); 
	printf("重要性  姓名  性别    email     地址      地址    QQ号   固定电话  手机\n"); 
	printf("----------------------------------------------------------------------\n"); 
	while(per)
	{   
		printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
		per=per->next;
	}
}
void AddTail()//表尾添加
{
    address_book *temp=NULL;
	while(1)
	{    
		temp=(address_book *)malloc(sizeof(address_book));
		printf("请输入重要性（重要写*，不重要则写#）：");
		scanf("\t%c",&temp->important);
		if(temp->important=='0') break;
		printf("请输入姓名：");scanf("\t%s",temp->name);
		printf("请输入性别:"); scanf("\t%s",temp->sex);
		printf("请输入电子邮箱：");scanf("\t%s",temp->email);
		printf("请输入地址：");scanf("\t%s",temp->addr);
		printf("请输入QQ号码：");scanf("\t%s",temp->qqnum);
		printf("请输入固定电话：");scanf("\t%s",temp->tel);
		printf("请输入手机：");scanf("\t%s",temp->mtel);
		if(head==NULL)
		{       
			head=temp;
			end=temp;
		}
		else
		{      
			end->next=temp; 
			end=temp;
		}
		end->next=NULL;
		getchar();
	}
}
void AddHead()//表头添加
{
    address_book *temp=NULL;
	while(1)
	{    
		temp=(struct address_book *)malloc(sizeof(struct address_book));
		printf("请输入重要性（重要写*，不重要则#）：");
		scanf("%c",&temp->important);
			if(temp->important=='0')//当重要性为"0"时，循环结束
			break;
	    printf("请输入姓名：");scanf("%s",temp->name);
		printf("请输入性别"); scanf("\t%s",temp->sex);
		printf("请输入电子邮箱：");scanf("%s",temp->email);
		printf("请输入地址：");scanf("%s",temp->addr);
		printf("请输入QQ号码：");scanf("%s",temp->qqnum);
		printf("请输入固定电话：");scanf("%s",temp->tel);
		printf("请输入手机：");scanf("%s",temp->mtel);
		address_book *oldhead;
		if(head==NULL)
		{
			head=temp;
			end=temp;
		}
		else
		{
			oldhead=head;//记录以前的表头
			head=temp;//temp作为新表头
			temp->next=oldhead;//新表头的下一个是原来的表头
		}
		end->next=NULL;
		getchar();
	}
}
void FindSomeone()//按姓名查找
{ 
	int m;
	printf("\t\n请选择查询方式:\n");
    printf("\t┌──────┐\n");
    printf("\t│1------姓名 │\n");
    printf("\t│2------电话 │\n");
    printf("\t│3------重要 │\n");
    printf("\t└──────┘\n");
    printf("请选择:");
    scanf("%d",&m);
    while(m<1||m>4)
    { 
		printf("输入错误，请重新选择:");
		scanf("%d",&m);
	}
	struct address_book *per=head;
	if(m==1)
	{
		char s[20]; 
		int i=0; 
		printf("\t请输入想查询的姓名:"); 
		scanf("\t%s",s); 
		while(per!=NULL&&strcmp(per->name,s)!=0) per=per->next; 
		if(per==NULL) 
		{
			printf("\t通讯录中没有此人!\n"); 
			return; 
		} 
		printf("\t已查到，信息如下:\n"); 
		printf("----------------------------------------------------------------------\n");
	    printf("重要性  姓名  性别    email     地址      地址    QQ号   固定电话  手机\n"); 
	    printf("----------------------------------------------------------------------\n"); 
		printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
	} 	
	if(m==2)
	{
		char s[20]; 
		int i=0; 
		printf("\t请输入想查询的电话:"); 
		scanf("\t%s",s); 
		while (per != NULL&&strcmp(per->tel, s) != 0) 
		per = per->next;
		if (per == NULL)
		{
			printf("\t通讯录中没有此人!\n"); 
			return; 	
		} 
		printf("\t已查到，信息如下:\n");
		printf("----------------------------------------------------------------------\n");
	    printf("重要性  姓名  性别    email     地址      地址    QQ号   固定电话  手机\n"); 
	    printf("----------------------------------------------------------------------\n"); 
		printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
	}	
	if(m==3)
	{
	    while(per!=NULL)
		{
		     if(per->important=='*') printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
             per=per->next;
		} 
	}
}
void DeleteSomeone()//删除信息
{
	struct address_book *temp=NULL;
	int flag=0;
	char xname[20];
	printf("请输入名字:");
	scanf("%s",xname);
	if(head==NULL)
	{
		printf("表为空!\n");
		return;
	}
	if(strcmp(head->name,xname)==0)
	{
		temp=head;
		head=head->next;
		free(temp);
		flag=1;
	}
	else
	{
	struct address_book *pre=head;
	while(pre)
	{	
		if(pre->next==NULL)
			break;
		if(strcmp(pre->next->name,xname)==0)
		{
			temp=pre->next;
			pre->next=temp->next;
			free(temp);
			flag=1;
			break;
		}
		pre=pre->next;
	}
	}
	if(flag==0)
		printf("未发现!\n");
}
void alter()//修改信息
{
	struct address_book *per=head;
	char s[20];
	int i = 0, select;
	printf("\t请输入想修改的记录中的名字:");
	scanf("%s", s);
	while (per!=NULL&&strcmp(per->name, s) != 0) per = per->next;
	if (per == NULL)
		{
		   printf("\t通讯录中没有此人!\n");
		   return;
		}
	  printf("\t已查到，信息如下:\n");
	  printf("----------------------------------------------------------------------\n");  
	  printf("重要性  姓名  性别    email     地址      地址    QQ号   固定电话  手机\n"); 
      printf("----------------------------------------------------------------------\n"); 
	  printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
	  printf("\t请输入修改项: 1-重要性  2-姓名  3-性别  4-email 5-地址  6-QQ号码  7-固定电话 8-手机:(1-8)\n");
	  scanf("%d", &select);
	    if (select<1 && select>8)
	{
		printf("\t非法输入!");
		return;
	}
	switch (select)
	{
	case 1:
		printf("\t重要性:");
		scanf("\t%c", &per->important);
		break;
	case 2:
		printf("\t姓名:");
		scanf("\t%s", per->name);
		break;
	case 3:
		printf("\t:性别");
		scanf("\t%s", per->sex);
		break;
	case 4:
		printf("\temail:");
		scanf("\t%s", per->email);
		break;
	case 5:
		printf("\t地址:");
		scanf("\t%s", per->addr);
		break;
	case 6:
		printf("\tQQ号码:");
		scanf("\t%s", per->qqnum);
		break;
	case 7:
		printf("\t固定电话:");
		scanf("\t%s", per->tel);
		break;
	case 8:
		printf("\t手机:");
		scanf("\t%s", per->mtel);
		break;
	}
	printf("\t修改成功!\n");
}
void num()//统计人数
{
	int i=0;
	struct address_book *per=head;
	while(per)
	{
         i++;
		 per=per->next;
	}
	printf("----------------------------------------------------------------------\n"); 
	printf("总人数为%d人\n",i);
	printf("----------------------------------------------------------------------\n"); 
}

