/////////////////////////////////////////////
//�ļ��Ĵ򿪹رգ��򵥶�����Ϣ�ͱ�����Ϣ 
///////////////////////////////////////////// 


#include<stdio.h>

int main()
{
	FILE *fp;int a=1;char b[5]="AS";
	fp=fopen("d:\\table.txt","w");
	fprintf(fp,"ѧ�ţ�%d��������%s",a,b);
	fclose(fp);
	fp=fopen("d:\\table.txt","r");
	fscanf(fp,"ѧ�ţ�%d��������%s",&a,b);
	printf("ѧ�ţ�%d��������%s",a,b);
	fclose(fp);	
	return 0;
}
