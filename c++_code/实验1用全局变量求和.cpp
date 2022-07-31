//////////////////////////////////////////////////////
///求和，用全局变量 
///计算机1702刘九洲 2018.4.3 
///////////////////////////////////////////////////////
#include<iostream>
using namespace std;
int sum=0;
int main()
{
	int sum=0,a[5]={1,6,97,85,12},i;
	for(i=0;i<5;i++)
	{
		if(a[i]%2!=0)
			sum=sum+a[i];
		::sum=::sum+a[i];
	}
	cout<<sum<<' '<<::sum<<endl;
	return 0;
}

