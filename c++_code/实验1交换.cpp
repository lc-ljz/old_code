/////////////////////////////////////////////////////////
///用引用为参数的函数交换两个字符，使显示出先大后小的顺序
///计算机1702刘九洲  2018.4.3 
///////////////////////////////////////////////////////// 


#include<iostream>
using namespace std;

void swap(char &x,char &y);

int main()
{
	char a,b,m;
	cout<<"输入两个字符，用空格分开"<<endl;
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


