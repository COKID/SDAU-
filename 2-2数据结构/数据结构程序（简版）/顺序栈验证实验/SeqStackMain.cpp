#include <iostream>         //�������������
using namespace std;
#include "SeqStack.cpp"       //�����Ա�����ļ�

void main( )
{    
    SeqStack<int> S;      //����ģ�����ʵ��
	if (S.Empty()==1)
		cout<<"ջΪ��"<<endl;
	else
        cout<<"ջ�ǿ�"<<endl;
    cout<<"��15��10ִ����ջ����"<<endl;
	S.Push(15);
	S.Push(10);   
	cout<<"ջ��Ԫ��Ϊ:"<<endl;   //ȡջ��Ԫ��
	cout<<S.GetTop( )<<endl;  
	cout<<"ִ��һ�γ�ջ����"<<endl;
	S.Pop( );          //ִ�г�ջ����
    cout<<"ջ��Ԫ��Ϊ:"<<endl;
    cout<<S.GetTop( )<<endl;	
}

