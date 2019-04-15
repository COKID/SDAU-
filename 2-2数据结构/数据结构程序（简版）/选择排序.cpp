#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void SelectSort(int r[ ], int n);
void Sift(int r[ ], int k, int m);
void HeapSort(int r[ ], int n);

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
	SelectSort(b, Max);
	cout<<"ִ�м�ѡ�������Ԫ��Ϊ��";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"�����������У�";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	HeapSort(a, Max);
	cout<<"ִ�ж������Ԫ��Ϊ��";
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

void SelectSort(int r[ ], int n)   //0�ŵ�Ԫ���������������ݴ浥Ԫ
{   
	for (int i = 1; i < n; i++)  	 //��n����¼����n-1�˼�ѡ������
	{  
		int index = i; 		
		for (int j = i + 1; j <= n; j++)   //����������ѡȡ��С��¼
			if (r[j] < r[index]) index = j;
		if (index != i) 
		{
			r[0] = r[i]; r[i] = r[index]; r[index] = r[0];
		}
	}
}

void Sift(int r[ ], int k, int m)   //0�ŵ�Ԫ���������������ݴ浥Ԫ
{
	int i = k, j = 2 * i;     //iָ��ɸѡ��㣬jָ����i������
	while (j <= m)             //ɸѡ��û�н��е�Ҷ��
	{
		if (j < m && r[j] < r[j+1]) j++;  //�Ƚ�i�����Һ��ӣ�jָ��ϴ���
		if (r[i] > r[j]) break;         //������Ѿ��������Һ����еĽϴ���
		else
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];   //�����������j����
			i = j; j = 2 * i;           //��ɸ���λ��ԭ�����j��λ��
		}
	}
}

void HeapSort(int r[ ], int n)      //0�ŵ�Ԫ���������������ݴ浥Ԫ
{
	int i = 0;
	for (i = n/2; i >= 1; i--)       //��ʼ���ѣ������һ����֧����������
		Sift(r, i, n); 
    for (i=1; i<n; i++)         //�ظ�ִ�����߶Ѷ����ؽ��ѵĲ���
    {
		r[0] = r[1]; r[1] = r[n - i + 1]; r[n - i + 1] = r[0];
		Sift(r, 1, n-i);
	}
}


