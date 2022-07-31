#include<iostream>
using namespace std;

class complex{
	private:
		double real;
		double imag;
	public:
		complex(double r,double i)
		{
			real=r;imag=i;
		}
		void print();
		friend complex operator+(complex &c1,complex &c2);
};
void complex::print()
{
	cout<<"("<<real<<","<<imag<<")"<<" ";
}
complex operator+(complex &c1,complex &c2)
{
	complex c3(0,0);
	c3.real=c1.real+c2.real;
	c3.imag=c1.imag+c2.imag; 
	return c3;
}


int main()
{
	complex c1(2.5,3.7),c2(4.2,6.5),c(0,0);
	c=c1+c2;
	c.print();
	return 0;
}
