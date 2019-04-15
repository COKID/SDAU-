#ifndef LinkList_H
#define LinkList_H
struct Node
{
   int data;
   Node *next;  //�˴�<T>Ҳ����ʡ��
};

class LinkList
{
  public:
    LinkList(int a[], int n);   //������n��Ԫ�صĵ�����
    ~LinkList( );             //��������
    void Insert(int i, int x);   //�ڵ������е�i��λ�ò���Ԫ��ֵΪx�Ľ��
    int Delete(int i);        //�ڵ�������ɾ����i�����
    int Locate(int x);       //��������ֵΪx��Ԫ�����
    void PrintList();           //������������������������Ԫ��
 private:
    Node *first;  //�������ͷָ��
};
#endif

