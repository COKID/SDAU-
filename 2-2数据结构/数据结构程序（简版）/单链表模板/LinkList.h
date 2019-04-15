#ifndef LinkList_H
#define LinkList_H

template <class DataType>
struct Node
{
      DataType data;
      Node<DataType> *next;  
};

template <class DataType>
class LinkList
{
public:
	LinkList( );                     //�޲ι��캯��������ֻ��ͷ���Ŀ�����
	LinkList(DataType a[ ], int n);      //�вι��캯����������n��Ԫ�صĵ�����
	~LinkList( );                    //��������
	int Locate(DataType x);           //��ֵ���ҡ��ڵ������в���ֵΪx��Ԫ�����
	void Insert(int i, DataType x);      //�����������i��λ�ò���Ԫ��ֵΪx�Ľ��
	DataType Delete(int i);           //ɾ���������ڵ�������ɾ����i�����
	void PrintList( );                 //������������������������Ԫ��
private:
	Node<DataType> *first;                     //�������ͷָ��
};
#endif

