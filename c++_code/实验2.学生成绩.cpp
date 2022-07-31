#include<iostream>
#include<string.h>
using namespace std;
#define size 3
class Student
{
	private:
		int score;
		static int count;
		static double total_score;
	public:
		void account(int);
		static double sum()
		{
			return total_score;
		}
		static double average()
		{
			double average=total_score/count;
			return average;
		}
};
void Student::account(int c)
{
    score=c;
	total_score=total_score+score;
	count=count+1;
}

double Student::total_score=0; int Student::count=0; 

int main()
{
	Student stu[size];;int c,i;
	for(i=0;i<size;i++)
	{
	    cout<<"请输入第"<<i+1<<"个学生的成绩:";
		cin>>c;stu[i].account(c);
		cout<<endl;
	}
	Student::average();
	cout<<"总分为："<<Student::sum()<<endl;
	cout<<"平均分为"<<Student::average()<<endl;
	return 0;
}

