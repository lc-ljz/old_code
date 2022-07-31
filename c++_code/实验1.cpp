#include<iostream>
#include<cmath>
using namespace std;

int sroot(int a); 
long sroot(long a);
double sroot(double a);

int main()
{
	int a=12;long b=1234;double c=5.67;
	cout<<a<<"的二次方根为 "<<sroot(a)<<endl;
	cout<<b<<"的二次方根为 "<<sroot(b)<<endl;
	cout<<c<<"的二次方根为 "<<sroot(c)<<endl;
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
