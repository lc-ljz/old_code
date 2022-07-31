/*      ����ͨѶ¼ϵͳ
      ��ʼʱ�䣺2017��12��27��
	    �����ˣ�����
		�汾��2.0 
*/
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

struct address_book
{     
	  char important;//��Ҫ��
      char name[20]; //����
      char sex[10];  //�Ա�
      char email[30]; //��������
      char addr[50];//��ַ
      char qqnum[15];   //QQ����
      char tel[15]; //�̶��绰
      char mtel[11]; //�ֻ�
      struct address_book  *next;
};
struct address_book  *head=NULL,*end=NULL;

void AddTail(); //��β���Ԫ��
void AddHead(); //��ͷ���Ԫ��
void SaveList();  //������������
void ReadList();  //���ļ���������������
void ShowList();  //��ʾ����
void FindSomeone(); //��ѯԪ��
void DeleteSomeone(); //ɾ��Ԫ��
void alter();//�޸�Ԫ��
void num();//ͳ������

void main()
{
	ReadList(); 
    int choice;
	do
	{
		printf("\t\t *****ͨѶ¼***** \n");                               
		printf("\t\t������������������\n");                   
		printf("\t\t�� 1. �����Ϣ  ��\n"); 
		printf("\t\t�� 2. ɾ����Ϣ  ��\n"); 
		printf("\t\t�� 3. ��ѯ��Ϣ  ��\n"); 
		printf("\t\t�� 4. ��ʾ��Ϣ  ��\n"); 
		printf("\t\t�� 5. �޸���Ϣ  ��\n");
		printf("\t\t�� 6. ͳ������  ��\n"); 
		printf("\t\t�� 0. �˳�����  ��\n"); 
		printf("\t\t������������������\n"); 
		printf("\t\t����ѡ��(0-6):"); 
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
		            printf("ллʹ��!\n"); break;
		}
		else
		            printf("�Ƿ�����,������0��6֮�����!\n");
        
	}while(choice!=6);
}
void ReadList()
{
	struct address_book  *newaddress=NULL;
	FILE *fp;
	fp=fopen("d:\\address_book.txt","r");
	if(fp!=NULL)//���ļ��ɹ�����������
	{
		int flag;   
		while(1)
		{
			newaddress=(struct address_book *)malloc(sizeof(struct address_book));
			flag=fscanf(fp,"%c %s %s %s %s %s %s %s\n",&newaddress->important,newaddress->name,newaddress->sex,newaddress->email,newaddress->addr,newaddress->qqnum,newaddress->tel,newaddress->mtel);
			if(flag==EOF)//EOF��end of file����д
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
			printf("�Ѵ��ļ��ж������ݴ�������!\n");
		}
		free(newaddress);
		fclose(fp);
	}
}
void SaveList()//���������ϵ�����
{
	struct address_book  *t;
	FILE *fp;
	fp=fopen("d:\\address_book.txt","w+");
	if(fp==NULL)
	{
		printf("�޷������ļ�!");
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
void ShowList()//��ʾ�����ϵ�����
{
	struct address_book *per=head;
	printf("----------------------------------------------------------------------\n"); 
	printf("��Ҫ��  ����  �Ա�    email     ��ַ      ��ַ    QQ��   �̶��绰  �ֻ�\n"); 
	printf("----------------------------------------------------------------------\n"); 
	while(per)
	{   
		printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
		per=per->next;
	}
}
void AddTail()//��β���
{
    address_book *temp=NULL;
	while(1)
	{    
		temp=(address_book *)malloc(sizeof(address_book));
		printf("��������Ҫ�ԣ���Ҫд*������Ҫ��д#����");
		scanf("\t%c",&temp->important);
		if(temp->important=='0') break;
		printf("������������");scanf("\t%s",temp->name);
		printf("�������Ա�:"); scanf("\t%s",temp->sex);
		printf("������������䣺");scanf("\t%s",temp->email);
		printf("�������ַ��");scanf("\t%s",temp->addr);
		printf("������QQ���룺");scanf("\t%s",temp->qqnum);
		printf("������̶��绰��");scanf("\t%s",temp->tel);
		printf("�������ֻ���");scanf("\t%s",temp->mtel);
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
void AddHead()//��ͷ���
{
    address_book *temp=NULL;
	while(1)
	{    
		temp=(struct address_book *)malloc(sizeof(struct address_book));
		printf("��������Ҫ�ԣ���Ҫд*������Ҫ��#����");
		scanf("%c",&temp->important);
			if(temp->important=='0')//����Ҫ��Ϊ"0"ʱ��ѭ������
			break;
	    printf("������������");scanf("%s",temp->name);
		printf("�������Ա�"); scanf("\t%s",temp->sex);
		printf("������������䣺");scanf("%s",temp->email);
		printf("�������ַ��");scanf("%s",temp->addr);
		printf("������QQ���룺");scanf("%s",temp->qqnum);
		printf("������̶��绰��");scanf("%s",temp->tel);
		printf("�������ֻ���");scanf("%s",temp->mtel);
		address_book *oldhead;
		if(head==NULL)
		{
			head=temp;
			end=temp;
		}
		else
		{
			oldhead=head;//��¼��ǰ�ı�ͷ
			head=temp;//temp��Ϊ�±�ͷ
			temp->next=oldhead;//�±�ͷ����һ����ԭ���ı�ͷ
		}
		end->next=NULL;
		getchar();
	}
}
void FindSomeone()//����������
{ 
	int m;
	printf("\t\n��ѡ���ѯ��ʽ:\n");
    printf("\t����������������\n");
    printf("\t��1------���� ��\n");
    printf("\t��2------�绰 ��\n");
    printf("\t��3------��Ҫ ��\n");
    printf("\t����������������\n");
    printf("��ѡ��:");
    scanf("%d",&m);
    while(m<1||m>4)
    { 
		printf("�������������ѡ��:");
		scanf("%d",&m);
	}
	struct address_book *per=head;
	if(m==1)
	{
		char s[20]; 
		int i=0; 
		printf("\t���������ѯ������:"); 
		scanf("\t%s",s); 
		while(per!=NULL&&strcmp(per->name,s)!=0) per=per->next; 
		if(per==NULL) 
		{
			printf("\tͨѶ¼��û�д���!\n"); 
			return; 
		} 
		printf("\t�Ѳ鵽����Ϣ����:\n"); 
		printf("----------------------------------------------------------------------\n");
	    printf("��Ҫ��  ����  �Ա�    email     ��ַ      ��ַ    QQ��   �̶��绰  �ֻ�\n"); 
	    printf("----------------------------------------------------------------------\n"); 
		printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
	} 	
	if(m==2)
	{
		char s[20]; 
		int i=0; 
		printf("\t���������ѯ�ĵ绰:"); 
		scanf("\t%s",s); 
		while (per != NULL&&strcmp(per->tel, s) != 0) 
		per = per->next;
		if (per == NULL)
		{
			printf("\tͨѶ¼��û�д���!\n"); 
			return; 	
		} 
		printf("\t�Ѳ鵽����Ϣ����:\n");
		printf("----------------------------------------------------------------------\n");
	    printf("��Ҫ��  ����  �Ա�    email     ��ַ      ��ַ    QQ��   �̶��绰  �ֻ�\n"); 
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
void DeleteSomeone()//ɾ����Ϣ
{
	struct address_book *temp=NULL;
	int flag=0;
	char xname[20];
	printf("����������:");
	scanf("%s",xname);
	if(head==NULL)
	{
		printf("��Ϊ��!\n");
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
		printf("δ����!\n");
}
void alter()//�޸���Ϣ
{
	struct address_book *per=head;
	char s[20];
	int i = 0, select;
	printf("\t���������޸ĵļ�¼�е�����:");
	scanf("%s", s);
	while (per!=NULL&&strcmp(per->name, s) != 0) per = per->next;
	if (per == NULL)
		{
		   printf("\tͨѶ¼��û�д���!\n");
		   return;
		}
	  printf("\t�Ѳ鵽����Ϣ����:\n");
	  printf("----------------------------------------------------------------------\n");  
	  printf("��Ҫ��  ����  �Ա�    email     ��ַ      ��ַ    QQ��   �̶��绰  �ֻ�\n"); 
      printf("----------------------------------------------------------------------\n"); 
	  printf("%c %s %s %s %s %s %s %s\n", per->important,per->name,per->sex,per->email,per->addr,per->qqnum,per->tel,per->mtel);
	  printf("\t�������޸���: 1-��Ҫ��  2-����  3-�Ա�  4-email 5-��ַ  6-QQ����  7-�̶��绰 8-�ֻ�:(1-8)\n");
	  scanf("%d", &select);
	    if (select<1 && select>8)
	{
		printf("\t�Ƿ�����!");
		return;
	}
	switch (select)
	{
	case 1:
		printf("\t��Ҫ��:");
		scanf("\t%c", &per->important);
		break;
	case 2:
		printf("\t����:");
		scanf("\t%s", per->name);
		break;
	case 3:
		printf("\t:�Ա�");
		scanf("\t%s", per->sex);
		break;
	case 4:
		printf("\temail:");
		scanf("\t%s", per->email);
		break;
	case 5:
		printf("\t��ַ:");
		scanf("\t%s", per->addr);
		break;
	case 6:
		printf("\tQQ����:");
		scanf("\t%s", per->qqnum);
		break;
	case 7:
		printf("\t�̶��绰:");
		scanf("\t%s", per->tel);
		break;
	case 8:
		printf("\t�ֻ�:");
		scanf("\t%s", per->mtel);
		break;
	}
	printf("\t�޸ĳɹ�!\n");
}
void num()//ͳ������
{
	int i=0;
	struct address_book *per=head;
	while(per)
	{
         i++;
		 per=per->next;
	}
	printf("----------------------------------------------------------------------\n"); 
	printf("������Ϊ%d��\n",i);
	printf("----------------------------------------------------------------------\n"); 
}

