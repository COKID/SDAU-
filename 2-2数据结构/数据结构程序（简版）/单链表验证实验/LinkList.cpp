#include <iostream>
using namespace std;
#include "LinkList.h"

LinkList::LinkList(int a[], int n)
{
  first=new Node;
  first->next=NULL;  //��ʼ��һ��������
  for (int i=0; i<n; i++)
  {
    Node *s;
    s=new Node; s->data=a[i];  //Ϊÿ������Ԫ�ؽ���һ�����
    s->next=first->next;       //���뵽ͷ���֮��
    first->next=s;
  }
 }

LinkList:: ~LinkList( )
{
  Node *p, *q;
  p=first;     //����ָ��p��ʼ��
  while (p!=NULL)   //�ͷŵ������ÿһ�����Ĵ洢�ռ�
  {
    q=p;    //�ݴ汻�ͷŽ��
    p=p->next;  //����ָ��pָ���ͷŽ�����һ����㣬ʹ�������Ͽ�
    delete q;    
  }
}

void LinkList::Insert(int i, int x)
{ 
   Node *p;
   int j;
   p=first ; j=0;    //����ָ��p��ʼ��
   while (p!=NULL && j<i-1)
   {
     p=p->next;   //����ָ��p����
     j++;
   }
   if (p==NULL) throw "λ��";
   else { 
	  Node *s;
      s=new Node; 
	  s->data=x;  //���ڴ�����һ�����s����������Ϊx
      s->next=p->next;       //�����s���뵽���p֮��
      p->next=s;
   }
}

int LinkList::Delete(int i)
{ 
  Node *p;
  int j;
  p=first ; j=0;  //����ָ��p��ʼ��
  while (p!=NULL && j<i-1)  //���ҵ�i-1�����
  {
    p=p->next;
    j++;
  }
  if (p==NULL || p->next==NULL) throw "λ��";  //���p�����ڻ���p�ĺ�̽�㲻����
  else {
    Node *q; int x;
    q=p->next; x=q->data;  //�ݴ汻ɾ���
    p->next=q->next;  //ժ��
    delete q; 
    return x;
  }
}

int LinkList::Locate(int x)
{
	Node *p; int j;
	p=first->next; j=1;
	while (p!=NULL && p->data!=x)
    {
       p=p->next;
       j++;
	}
	if (p!=NULL) return j;
	else return 0;
}

void LinkList::PrintList( )
{
	Node *p;
	p=first->next;
	while (p!=NULL)
    {
	  cout<<p->data<<"  ";
	  p=p->next;
	}
	cout<<endl;
}
