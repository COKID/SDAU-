#include <iostream>
using namespace std;
#include <stdlib.h>  
#include <time.h>
const int Max = 10;   

int a[Max + 1] = {0};
void Creat( );
int SeqSearch(int r[ ], int n, int k);

void Creat( )
{
	srand(time(NULL));      
	for (int i = 1; i <= Max; i++)
		a[i] = 1 + rand( ) % Max; 
}

int SeqSearch(int r[ ], int n, int k, int &count)     //�������±�1��ʼ��Ŵ��鼯��
{   
	int i = n;
	r[0] = k ;                        //�±�0����������
	while (++count && r[i] != k)                  //�����ж��±�i�Ƿ�Խ��
		i--;
	return i;
}

int main( )
{
    int location=0, count = 0, k;
	Creat( );
	for (int i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	k = 1 + rand( ) % Max;
	location=SeqSearch(a, Max, k, count);
	cout<<"Ԫ��"<<k<<"�������е������"<<location;
	cout<<", ���Ƚ�"<<count<<"��"<<endl; 
	return 0;
}