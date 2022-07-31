//////////////////////////////////////
/////////////////////////////////////////


#include<iostream>
using namespace std;
template<typename AT>
AT *soot(AT a[],int s)
{
	int i,j;
	AT t;
	for(i=0;i<s;i++)
	{
		for(j=0;j<s-1;j++)
		{
			if(a[j]>a[j+1])
			{
				t=a[j];a[j]=a[j+1];a[j+1]=t;
			}
		}
	}
	return a;
}

int main()
{
	int int_a[5]={69,54,50,12,45};
	double double_b[5]={4.321,9871,6987.2,3.1415,873.14};
	soot(int_a,5);soot(double_b,5);
	int j;
	for(j=0;j<5;j++)
	    cout<<int_a[j]<<"   ";
	cout<<endl;
	for(j=0;j<5;j++)
	    cout<<double_b[j]<<"   ";
	cout<<endl;	
	
	return 0;
}

