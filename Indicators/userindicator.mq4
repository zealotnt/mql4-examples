//--------------------------------------------------------------------
// userindicator.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
#property indicator_chart_window    // �����. �������� � �������� ����
#property indicator_buffers 2       // ���������� �������
#property indicator_color1 Blue     // ���� ������ �����
#property indicator_color2 Red      // ���� ������ �����

double Buf_0[],Buf_1[];             // �������� ������������ ��������
//--------------------------------------------------------------------
int init()                          // ����������� ������� init()
  {
//--------------------------------------------------------------------
   SetIndexBuffer(0,Buf_0);         // ���������� ������� ������
   SetIndexStyle (0,DRAW_LINE,STYLE_SOLID,2);// ����� �����
//--------------------------------------------------------------------
   SetIndexBuffer(1,Buf_1);         // ���������� ������� ������
   SetIndexStyle (1,DRAW_LINE,STYLE_DOT,1);// ����� �����
//--------------------------------------------------------------------
   return;                          // ����� �� ����. �-�� init()
  }
//--------------------------------------------------------------------
int start()                         // ����������� ������� start()
  {
   int i,                           // ������ ����
       Counted_bars;                // ���������� ������������ ����� 
//--------------------------------------------------------------------
   Counted_bars=IndicatorCounted(); // ���������� ������������ ����� 
   i=Bars-Counted_bars-1;           // ������ ������� ��������������
   while(i>=0)                      // ���� �� ������������� �����
     {
      Buf_0[i]=High[i];             // �������� 0 ������ �� i-�� ����
      Buf_1[i]=Low[i];              // �������� 1 ������ �� i-�� ����
      i--;                          // ������ ������� ���������� ����
     }
//--------------------------------------------------------------------
   return;                          // ����� �� ����. �-�� start()
  }
//--------------------------------------------------------------------