#ifndef LinkQueue_H
#define LinkQueue_H

template <class DataType>
struct Node
{
    DataType data;
    Node<DataType> *next;  //�˴�<T>Ҳ����ʡ��
};

template <class DataType>
class LinkQueue
{
public:
    LinkQueue( );          //���캯������ʼ��һ���յ�������
    ~LinkQueue( );      //�����������ͷ��������и����Ĵ洢�ռ�
    void EnQueue(DataType x);  //��Ԫ��x���
    DataType DeQueue( );       //����ͷԪ�س���
    DataType GetQueue( );     //ȡ�����еĶ�ͷԪ��
    int Empty( );     //�ж��������Ƿ�Ϊ��
private:
    Node<DataType> *front, *rear;  //��ͷ�Ͷ�βָ�룬�ֱ�ָ��ͷ�����ն˽��
};

#endif;