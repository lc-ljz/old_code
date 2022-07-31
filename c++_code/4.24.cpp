#include<iostream>
#include<math.h>
using namespace std;

int i=2;

class A
{
	int a,b,t;
public:
	A(int w,int s):a(w),b(s)
	{}
	int f()
	{
		if((a%i==0)&&(b%i==0)&&(i<=a)&&(i<=b))
		{
			t=i;i++;f();
		}
		else if((i>a)||i>b)
		{
			return t;
		}
		else
		{
			i++;f();
		}
	}
};

class B:public A
{
	int t;
public:
	B(int w,int s):A(w,s)
	{}
	void q()
	{
		t=A::f();
		cout<<"50与150的最大公约数为"<<t<<endl;
	}
};

int main()
{
	int t;
	B num(50,150);
	num.q();
	return 0;
}

