//--------------------------------------------------------------------
// externvar.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
extern double Level=1.2500;                     // ������� ����������
extern int        n=5;                          // ������� ����������
       bool  Fact_1=false;                      // ���������� �������.
       bool  Fact_2=false;                      // ���������� �������.
//--------------------------------------------------------------------
int start()                                     // ����. ������� start
  {
   double Price=Bid;                            // ��������� �������.
   if (Fact_2==true)                            // ���� ��������� ���..
      return;                                   // ..����, �� �������

   if (NormalizeDouble(Price,Digits)>=NormalizeDouble(Level,Digits))
      Fact_1=true;                              // ��������� ������� 1

   if (Fact_1==true && NormalizeDouble(Price,Digits)<=
                         NormalizeDouble(Level-n*Point,Digits))

      My_Alert();                               // ����� �����. �-��
   return;                                      // ����� �� start()
  }
//--------------------------------------------------------------------
void My_Alert()                                 // �������������. �-��
  {
   Alert("������� ����������");                 // ���������
   Fact_2=true;                                 // ��������� ������� 2
   return;                                      // ����� �� �����.�-��
  }
//--------------------------------------------------------------------