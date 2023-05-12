//--------------------------------------------------------------------
// bigbars.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
extern int Quant_Pt=20;                // ���������� �������
//--------------------------------------------------------------- 2 --
int start()                            // ����. ������� start
  {
   int H_L=0;                          // ������ ����
   for(int i=0; H_L<Quant_Pt; i++)     // ���� �� �����
     {
      H_L=MathAbs(High[i]-Low[i])/Point;//������ ����
      if (H_L>=Quant_Pt)               // ���� ������ ������� ���
        {
         int YY=TimeYear(  Time[i]);   // ���
         int MN=TimeMonth( Time[i]);   // �����         
         int DD=TimeDay(   Time[i]);   // ����
         int HH=TimeHour(  Time[i]);   // ���         
         int MM=TimeMinute(Time[i]);   // ������
         Comment("��������� �������� ���� ����� ",Quant_Pt,//�����
         " pt ��������� ", DD,".",MN,".",YY," ",HH,":",MM);//���������
        }
     }
   return;                             // ����� �� start()
  }
//--------------------------------------------------------------- 3 --