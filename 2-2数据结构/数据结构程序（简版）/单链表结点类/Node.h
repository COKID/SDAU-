#ifndef Node_H       //�����ظ�����Node.hͷ�ļ�
#define Node_H
class Node
{
public:
    Node( );         //�޲ι��캯��
    Node(int x);      //�вι��캯��
    ~Node( ); 
    int GetData( );
    void SetData(int x);
private:
    int data;
    Node *next;
};
#endif
