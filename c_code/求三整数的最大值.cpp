/////////////////////////////////////////
///求三整数的最大值      ////////////////
///计算机170205 刘九洲   ////////////////
/////////////////////////////////////////
#include<stdio.h>
int max(int x,int y,int z);
int main()
{
   int a,b,c,d;
   printf("请输入三位整数");
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
