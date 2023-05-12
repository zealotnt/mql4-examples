//--------------------------------------------------------------------
// indicatorstyle.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
#property indicator_chart_window    // �����. �������� � �������� ����
#property indicator_buffers 1       // ���������� �������
#property indicator_color1 Blue     // ���� ������ �����

double Buf_0[];                     // �������� ������������� �������
//--------------------------------------------------------------- 2 --
int init()                          // ����������� ������� init()
  {
   SetIndexBuffer(0,Buf_0);         // ���������� ������� ������
   SetIndexStyle (0,DRAW_LINE,STYLE_SOLID,2);// ����� �����
   SetIndexLabel (0,"����� High");
   return;                          // ����� �� ����. �-�� init()
  }
//--------------------------------------------------------------- 3 --
int start()                         // ����������� ������� start()
  {
   int i,                           // ������ ����
   Counted_bars;                    // ���������� ������������ ����� 
   Counted_bars=IndicatorCounted(); // ���������� ������������ ����� 
   i=Bars-Counted_bars-1;           // ������ ������� ��������������
   while(i>=0)                      // ���� �� ������������� �����
     {
      Buf_0[i]=High[i];             // �������� 0 ������ �� i-�� ����
      i--;                          // ������ ������� ���������� ����
     }
   return;                          // ����� �� ����. �-�� start()
  }
//--------------------------------------------------------------- 4 --