/////////////////////////////////////////////////////////
///������Ϊ�����ĺ������������ַ���ʹ��ʾ���ȴ��С��˳��
///�����1702������  2018.4.3 
///////////////////////////////////////////////////////// 


#include<iostream>
using namespace std;

void swap(char &x,char &y);

int main()
{
	char a,b,m;
	cout<<"���������ַ����ÿո�ֿ�"<<endl;
	cin>>a>>b;
	if(a<b)
	{
		swap(a,b);
	}
	cout<<a<<' '<<b<<endl;
	return 0;
}
void swap(char &x,char &y)
{
	char m;
	m=x;x=y;y=m;
}


