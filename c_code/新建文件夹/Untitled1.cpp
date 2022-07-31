#include<stdio.h>
#include<stdlib.h>
#define MAXSIZE 30

typedef struct BiTNode
{
    char data;
    struct BiTNode *lchild,*rchild;
}BiTNode,*BiTree;

int IsEmpty_BiTree(BiTree *T) 
{
	if(*T == NULL)
	return 1;
	else
	return 0;
}

void PreOrderTraverse(BiTree T)//���������������
{
    if(T==NULL)
        return ;
    printf("%c ",T->data);
    PreOrderTraverse(T->lchild);
    PreOrderTraverse(T->rchild);
}
void InOrderTraverse(BiTree T)//���������������
{
   if(T==NULL)
       return ;
   InOrderTraverse(T->lchild);
    printf("%c ",T->data);
   InOrderTraverse(T->rchild);
}
void PostOrderTraverse(BiTree T)//�������ĺ������
{
    if(T==NULL)
        return;
    PostOrderTraverse(T->lchild);
    PostOrderTraverse(T->rchild);
    printf("%c ",T->data);
}
void LevelOrderTraverse(BiTree T)//�������Ĳ�α��� 
{
	if(T==NULL)
        return;
    int front = 0;
    int rear = 0;
    BiTree BiQueue[MAXSIZE];
    BiTree tempNode;
    if(!IsEmpty_BiTree(&T))
	{
        BiQueue[rear++] = T;
        while(front != rear)
		{
            tempNode = BiQueue[front++]; //ȡ����ͷԪ�أ���ʹ��ͷָ������ƶ�һλ��
            if(!IsEmpty_BiTree(&(tempNode->lchild)))//�ж����������Ƿ�Ϊ��,��Ϊ�գ��������С�
                BiQueue[rear++] = tempNode->lchild;
            if(!IsEmpty_BiTree(&(tempNode->rchild)))
                BiQueue[rear++] = tempNode->rchild;
             printf("%c ",tempNode->data);
        }
    }
}
void CreateBiTree(BiTree *T)//ǰ����������� 
{
    char ch;
    scanf("%c",&ch);
    if(ch=='#')
        *T=NULL;
    else
    {
        *T=(BiTree  )malloc(sizeof(BiTNode));
        if(!*T)
            exit(-1);
        (*T)->data=ch;
        CreateBiTree(&(*T)->lchild);
        CreateBiTree(&(*T)->rchild);
    }
}
int BinTreeDetth(BiTree T)//������� 
{
	int deepth = 0;
	if(T)
	{
		int leftdeep = BinTreeDetth(T->lchild);
		int rightdeep = BinTreeDetth(T->rchild);
		deepth = leftdeep+1 > rightdeep+1 ? leftdeep+1 : rightdeep+1; 
	}
	return deepth;
}

int LeafCount(BiTree T)//���������Ҷ�ӵ���Ŀ 
{
    if(!T) return 0;//����û��Ҷ�� 
    else if(!T->lchild&&!T->rchild) return 1; //Ҷ�ӽ�� 
    else return LeafCount(T->lchild)+LeafCount(T->rchild); //������Ҷ��������������Ҷ���� 
} 
int NodeCount(BiTree T)//��������н�����Ŀ   
{
    if(!T) return 0;//����û�н�� 
    else return NodeCount(T->lchild)+NodeCount(T->rchild)+1; //��������������Ӹ���� 
} 
void change(BiTree T)//���������������н�����������
{
   BiTree *t = (BiTree*)malloc(sizeof(BiTree));
   if(T)
   {change(T->lchild);
    change(T->rchild);
	*t=T->lchild;
	T->lchild=T->rchild;
	T->rchild=*t;
	}
 } 

int main()
{
    BiTree T;
    CreateBiTree(&T);
	printf("\n");
    printf("ǰ�������\n");PreOrderTraverse(T);printf("\n");
    printf("���������\n");InOrderTraverse(T);printf("\n");
    printf("���������\n");PostOrderTraverse(T);printf("\n");
    printf("��α�����\n");LevelOrderTraverse(T);printf("\n");
    int deepth=BinTreeDetth(T);//��� 
    printf("������ȣ�%d\n",deepth);
    int num2=NodeCount(T);//�����
    printf("���Ľ������%d\n",num2);
    int num1=LeafCount(T);//Ҷ���� 
    printf("����Ҷ������%d\n",num1);
    printf("��������������"); 
    change(T);
    PreOrderTraverse(T);printf("\n");
    return 0;
}

