#include<iostream>
using namespace std;

class A 
{
	protected:
		int a[2][3];
	public:
	    A(int b, int c, int d, int e, int f, int g)
	    {
		    a[0][0] = b; a[0][1] = c; a[0][2] = d; a[1][0] = e; a[1][1] = f; a[1][2] = g;
	    }
	    A();
	    void show();
	    friend A operator+(A& a1, A& a2);
        friend A operator-(A& a1, A& a2);
};
A::A()
{
	cout << "输入6个整数:  " << endl;
	int i, j;
	for (i = 0; i<2; i++)
	{
		for (j = 0; j<3; j++)
		{
			cin >> a[i][j];
		}
	}
}

A operator+(A& a1, A& a2)
{
	A a3(0,0,0,0,0,0);
	int i, j;
	for (i = 0; i<2; i++)
	{
		for (j = 0; j<3; j++)
		{
			a3.a[i][j] = a1.a[i][j] + a2.a[i][j];
		}
	}
	return a3;
}
A operator-(A& a1, A& a2)
{
	A a3(0,0,0,0,0,0);
	int i, j;
	for (i = 0; i<2; i++)
	{
		for (j = 0; j<3; j++)
		{
			a3.a[i][j] = a1.a[i][j] - a2.a[i][j];
		}
	}
	return a3;
}

void A::show()
{
	int i, j;
	cout << "数组： ";
	for (i = 0; i<2; i++)
	{
		for (j = 0; j<3; j++)
		{
			cout << a[i][j] << " ";
		}
	}
	cout << endl;
}


int main()
{
	A a1(9, 7, 5, 47, 84, 1);
	A a2;
	A w(0,0,0,0,0,0);
	cout<<endl;
	a1.show(); 
	a2.show();
	cout<<endl;
	w = a1 + a2;
	w.show();
	w=a1-a2;
	w.show();
	return 0;
}










