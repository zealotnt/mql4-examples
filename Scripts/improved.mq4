//--------------------------------------------------------------------
// improved.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                                     // ����. ������� start
  {
   double bid   =MarketInfo("GBPUSD",MODE_BID); // ������ �������� Bid
   double ask   =MarketInfo("GBPUSD",MODE_ASK); // ������ �������� Ask
   double point =MarketInfo("GBPUSD",MODE_POINT);//������ Point
   // �������� BUY
   OrderSend("GBPUSD",OP_BUY,0.1,ask,3,bid-15*Point,bid+15*Point);
   Alert (GetLastError());                      // ��������� �� ������
   return;                                      // ����� �� start()
  }
//--------------------------------------------------------------------