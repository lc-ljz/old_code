#include<iostream>
#include<cmath>
using namespace std;

class Location
{
	private:
		double x,y;
	public:
		Location(double,double);
		double getx();
		double gety();
		double distance(Location&);
		friend double distance(Location&,Location&); 
};
Location::Location(double q,double p)
{
	x=q;y=p;
}
double Location::getx()
{
	return x;
}
double Location::gety()
{
	return y;
}
double Location::distance(Location &p)
{
	double dx=x-p.x;double dy=y-p.y;
	return (double)sqrt(dx*dx+dy*dy);
}
double distance(Location &A,Location &B)
{
	double distance=sqrt((A.x-B.x)*(A.x-B.x)+(A.y-B.y)*(A.y-B.y));
	return distance;
}

int main()
{
	double d2,d1;
	Location A(-3,-2),B(-3,2);
	d1=A.distance(B);
	d2=distance(A,B);
	cout<<"A("<<A.getx()<<","<<A.gety()<<") B("<<B.getx()<<","<<B.gety()<<")"<<endl;
	cout<<"Distance="<<d1<<endl;
	cout<<"Distance="<<d2<<endl;  
	return 0;
}
