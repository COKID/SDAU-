#include <iostream>
using namespace std;
#include "Tree.h"

Tree::Tree( )
{
	TNode *Q[Max] = {NULL};
	char ch1 = '#', ch2 = '#';
	int front = -1, rear = -1;
	TNode *p = NULL, *q = NULL;
	cout<<"���������㣺";
	cin>>ch1;
	p = new TNode; p->data = ch1; 
	p->firstchild = p->rightsib = NULL;
	root = p;
	Q[++rear] = p;
    cout<<"��������ԣ��Կո�ָ���";
	fflush(stdin);
    ch1 = getchar(); getchar(); ch2 = getchar();
	while (ch1 != '#' || ch2 != '#')
	{
		p = new TNode; p->data = ch2; 
		p->firstchild = p->rightsib = NULL;
		Q[++rear] = p;
		while (front < rear)
		{
			q = Q[front + 1];
			if (q->data != ch1)
				front++;
			else 
			{
				if (q->firstchild == NULL)
					q->firstchild = p;
				else
				{
					while (q->rightsib != NULL)
						q = q->rightsib;
					q->rightsib = p;
				}
				break;
			}
		}
		cout<<"��������ԣ��Կո�ָ���";
		fflush(stdin);
        ch1 = getchar(); getchar(); ch2 = getchar();
	}
}

void Tree::Release(TNode *bt)
{
	if (bt == NULL)  return;     //�ݹ���õĽ�������
	else
	{
		Release(bt->firstchild);  //����ݹ��ͷ�bt�ĵ�һ������  
		Release(bt->rightsib);    //����ݹ��ͷ�bt�����ֵ�����  
		delete bt;                //�ͷŸ����
	}
}

void Tree::PreOrder(TNode *bt)
{
	if (bt == NULL)  return;     //�ݹ���õĽ�������
	else
	{
		cout<<bt->data;         //���ʸ�����������
		PreOrder(bt->firstchild);  //ǰ��ݹ����root�ĵ�һ������    
		PreOrder(bt->rightsib);    //ǰ��ݹ����root�����ֵ�����  
	}
}

void Tree::PostOrder(TNode *bt)
{
	if (bt == NULL)  return;     //�ݹ���õĽ�������
	else
	{
		PostOrder(bt->firstchild);  //����ݹ����root�ĵ�һ������  
		PostOrder(bt->rightsib);    //����ݹ����root�����ֵ�����  
		cout<<bt->data;         //���ʸ�����������
	}
}
