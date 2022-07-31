#include<iostream>
using namespace std;

class area_c1{
	protected:
		double height;
		double width;
	public:
		area_c1(double r,double s)
		{
			height=r;width=s;
		}
//		virtual double area()=0;
};

class rectangle:public area_c1{
	public:
		rectangle(double r,double s):area_c1(r,s)
		{}
		double area()
		{
			return height*width;
		}
};

class isosceles:public area_c1{
	public:
		isosceles(double r,double s):area_c1(r,s)
		{}
		double area()
		{
			return (0.5)*height*width;
		}
};

int main()
{
	rectangle a1(10.0,5.0);
	isosceles a2(4.0,6.0);
	cout<<a1.area()<<" "<<a2.area()<<endl;
	return 0;
}
