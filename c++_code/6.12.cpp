#include<iostream>
using namespace std;

template<typename T>
T max(T &a,T &b)
{
	return (a>b?a:b);
}

int main()
{
	int i1,i2,i;
	double d1,d2,d;
	cout<<"输入两个整数： ";cin>>i1>>i2;cout<<endl;
	cout<<"输入两个双精度数： ";cin>>d1>>d2;cout<<endl;
	i=(i1,i2);d=(d1,d2);
	cout<<i1<<"和"<<i2<<"的最大值为"<<i<<endl;
	cout<<d1<<"和"<<d2<<"的最大值为"<<d<<endl;
	return 0;
}
