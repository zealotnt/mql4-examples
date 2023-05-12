//--------------------------------------------------------------------
// strings.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
extern int Quant_Bars=100;             // ���������� �����
datetime   Time_On;
string     Prefix    ="Paint_";
//--------------------------------------------------------------- 2 --
int init()                             // ����. ������� init()
  {
   int Ind_Bar;                        // ������ ����
   Time_On=Time [Quant_Bars];          // ����� ������� �������������
   for(Ind_Bar=Quant_Bars-1; Ind_Bar>=0; Ind_Bar--)// ���� �� �����
     {
      Create(Ind_Bar,1);               // �������� ������ �����
      Create(Ind_Bar,2);               // �������� ������� �����
     }
   WindowRedraw();                     // ����������� ����������� 
   return;                             // ����� �� init()
  }
//--------------------------------------------------------------- 3 --
int start()                            // ����. ������� start
  {
   datetime T1, T2;                    // 1 � 2 ���������� �������
   int Error,Ind_Bar;                  // ��� ������ � ������ ����
   double P1, P2;                      // 1 � 2 ���������� ����
   color Col;                          // ���� ���������� �������
//--------------------------------------------------------------- 4 --
   for(int Line=1; Line<=2; Line++)    // ���� �� ����� �����
     {
      string Nom_Lin =Line + "_";      // ������ � ������� �����
      //    string Nom_Lin  = DoubleToStr(Line,0)+"_";// ����� � ���
      for(Ind_Bar=0; ;Ind_Bar++)       // ���� �� �����
        {
//--------------------------------------------------------------- 5 --
         datetime T_Bar= Time[Ind_Bar];// ����� �������� ����
         if (T_Bar < Time_On) break;   // ����������� �� ������������
         string Str_Time=TimeToStr(T_Bar);       // ������ �� ��������
         string His_Name=Prefix+Nom_Lin+Str_Time;// ��� �������
//--------------------------------------------------------------- 6 --
         T1=ObjectGet(His_Name,OBJPROP_TIME1);// ������ �����. t1
         Error=GetLastError();         // ��������� ���� ������
         if (Error==4202)              // ���� ������� ��� :(
           {
            Create(Ind_Bar,Line);      // ����� �-�� �������� �����
            continue;                  // �� ��������� ��������
           }
//--------------------------------------------------------------- 7 --
         T2 =ObjectGet(His_Name,OBJPROP_TIME2); // ������ �����. t2
         P1 =ObjectGet(His_Name,OBJPROP_PRICE1);// ������ �����. p1
         P2 =ObjectGet(His_Name,OBJPROP_PRICE2);// ������ �����. p1
         Col=ObjectGet(His_Name,OBJPROP_COLOR); // ������ �����
         if(T1!=T_Bar || T2!=T_Bar || // �� �� ���������� ��� ����:
            (Line==1 && (P1!=High[Ind_Bar] || P2!=  Low[Ind_Bar])) ||
            (Line==2 && (P1!=Open[Ind_Bar] || P2!=Close[Ind_Bar])) ||
            (Open[Ind_Bar] <Close[Ind_Bar] && Col!=Blue) ||
            (Open[Ind_Bar] >Close[Ind_Bar] && Col!=Red)  ||
            (Open[Ind_Bar]==Close[Ind_Bar] && Col!=Green)  )
           {
            ObjectDelete(His_Name);    // ������� ������
            Create(Ind_Bar,Line);      // ������ ���������� ������
           }
//--------------------------------------------------------------- 8 --
        }
     }
   WindowRedraw();                     // ����������� ����������� 
   return;                             // ����� �� start()
  }
//--------------------------------------------------------------- 9 --
int deinit()                           // ����. ������� deinit()
  {
   string Name_Del[1];                 // ���������� �������
   int Quant_Del=0;                    // ���������� ��������� �������
   int Quant_Objects=ObjectsTotal();   // C������ ����� ���� ��������
   ArrayResize(Name_Del,Quant_Objects);// ����������� ������ �������
   for(int k=0; k<Quant_Objects; k++)  // �� ���������� �������� 
     {
      string Obj_Name=ObjectName(k);   // ����������� ��� �������
      string Head=StringSubstr(Obj_Name,0,6);// ��������� ������ 6 ���
      if (Head==Prefix)                // ������ ������, ..
        {                              // .. ������������ � Paint_
         Quant_Del=Quant_Del+1;        // ����� ��� � ��������
         Name_Del[Quant_Del-1]=Obj_Name;//���������� ��� ����������
        }
     }
   for(int i=0; i<=Quant_Del; i++)     // ������� ������� � �������,.. 
      ObjectDelete(Name_Del[i]);       // .. ���������� � �������
   return;                             // ����� �� deinit()
  }
//-------------------------------------------------------------- 10 --
int Create(int Ind_Bar, int Line)      // ���������������� �������..
  {                                    // ..�������� �������
   color Color;                        // ���� �������
   datetime T_Bar=Time [Ind_Bar];      // ����� �������� ����
   double   O_Bar=Open [Ind_Bar];      // ���� �������� ����
   double   C_Bar=Close[Ind_Bar];      // ���� �������� ����
   double   H_Bar=High [Ind_Bar];      // ������������ ���� ����
   double   L_Bar=Low  [Ind_Bar];      // ����������� ���� ����

   string Nom_Lin =Line + "_";         // ������ - ����� �����
   // string Nom_Lin  = DoubleToStr(Line,0)+"_";// ����� � ���
   string Str_Time=TimeToStr(T_Bar);   // ������ - ����� ����.     
   string His_Name=Prefix+Nom_Lin+Str_Time;// ��� ����������� ������
   if (O_Bar < C_Bar) Color=Blue;      // ����� ����� � �����������..
   if (O_Bar > C_Bar) Color=Red;       // .. �� ������������� ����
   if (O_Bar ==C_Bar) Color=Green;

   switch(Line)                        // ������ ��� ������� �����
     {
      case 1:                          // ������ �����
         ObjectCreate(His_Name,OBJ_TREND,0,T_Bar,H_Bar,T_Bar,L_Bar);
         break;                        // ����� �� switch
      case 2:                          // ������� �����
         ObjectCreate(His_Name,OBJ_TREND,0,T_Bar,O_Bar,T_Bar,C_Bar);
         ObjectSet(   His_Name, OBJPROP_WIDTH, 3);// �����     
     }
   ObjectSet(    His_Name, OBJPROP_COLOR, Color); // ����
   ObjectSet(    His_Name, OBJPROP_RAY,   false); // ���
   ObjectSetText(His_Name,"������ ������ ���������",10);// ��������
   return;                             // ����� �� �����. �-��
  }
//-------------------------------------------------------------- 11 --