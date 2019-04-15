#include <iostream>       //�������������
using namespace std;
#include "LinkQueue.h"

template <class DataType>
LinkQueue<DataType>::LinkQueue( )
{
	Node <DataType> *s;
	s=new Node<DataType>;
	s->next=NULL;
	front=rear=s;
}

template <class DataType>
LinkQueue<DataType>::~LinkQueue( )
{
	Node <DataType> *p;
	while(front!=NULL)
	{
		p=front->next;
        delete front;
	    front=p;
	}
}

template <class DataType> 
void LinkQueue<DataType>::EnQueue(DataType x)
{
	Node<DataType> *s;
    s=new Node<DataType>; 
    s->data=x;          //����һ��������Ϊx�Ľ��s
    s->next=NULL;
    rear->next=s;       //�����s���뵽��β
    rear=s;
}

template <class DataType>
DataType LinkQueue<DataType>::DeQueue()
{    
	Node <DataType> *p; 
	int x;
    if (rear==front) throw "����";
    p=front->next; 
	x=p->data;                       //�ݴ��ͷԪ��
    front->next=p->next;             //����ͷԪ�����ڽ��ժ��
    if (p->next==NULL) rear=front;   //�жϳ���ǰ���г����Ƿ�Ϊ1
    delete p;
    return x;
}

template <class DataType> 
DataType LinkQueue<DataType>::GetQueue()
{
    if (front!=rear) 
		return front->next->data;
}

template <class DataType> 
int LinkQueue<DataType>::Empty( )
{
    if(front==rear) 
		return 1;
    else 
		return 0;
}