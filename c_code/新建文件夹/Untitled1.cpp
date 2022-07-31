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

void PreOrderTraverse(BiTree T)//二叉树的先序遍历
{
    if(T==NULL)
        return ;
    printf("%c ",T->data);
    PreOrderTraverse(T->lchild);
    PreOrderTraverse(T->rchild);
}
void InOrderTraverse(BiTree T)//二叉树的中序遍历
{
   if(T==NULL)
       return ;
   InOrderTraverse(T->lchild);
    printf("%c ",T->data);
   InOrderTraverse(T->rchild);
}
void PostOrderTraverse(BiTree T)//二叉树的后序遍历
{
    if(T==NULL)
        return;
    PostOrderTraverse(T->lchild);
    PostOrderTraverse(T->rchild);
    printf("%c ",T->data);
}
void LevelOrderTraverse(BiTree T)//二叉树的层次遍历 
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
            tempNode = BiQueue[front++]; //取出队头元素，并使队头指针向后移动一位　
            if(!IsEmpty_BiTree(&(tempNode->lchild)))//判断左右子树是否为空,若为空，则加入队列　
                BiQueue[rear++] = tempNode->lchild;
            if(!IsEmpty_BiTree(&(tempNode->rchild)))
                BiQueue[rear++] = tempNode->rchild;
             printf("%c ",tempNode->data);
        }
    }
}
void CreateBiTree(BiTree *T)//前序遍历创建树 
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
int BinTreeDetth(BiTree T)//树的深度 
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

int LeafCount(BiTree T)//求二叉树中叶子的数目 
{
    if(!T) return 0;//空树没有叶子 
    else if(!T->lchild&&!T->rchild) return 1; //叶子结点 
    else return LeafCount(T->lchild)+LeafCount(T->rchild); //左子树叶子数加上右子树叶子数 
} 
int NodeCount(BiTree T)//求二叉树中结点的数目   
{
    if(!T) return 0;//空树没有结点 
    else return NodeCount(T->lchild)+NodeCount(T->rchild)+1; //左、右子树结点数加根结点 
} 
void change(BiTree T)//交换二叉树中所有结点的左、右子树
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
    printf("前序遍历：\n");PreOrderTraverse(T);printf("\n");
    printf("中序遍历：\n");InOrderTraverse(T);printf("\n");
    printf("后序遍历：\n");PostOrderTraverse(T);printf("\n");
    printf("层次遍历：\n");LevelOrderTraverse(T);printf("\n");
    int deepth=BinTreeDetth(T);//深度 
    printf("树的深度：%d\n",deepth);
    int num2=NodeCount(T);//结点数
    printf("树的结点数：%d\n",num2);
    int num1=LeafCount(T);//叶子数 
    printf("树的叶子数：%d\n",num1);
    printf("交换左右子树："); 
    change(T);
    PreOrderTraverse(T);printf("\n");
    return 0;
}

