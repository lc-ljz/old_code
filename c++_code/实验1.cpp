#include<iostream>
#include<cmath>
using namespace std;

int sroot(int a); 
long sroot(long a);
double sroot(double a);

int main()
{
	int a=12;long b=1234;double c=5.67;
	cout<<a<<"�Ķ��η���Ϊ "<<sroot(a)<<endl;
	cout<<b<<"�Ķ��η���Ϊ "<<sroot(b)<<endl;
	cout<<c<<"�Ķ��η���Ϊ "<<sroot(c)<<endl;
	return 0;
}
int sroot(int a)
{
	return sqrt(a);
}
long sroot(long a)
{
	return sqrt(a);
}
double sroot(double a)
{
	return sqrt(a);
}
