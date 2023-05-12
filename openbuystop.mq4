//--------------------------------------------------------------------
// openbuystop.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
int start()                                     // ����.������� start
  {
   int Dist_SL =10;                             // �������� SL (pt)
   int Dist_TP =3;                              // �������� TP (pt)
   double Prots=0.35;                           // ������� ����. ��.
   string Symb=Symbol();                        // ������. ����������
   double Win_Price=WindowPriceOnDropped();     // ����� ������ ������
   Alert("������ ������ ���� Price = ",Win_Price);// ������ �����
//--------------------------------------------------------------- 2 --
   while(true)                                  // ���� �������� ���.
     {
      int Min_Dist=MarketInfo(Symb,MODE_STOPLEVEL);// ���. ���������
      double Min_Lot=MarketInfo(Symb,MODE_MINLOT);// ���. �����. �����
      double Free   =AccountFreeMargin();       // ������� ��������
      double One_Lot=MarketInfo(Symb,MODE_MARGINREQUIRED);//�����.����
      double Lot=MathFloor(Free*Prots/One_Lot/Min_Lot)*Min_Lot;// ����
      //--------------------------------------------------------- 3 --
      double Price=Win_Price;                   // ���� ������ �����
      if (NormalizeDouble(Price,Digits)<        // ���� ������ ������.
         NormalizeDouble(Ask+Min_Dist*Point,Digits))
        {                                       // ������ ��� BuyStop!
         Price=Ask+Min_Dist*Point;              // ����� ������
         Alert("�������� ���������� ����: Price = ",Price);
        }
      //--------------------------------------------------------- 4 --
      double SL=Price - Dist_SL*Point;          // ���������� ���� SL
      if (Dist_SL<Min_Dist)                     // ���� ������ ������.
        {
         SL=Price - Min_Dist*Point;             // ���������� ���� SL
         Alert(" ��������� ��������� SL = ",Min_Dist," pt");
        }
      //--------------------------------------------------------- 5 --
      double TP=Price + Dist_TP*Point;          // ���������� ���� ��
      if (Dist_TP<Min_Dist)                     // ���� ������ ������.
        {
         TP=Price + Min_Dist*Point;             // ���������� ���� TP
         Alert(" ��������� ��������� TP = ",Min_Dist," pt");
        }
      //--------------------------------------------------------- 6 --
      Alert("�������� ������ ��������� �� ������. �������� ������..");
      int ticket=OrderSend(Symb, OP_BUYSTOP, Lot, Price, 0, SL, TP);
      //--------------------------------------------------------- 7 --
      if (ticket>0)                             // ���������� :)
        {
         Alert ("���������� ����� BuyStop ",ticket);
         break;                                 // ����� �� �����
        }
      //--------------------------------------------------------- 8 --
      int Error=GetLastError();                 // �� ���������� :(
      switch(Error)                             // ����������� ������
        {
         case 129:Alert("������������ ����. ������� ��� ���..");
            RefreshRates();                     // ������� ������
            continue;                           // �� ����. ��������
         case 135:Alert("���� ����������. ������� ��� ���..");
            RefreshRates();                     // ������� ������
            continue;                           // �� ����. ��������
         case 146:Alert("���������� �������� ������. ������� ���..");
            Sleep(500);                         // ������� �������
            RefreshRates();                     // ������� ������
            continue;                           // �� ����. ��������
        }
      switch(Error)                             // ����������� ������
        {
         case 2 : Alert("����� ������.");
            break;                              // ����� �� switch
         case 5 : Alert("������ ������ ����������� ���������.");
            break;                              // ����� �� switch
         case 64: Alert("���� ������������.");
            break;                              // ����� �� switch
         case 133:Alert("�������� ���������");
            break;                              // ����� �� switch
         default: Alert("�������� ������ ",Error);// ������ ��������   
        }
      break;                                    // ����� �� �����
     }
//--------------------------------------------------------------- 9 --
   Alert ("������ �������� ������ -----------------------------");
   return;                                      // ����� �� start()
  }
//-------------------------------------------------------------- 10 --