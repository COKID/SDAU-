#include<iostream>         //�������������
using namespace std;
#include <time.h>
#include <stdlib.h>
const int Max = 11;
int HashSearch(int ht[ ], int m, int k, int &j, int &count);

int main()
{
	int s[9]={47, 7, 29, 11, 16, 92, 22, 8, 3};
	int ht[Max] = {0};
	int temp, i = 0, index = 0, count = 0;
	for (i = 0; i < 9; i++)
	{
		HashSearch(ht, Max, s[i], index, count);
		cout<<"Ԫ�� "<<s[i]<<" ����λ��Ϊ�±� "<<index<<endl;
	}
	cout<<"ɢ�б��е�Ԫ��Ϊ:"<<endl;
	for(i = 0; i < Max; i++)
		cout<<ht[i]<<"   ";
	cout<<endl;
	srand(time(NULL));
	temp = s[rand() % 9];
	cout<<"����Ԫ�� "<<temp<<endl;
	HashSearch(ht, Max, temp, index, count);
	cout<<"���ҳɹ�!"<<"Ԫ�� "<<temp<<" ���±�Ϊ"<<index;
	cout<<" ���Ƚ� "<<count<<" ��"<<endl;
	return 0;
}

int HashSearch(int ht[ ], int m, int k, int &j, int &count) 
{
	int i;
	j = k % m;                         //����ɢ�е�ַ
	count = 1;
	if (ht[j] == k) return 1;    //û�з�����ͻ���Ƚ�һ�β��ҳɹ�
	else if (ht[j] == 0) {ht[j] = k; return 0; }    //���Ҳ��ɹ�������
    i = (j + 1) % m;                            //����̽�����ʼ�±�
    while (ht[i] != 0 && i != j)  
	{
		count++;
		if (ht[i] == k) {j = i; return 1;} //������ͻ���Ƚ����ɴβ��ҳɹ�
		else i = (i + 1) % m;              //���̽��һ��λ��
	}
	if (i == j) {cout<<"���";return 0;}
	else {ht[i] = k; j = i; return 0; }            //���Ҳ��ɹ�������
}