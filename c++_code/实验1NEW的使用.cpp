#include<iostream>
using namespace std;
int main()
{
	double *p,a=3.14,s;
	p=new double;
	*p=2;
	s=a*(*p)*(*p);
	cout<<s<<endl;
	delete p;
	return 0;
}

