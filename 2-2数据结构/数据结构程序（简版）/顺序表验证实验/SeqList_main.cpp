#include <iostream>           //��������������⺯����ͷ�ļ�
using namespace std;
#include "SeqList.h"           //����˳�����������Ͷ���
void main( )
{
      int r[5]={1, 2, 3, 4, 5};
      SeqList L(r, 5);
      cout<<"ִ�в������ǰ����Ϊ��"<<endl;
      L.PrintList( );              //�������Ԫ��
      try                       
	  {
	   L.Insert(2,3);
	  }
      catch (char *s)
      {
        cout<<s<<endl;
      }
      cout<<"ִ�в������������Ϊ��"<<endl;
  L.PrintList( );              //�������Ԫ��
  cout<<"ֵΪ3��Ԫ��λ��Ϊ:";
  cout<<L.Locate(3)<<endl;    //����Ԫ��3���������ڵ�������λ��
 /* cout<<"ִ��ɾ����һ��Ԫ�ز�����ɾ��ǰ����Ϊ��"<<endl;
  L.PrintList( );              //�������Ԫ��
  try                       
  {
    L.Delete(1);                //ɾ����1��Ԫ��
  }
  catch (char *s)
  {
    cout<<s<<endl;
  }
  cout<<"ɾ��������Ϊ��"<<endl;
  L.PrintList( );              //�������Ԫ��*/
}
