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
	cout<<"�������������� ";cin>>i1>>i2;cout<<endl;
	cout<<"��������˫�������� ";cin>>d1>>d2;cout<<endl;
	i=(i1,i2);d=(d1,d2);
	cout<<i1<<"��"<<i2<<"�����ֵΪ"<<i<<endl;
	cout<<d1<<"��"<<d2<<"�����ֵΪ"<<d<<endl;
	return 0;
}
