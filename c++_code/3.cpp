#include<iostream>
using namespace std;
#define pi 3.14

class container{
	protected:
		double radius;
	public:
	    container(double radiusl);
		virtual double surface_area()=0;
		virtual double volume()=0;	
};
container::container(double radiusl)
{
	radius=radiusl;
} 

class cube:public container
{
	public:
		cube(double radius):container(radius) {}
		double surface_area()
		{
			return (radius*radius*6);
		}
		double volume()
		{
			return (radius*radius*radius);
		}
};

class sphere:public container
{
	public:
		sphere(double radius):container(radius) {}
		double surface_area()
		{
			return (4*pi*radius*radius);
		}
		double volume()
		{
			return ((4.0/3)*pi*radius*radius*radius);
		}
};

class cylinder:public container
{
	double high;
	public:
		cylinder(double radius,double highl):container(radius)
		{
			high=highl;
		}
		double surface_area()
		{
			return (2*pi*radius*radius+2*pi*radius*high);
		}
		double volume()
		{
			return (pi*radius*radius*high);
		}
};


int main()
{
	cube a(6.0);sphere b(5.0);cylinder c(5.0,6.0);
	cout<<"�߳�Ϊ6������������Ϊ�� "<<a.surface_area()<<"       ";
	cout<<"�߳�Ϊ6�����������Ϊ�� "<<a.volume()<<endl;
	cout<<"�뾶Ϊ5����������Ϊ�� "<<b.surface_area()<<"       ";
	cout<<"�뾶Ϊ5���������Ϊ�� "<<b.volume()<<endl;
	cout<<"�뾶Ϊ5,��Ϊ6��Բ��������Ϊ�� "<<c.surface_area()<<"       ";
	cout<<"�뾶Ϊ5,��Ϊ6��Բ�������Ϊ�� "<<c.volume()<<endl;
	return 0;
}
