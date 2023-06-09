//--------------------------------------------------------------------
// displacement.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
#property indicator_chart_window       // �����. �������� � �������� ����
#property indicator_buffers 3          // ���������� �������
#property indicator_color1 Red         // ���� ������ �����
#property indicator_color2 Blue        // ���� ������ �����
#property indicator_color3 Green       // ���� ������ �����

extern int History  =500;              // �����.����� � ��������� �������
extern int Aver_Bars=5;                // ���������� ����� ��� �������
extern int Left_Right= 5;              // �������� �� ����������� (�����)
extern int Up_Down  =25;               // �������� �� ��������� (�������)

double Line_0[],Line_1[],Line_2[];     // �������� �������� ������
//--------------------------------------------------------------------
int init()                             // ����������� ������� init()
  {
//--------------------------------------------------------------------
   SetIndexBuffer(0,Line_0);           // ���������� ������� ������ 0
   SetIndexStyle (0,DRAW_LINE,STYLE_SOLID,2);// ����� �����
//--------------------------------------------------------------------
   SetIndexBuffer(1,Line_1);           // ���������� ������� ������ 1
   SetIndexStyle (1,DRAW_LINE,STYLE_DOT,1);// ����� �����
//--------------------------------------------------------------------
   SetIndexBuffer(2,Line_2);           // ���������� ������� ������ 2
   SetIndexStyle (2,DRAW_LINE,STYLE_DOT,1);// ����� �����
//--------------------------------------------------------------------
   return;                             // ����� �� ����. �-�� init()
  }
//--------------------------------------------------------------------
int start()                            // ����������� ������� start()
  {
   int i,                              // ������ ����
       n,                              // ���������� �������� (������)
       k,                              // ������ �������� �����. �������
       Counted_bars;                   // ���������� ������������ ����� 
       double
       Sum;                            // ����� Low � High �� �������
//--------------------------------------------------------------------
   Counted_bars=IndicatorCounted();    // ���������� ������������ ����� 
   i=Bars-Counted_bars-1;              // ������ ������� ��������������
   if (i>History-1)                    // ���� ����� ����� �� ..
      i=History-1;                     // ..������������ �������� �����.

   while(i>=0)                         // ���� �� ������������� �����
     {
      Sum=0;                           // ��������� � ������ �����
      for(n=i;n<=i+Aver_Bars-1;n++)    // ���� ������������ �������� 
         Sum=Sum + High[n]+Low[n];     // ���������� ����� ����.��������
      k=i+Left_Right;                  // ���������� ���������� �������
      Line_0[k]= Sum/2 /Aver_Bars;     // �������� 0 ������ �� k-�� ����
      Line_1[k]= Line_0[k]+Up_Down*Point;// �������� 1 ������ 
      Line_2[k]= Line_0[k]-Up_Down*Point;// �������� 2 ������ 

      i--;                             // ������ ������� ���������� ����
     }
//--------------------------------------------------------------------
   return;                             // ����� �� ����. �-�� start()
  }
//--------------------------------------------------------------------