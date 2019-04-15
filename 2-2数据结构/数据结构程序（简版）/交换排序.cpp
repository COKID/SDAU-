#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void BubbleSort(int r[ ], int n);
int Partition(int r[ ], int first, int end);
void QuickSort(int r[ ], int first, int end);

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
	BubbleSort(b, Max);
	cout<<"ִ�����������Ԫ��Ϊ��";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"�����������У�";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	QuickSort(a, 1, Max);
	cout<<"ִ�п��������Ԫ��Ϊ��";
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

void BubbleSort(int r[ ], int n)    //0�ŵ�Ԫ���������������ݴ浥Ԫ
{	
	int exchange = n, bound = n;   //��һ�����������������[1, n]
	while (exchange != 0)        //����һ�������м�¼����ʱ
	{
		bound = exchange; exchange = 0;  
		for (int j = 1; j < bound; j++)     //һ��������������������[1, bound]
			if (r[j] > r[j+1])
			{
				r[0] = r[j]; r[j] = r[j + 1]; r[j + 1] = r[0];
				exchange = j;         //����ÿһ�μ�¼������λ��
			}
	}
}

int Partition(int r[ ], int first, int end)
{	
	int i = first, j = end;         //��ʼ��
	while (i < j)	
	{  
		while (i < j && r[i] <= r[j]) j--;  //�Ҳ�ɨ��
		if (i < j)
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];
			i++; 
		}
		while (i < j && r[i] <= r[j]) i++;  //���ɨ��
		if (i < j)
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];
			j--; 
		}
	}
	return i;    //iΪ��ֵ��¼������λ��
}

void QuickSort(int r[ ], int first, int end)
{	
	if (first < end)
	{      //���䳤�ȴ���1��ִ��һ�λ��֣�����ݹ����
		int pivot=Partition(r, first, end);    //һ�λ���
		QuickSort(r, first, pivot - 1);     //�ݹ�ض���������н��п�������
		QuickSort(r, pivot + 1, end);     //�ݹ�ض��Ҳ������н��п�������
	}
}
