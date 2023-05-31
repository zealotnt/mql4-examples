//+------------------------------------------------------------------+
//|                                              Alert Messenger.mq4 |
//|                           Copyright 2022, Hung_tthanh@yahoo.com. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
// https://www.mql5.com/en/code/41986
#property copyright "Copyright 2022, Hung_tthanh@yahoo.com."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {  
  //e.g message
  //string msg=StringFormat("Name: Parabolic Signal\nSymbol: %s\nType: Sell\nPrice: %s\nTime: %s",
  //                               _Symbol,
  //                               DoubleToString(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits),
  //                               TimeToString(iTime(_Symbol, 0, 0)));
  string msg = "Catch me if you can?";
//---
   ChartSaveTemplate(0,"Alert Template"); //don't change template name here!!!
   Alert((msg)); //Send Alert
  }
//+------------------------------------------------------------------+
 