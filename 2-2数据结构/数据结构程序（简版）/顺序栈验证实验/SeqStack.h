#ifndef SEQSTACK_H
#define SEQSTACK_H
const int StackSize=10;  //10ֻ��ʾ���Ե����ݣ����Ը���ʵ��������嶨��
template <class DataType>       //����ģ����SeqStack
class SeqStack
{
public:
    SeqStack( ) ;            //���캯����ջ�ĳ�ʼ��
	~SeqStack( );            //��������
    void Push(DataType x);          //��Ԫ��x��ջ
    DataType Pop( );                //��ջ��Ԫ�ص���
    DataType GetTop( );	         //ȡջ��Ԫ�أ�����ɾ����
	int Empty( );           //�ж�ջ�Ƿ�Ϊ��
private:
    DataType data[StackSize];      //���ջԪ�ص�����
    int top;                //ջ��ָ�룬ָʾջ��Ԫ���������е��±�
};
#endif