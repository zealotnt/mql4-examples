//--------------------------------------------------------------------
// countticks.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int Tick;                              // ���������� ����������
//--------------------------------------------------------------------
int start()                            // ����������� ������� start()
  {
   Tick++;                             // ������� �����
   Comment("�������� ��� � ",Tick);    // ���������, ���������� �����
   return;                             // �������� ������ �� start()
  }
//--------------------------------------------------------------------