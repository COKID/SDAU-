#include <iostream>       //�������������
using namespace std;
#include "LinkQueue.cpp"    //�����Ա�����ļ�

void main()
{
    LinkQueue<int> Q;         //����ģ�����ʵ�� 
    if (Q.Empty())
	    cout<<"����Ϊ��"<<endl;
	else
		cout<<"���зǿ�"<<endl;
	cout<<"Ԫ��10��15ִ����Ӳ���:"<<endl;
	try
	{
		Q.EnQueue(10);             //��Ӳ���
        Q.EnQueue(15);
	}
	catch (char* wrong)
	{
		cout<<wrong<<endl;;
	}
	cout<<"�鿴��ͷԪ��:"<<endl;
	cout<<Q.GetQueue( )<<endl;     //����ͷԪ��
	cout<<"ִ�г��Ӳ���:"<<endl;  //���Ӳ���
	try
	{
	    Q.DeQueue( );              
	}
	catch (char* wrong)
	{
		cout<<wrong<<endl;
	}
	cout<<"�鿴��ͷԪ��:"<<endl;
	cout<<Q.GetQueue( )<<endl;
}
