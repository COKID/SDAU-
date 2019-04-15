#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void InsertSort(int r[ ], int n);
void ShellSort(int r[ ], int n);

int main( )
{
	int a[Max + 1] = {0}, b[Max + 1] = {0};
	int i = 0;
	Creat(a, Max);
	for (i = 1; i <= Max; i++)
		b[i] = a[i];
	cout<<"�����������У�";
    for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	InsertSort(b, Max);
	cout<<"ִ��ֱ�Ӳ��������Ԫ��Ϊ��";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"�����������У�";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	ShellSort(a, Max);
	cout<<"ִ��ϣ�������Ԫ��Ϊ��";
	for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	return 0;
}

void Creat(int r[ ], int n)
{
	int i = 0;
	srand(time(NULL));
	for (i = 1; i <= n; i++)
		r[i] = 1 + rand() % 100;
}

void InsertSort(int r[ ], int n)   //0�ŵ�Ԫ�����ݴ浥Ԫ�ͼ�����
{	
	for (int i = 2; i <= n; i++)
	{ 
		r[0]=r[i];                //�ݴ����ؼ��룬�����ڱ�
		for (int j = i - 1; r[0] < r[j]; j--)   //Ѱ�Ҳ���λ��
			r[j + 1] = r[j];            //��¼����
		r[j + 1] = r[0];	
	}
}

void ShellSort(int r[ ], int n)    //0�ŵ�Ԫ�����ݴ浥Ԫ
{
	for (int d = n/2; d >= 1; d = d / 2)   //������Ϊd����ֱ�Ӳ�������
	{
		for (int i = d + 1; i <= n; i++)   
		{   
			r[0] = r[i];    //�ݴ汻�����¼
			for (int j = i - d; j > 0 && r[0] < r[j]; j = j - d)
				r[j + d] = r[j];         //��¼����d��λ��
			r[j + d] = r[0];
		}
	}
}
