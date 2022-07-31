#include<iostream>
using namespace std;

template<typename T>
class mode{
	T a,b,c,s;
	public:
		mode()
		{
			cout<<"ÇëÊäÈë3¸öÊý£º";
			cin>>a>>b>>c; 
		}
		T sum()
		{
			s=a+b+c;
			return s;
		}
};

int main()
{
	mode <int>ex1;
	cout<<"sum="<<ex1.sum()<<endl;
	system("pause");
	mode<double>ex2;
	cout<<"sum="<<ex2.sum()<<endl;	
	return 0;
}
