//--------------------------------------------------------------------
// rectangle.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                         // ����������� ������� start()
  {
//--------------------------------------------------------------------
   int
   L=1000,                          // �������� ����� ����
   A,                               // ������ ������� �����������.
   B,                               // ������ ������� �����������.
   S,                               // ������� ��������������
   a,b,s;                           // ������� ��������
//--------------------------------------------------------------------
   for(a=1; a<L/2; a++)             // ��������� ��������� �����
     {                              // ������ ������ ���� �����
      b=(L/2) - a;                  // ������� �������� ������
      s=a * b;                      // ������� �������� �������
      if (s<=S)                     // �������� ������� ��������
         break;                     // ������� �� ������� �����
      A=a;                          // ���������� ������ ��������
      B=b;                          // ���������� ������ ��������
      S=s;                          // ���������� ������ ��������
     }                              // ������ ����� ���� �����
//--------------------------------------------------------------------
   Alert("������������ ������� = ",S,"  A=",A,"  B=",B);// ���������
   return;                             // �������� ������ �� �������
  }
//--------------------------------------------------------------------