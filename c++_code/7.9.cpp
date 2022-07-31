#include<iostream>
#include<iomanip>
using namespace std;

int main()
{
	int i,j,k=1;
	for(i=1;i<10;i++)
	{
		for(j=i;j>0;j--)
		{
			k=j*k;
		}
		cout<<setw(10)<<i<<"!"<<"="<<k<<endl;
		k=1;
	}
	return 0;
}
