/////////////////////////////////////////
///�������������ֵ      ////////////////
///�����170205 ������   ////////////////
/////////////////////////////////////////
#include<stdio.h>
int max(int x,int y,int z);
int main()
{
   int a,b,c,d;
   printf("��������λ����");
   scanf("%d %d %d",&a,&b,&c);
   
   d=max(a,b,c);
   printf("max=%d",d);
   return 0;
}
   int max(int x,int y,int z)
   {
   	int p,o;
   	if(x>y)p=x;
   	else p=y;
   	if(p>z)o=p;
   	else o=z;
   	return(o);
   }
