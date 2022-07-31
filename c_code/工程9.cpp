/////////////////////////////////////////////
//文件的打开关闭，简单读出信息和保存信息 
///////////////////////////////////////////// 


#include<stdio.h>

int main()
{
	FILE *fp;int a=1;char b[5]="AS";
	fp=fopen("d:\\table.txt","w");
	fprintf(fp,"学号：%d，姓名：%s",a,b);
	fclose(fp);
	fp=fopen("d:\\table.txt","r");
	fscanf(fp,"学号：%d，姓名：%s",&a,b);
	printf("学号：%d，姓名：%s",a,b);
	fclose(fp);	
	return 0;
}
