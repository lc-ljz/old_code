#include<iostream>
using namespace std;
const int size=80;
class Stock{
	public:
		Stock()
		{
			strcpy(stockcode," ");
		}
		Stock(char na[],int q=1000,double p=8.98)
		{
			strcpy(stockcode,na);
			quan=q;
			price=p;
		}
		void print(void)
		{
			cout<<this->stockcode;
			cout<<" "<<this->quan<<" "<<this->price<<endl;
		}
	private:
		char stockcode[size];
		int quan;
		double price;
};
int main()
{
	Stock a("600001",3000,5.67);
	a.print();
	Stock b("600001");
	b.print();
	return 0;
}

