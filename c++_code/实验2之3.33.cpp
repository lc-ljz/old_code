////////////////////////////////////////////////////////////////////////////////////////////////////
///////////
///////////¼ÆËã»ú1702Áõ¾ÅÖÞ 2018.4.8.  20:12 
////////////////////////////////////////////////////////////////////////////////////////////////////


#include<iostream>
using namespace std;

class book
{
	private:
		int qu;
		int price;
		int q;
	public:
		void set(int,int);
		void show();
};

void book::set(int a,int b)
{
	qu=a;price=b;q=qu*price;
}
void book::show()
{
	cout<<q<<"/";
}

int main()
{
	book b[5];
	b[0].set(1,10);b[1].set(2,20);b[2].set(3,30);b[3].set(4,40);b[4].set(5,50);
	b[0].show();b[1].show();b[2].show();b[3].show();b[4].show();
	return 0;
}
