//--------------------------------------------------------------------
// Tral_Stop.mqh
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
// ������� ����������� StopLoss ���� ������� ���������� ����
// ���������� ����������:
// Mas_Ord_New             ������ ������� ��������� ���������
// int TralingStop         �������� TralingStop(���������� �������)
//--------------------------------------------------------------- 2 --
int Tral_Stop(int Tip)
  {
   int Ticket;                      // ����� ������
   double
   Price,                           // ���� �������� ��������� ������
   TS,                              // TralingStop (�������.����.����)
   SL,                              // �������� StopLoss ������
   TP;                              // �������� TakeProfit ������
   bool Modify;                     // ������� ������������� ������.
//--------------------------------------------------------------- 3 --
   for(int i=1;i<=Mas_Ord_New[0][0];i++)  // ���� �� ���� �������
     {                                    // ���� ������ �����. ����
      if (Mas_Ord_New[i][6]!=Tip)         // ���� ��� �� ��� ���..
         continue;                        //.. �� ���������� �����
      Modify=false;                       // ���� �� �������� � ������
      Price =Mas_Ord_New[i][1];           // ���� �������� ������
      SL    =Mas_Ord_New[i][2];           // �������� StopLoss ������
      TP    =Mas_Ord_New[i][3];           // �������� TakeProft ������
      Ticket=Mas_Ord_New[i][4];           // ����� ������
      if (TralingStop<Level_new)          // ���� ������ �����������..
         TralingStop=Level_new;           // .. �� ����������
      TS=TralingStop*Point;               // �� �� � �������.����.����
      //--------------------------------------------------------- 4 --
      switch(Tip)                         // ������� �� ��� ������
        {
         case 0 :                         // ����� Buy
            if (NormalizeDouble(SL,Digits)<// ���� ���� ���������..
               NormalizeDouble(Bid-TS,Digits))
              {                           // ..�� ������������ ���:
               SL=Bid-TS;                 // ����� ��� StopLoss
               Modify=true;               // �������� � ������.
              }
            break;                        // ����� �� switch
         case 1 :                         // ����� Sell
            if (NormalizeDouble(SL,Digits)>// ���� ���� ���������..
               NormalizeDouble(Ask+TS,Digits)||
               NormalizeDouble(SL,Digits)==0)//.. ��� �������(!)
              {                           // ..�� ������������ ���
               SL=Ask+TS;                 // ����� ��� StopLoss
               Modify=true;               // �������� � ������.
              }
        }                                 // ����� switch
      if (Modify==false)                  // ���� ��� �� ���� ������..
         continue;                        // ..�� ��� �� ����� ������
      bool Ans=OrderModify(Ticket,Price,SL,TP,0);//������������ ���!
      //--------------------------------------------------------- 5 --
      if (Ans==false)                     // �� ���������� :( 
        {                                 // �������������� ��������:
         if(Errors(GetLastError())==false)// ���� ������ �������������
            return;                       // .. �� ������.
         i--;                             // ��������� ��������
        }
      Terminal();                         // ������� ����� ������� 
      Events();                           // ������������ �������
     }
   return;                                // ����� �� �������. �������
  }
//--------------------------------------------------------------- 6 --