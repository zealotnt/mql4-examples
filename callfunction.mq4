//--------------------------------------------------------------------
// callfunction.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                               // �������� ������� start()
  {                                       // ������ ���� �-�� start()
   int n;                                 // ���������� ����������
   int T=15;                              // �������� �����
   for(int i=Func_yes_ret(T);i<=10;i++)   // ������������� ������� �..
      //.��������� ��������� �����
     {                                    // ������ ���� ����� for
      n=n+1;                              // ������� ��������
      Alert ("�������� n=",n," i=",i);    // �������� ������ �������
     }                                    // ����� ���� ����� for
   return;                                // ����� �� ������� start()
  }                                       // ����� ���� �-�� start()
//--------------------------------------------------------------------
int Func_yes_ret (int Times_in)           // �������� ���������. �-��
  {                                       // ������ ���� �����. �-��
   datetime T_cur=TimeCurrent();          // ������������� ������� �.. 
   // ..��������� ������������
   if(TimeHour(T_cur) > Times_in)         // ������������� ������� �.. 
      //..��������� ������.if-else
      return(1);                          // ������� �������� 1
   return(5);                             // ������� �������� 5
  }                                       // ����� ���� �������. �-��
//--------------------------------------------------------------------