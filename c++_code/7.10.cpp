#include<iostream>
using namespace std;

int main()
{
	int i,j,n=-1,k=20;
	for(i=0;i<7;i++)
	{
		n=n+2;k--;
		cout.width(k);
		for(j=0;j<n;j++)
		{
			cout<<"A";
		}
		cout<<endl;	
	}
	return 0;
}
