#include<iostream>
#include<string>
using namespace std;

class Time{
	public:
		Time(int h,int m,int s)
		{
			hours=h;minutes=m;seconds=s;
		}
		void display()
		{
			cout<<"出生时间："<<hours<<"时"<<minutes<<"分"<<seconds<<"秒"<<endl;
		}
	protected:
		int hours,minutes,seconds;
};

class Date{
	public:
		Date(int m,int d,int y)
		{
			month=m;day=d;year=y;
		}
		void display()
		{
			cout<<"出生年月："<<year<<"年"<<month<<"月"<<day<<"日"<<endl; 
		}
	protected:
		int month,day,year;
};

class Birthtime:public Time,public Date
{
	string childname;
	public:
		Birthtime(string a,int b,int c,int d,int e,int f,int g):Time(e,f,g),Date(b,c,d)
		{
			childname=a;
		}
		void display()
		{
			cout<<childname<<endl;
			Date::display();Time::display();
		}
};

int main()
{
	Birthtime child("小明",01,01,1998,12,12,12);
	child.display();
	return 0;
}
