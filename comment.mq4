//--------------------------------------------------------------------
// comment.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                            // ����. ������� start
  {
   int Orders=OrdersTotal();           // ���������� �������
   if (Orders==0)                      // ���� ���.��� ����� 0
      Comment("������� ���");          // ����������� � ���� ����
   else                                // ���� ���� ������
      Comment("� �������� ������� ",Orders," �������." );// �������.
   return;                             // ����� 
  }
//--------------------------------------------------------------------