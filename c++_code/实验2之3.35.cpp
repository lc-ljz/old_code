#include<iostream>
#include<string.h>
using namespace std;

class Stock
{
    private:
		char stockcode[7];
	    int quan; double price;
	
    public:
		Stock(char na[], int q, double p)
	   {
		   strcpy(stockcode, na);
		   quan = q; price = p;
	    }
	    Stock(char na[])
	   {
		   strcpy(stockcode, na); quan = 1000; price = 8.98;
	    }
	    void print()
	   {
		   cout << this->stockcode<< " " << this->quan << " " << this->price << endl;
	    }
};

int main()
{
	char a[]="600001";
	Stock s1(a, 3000, 5.67);
	Stock s2(a);
	s1.print(); s2.print();
	return 0;
}
