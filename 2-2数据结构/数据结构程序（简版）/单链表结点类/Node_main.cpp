#include <iostream>
using namespace std;
#include "Node.h"

int  main( )
{
  Node t;              //�����޲ι��캯������data��ʼ��Ϊ0
  Node s(5);           //�����вι��캯������data��ʼ��Ϊ5
  cout<<t.GetData( )<<endl;  //�����0
  cout<<s.GetData( )<<endl;  //�����5
  t.SetData(10);
  cout<<t.GetData( )<<endl;  //�����10
  return 0;
}                  
