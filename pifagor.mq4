//--------------------------------------------------------------------
// pifagor.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                             // ����������� ������� start()
  {
   int A=3;                             // ������ �����
   int B=4;                             // ������ �����
   int C_2=A*A + B*B;                   // ����� ��������� �������
   int C=MathSqrt( C_2);                // ���������� ����������
   Alert("���������� = ", C);           // ��������� �� �����
   return;                              // �������� ������ �� �������
  }
//--------------------------------------------------------------------