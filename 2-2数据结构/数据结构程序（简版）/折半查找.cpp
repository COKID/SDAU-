#include <iostream>
using namespace std;
#include <stdlib.h>  
#include <time.h>
const int Max = 10;   

int a[Max + 1] = {0};
void Creat( );
int BinSearch1(int r[ ], int n, int k, int &count);

void Creat( )
{
	srand(time(NULL)); 
	a[0] = 0;
	for (int i = 1; i <= Max; i++)
		a[i] = a[i - 1] + rand() % Max; 
}

int BinSearch(int r[ ], int n, int k, int &count)      //�������±�1��ʼ��Ŵ��鼯��
{
	int low = 1, high = n;                 //���ò�������
	int mid;
	while (low <= high)               //���������ʱ
	{ 
		mid = (low + high) / 2;   
		count++;
		if (k < r[mid])	high = mid - 1;
		else if (k > r[mid]) low = mid + 1; 
		     else return mid;             //���ҳɹ�������Ԫ�����
	}
	return 0;                         //����ʧ�ܣ�����0
}

int main( )
{
    int location = 0, count = 0, k;
	Creat( );
	for (int i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	k = a[1 + rand( ) % Max];
	location = BinSearch(a, Max, k, count);
	cout<<"Ԫ��"<<k<<"�������е������"<<location;
    cout<<", ���Ƚ�"<<count<<"��"<<endl; 
	return 0;
}
