#include<iostream>
#include<string.h>
#define s 5
using namespace std;

int main()
{
	string a[s]={"Germany","Japan","America","Britain","France"},t;
	int i,d=1;
	cout<<"��תǰ��\n";
	for(i=0;i<s;i++)
	{
		cout<<a[i]<<" ";
	}
	cout<<endl;
	cout<<"��ת��\n";
	for(i=0;i<s/2;i++)
	{
		t=a[i];
		a[i]=a[s-d];
		a[s-d]=t;
		d++;
	}
	for(i=0;i<s;i++)
	{
		cout<<a[i]<<" ";
	}
	return 0;	
} 





