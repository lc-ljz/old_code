//////////////////////////////////////////////////////
/////��ĳ���ʹ�� 
/////�����1702������ 2018.4.3 
/////////////////////////////////////////////////////

#include<iostream>
using namespace std;
class student
{
	int num;
	char a[5];
	public:
		void enter()
		{
			cout<<"����������ѧ��"<<endl; 
			cin>>a>>num;
		}
		void exit()
		{
			cout<<a<<" "<<num<<endl;
		}
};
int main()
{
	student stu1;
	stu1.enter();
	stu1.exit();
	return 0;
}
