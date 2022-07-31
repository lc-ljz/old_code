#include<iostream>
#include<fstream>
using namespace std;

int main()
{
	fstream in;
	in.open("D:\\file1.txt",ios::in);
	if(!in)
	{
		cout<<"Can't open the file1\n";
		return 1;
	}
	fstream out;
	out.open("D:\\file2.txt",ios::out);
	if(!out)
	{
		cout<<"Can't open the file2\n";
		return 2;
	}
	char pa;
	while((pa=in.get())!=EOF)
	{
		out<<char(toupper(pa));
	}
	in.close();
	out.close();
	return 0;
}
