//--------------------------------------------------------------------
// conditions.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                                      // ����.������� start
  {
   Alert(Symbol(),"  Sell = ",AccountFreeMargin()// ��� �������
         -AccountFreeMarginCheck(Symbol(),OP_SELL,1));
   Alert(Symbol(),"  Buy = ",AccountFreeMargin() // ��� �������
         -AccountFreeMarginCheck(Symbol(),OP_BUY,1));
   return;                                       // ����� �� start()
  }
//--------------------------------------------------------------------