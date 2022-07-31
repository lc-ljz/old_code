#include<iostream>
using namespace std;

int max(int,int);
int max(int,int,int);
double max(double,double);
double max(double,double,double);

int main()
{
	int a,b,c;
	double d,e,f;
	cout<<"输入两个整数"<<endl;
	cin>>a>>b;
	cout<<"max="<<max(a,b)<<endl;
	cout<<"输入三个整数"<<endl;
	cin>>a>>b>>c;
	cout<<"max="<<max(a,b,c)<<endl;
	cout<<"输入两个双精度数"<<endl;
	cin>>d>>e;
	cout<<"max="<<max(d,e)<<endl;
	cout<<"输入三个双精度数"<<endl;
	cin>>d>>e;
	cout<<"max="<<max(d,e,f)<<endl;
	return 0;
}
int max(int x,int y)
{
	if(x>y) return x;
	else return y;
}
int max(int x,int y,int z)
{
	int m;
	if(x>y) m=x;
	else m=y;
	if(m>z) return m;
	else return z;
}
double max(double x,double y)
{
	if(x>y) return x;
	else return y;
}
double max(double x,double y,double z)
{
	double m;
	if(x>y) m=x;
	else m=y;
	if(m>z) return m;
	else return z;
}

