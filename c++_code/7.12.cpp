#include<iostream>
#include<fstream>
using namespace std;
int main()
{
	ofstream out;
	out.open("D:\\stock.txt");
	if(!out)
	{
		cout<<"Cannot open this file\n";
		return 1;
	}
	out<<"Shen fa zhan 000001"<<endl;
	out<<"Shang hai qi che 600104"<<endl;
	out<<"Guang ju neng yuan 000096"<<endl;
	return 0;
}
