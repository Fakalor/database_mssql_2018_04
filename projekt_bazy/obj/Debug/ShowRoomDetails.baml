   M S B A M L   `   `   `  ����G  Cprojekt_bazy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:projekt_bazyprojekt_bazy  5   	   "    projekt_bazy.ShowRoomDetails   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:projekt_bazy     5   	     � Title$  ShowRoomDetails��5   	   $	��600��6!   $	��300��6.   .��5	      �  � RowDefinitions 5
   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $
��0.7* �6   �� 5      $��3* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ label��5      $
��ID: ��6   $��Center=�6.   $��Center=�6L   $��0��6g   $��30��6t   $	��270��6�   �� 5   
   -   5        $ label2��5      $��Nazwa pokoju: ��6    $��Center=�69   $��Center=�6W   $��1��6r   $��30��6   $	��270��6�   �� 5   
   -   5        $ label3��5      $��Limit osób: ��6    $��Center=�67   $��Center=�6U   $��2��6p   $��30��6}   $	��270��6�   �� 5   
   -   5        $ label4��5      $��Klucz: ��6    $��Center=�62   $��Center=�6P   $��3��6k   $��30��6x   $	��270��6�   �� 5   
   -   5        $ label5��5      $'��!Lista osób będących w pokoju: ��6    $��Center=�6I   $��Center=�6g   $��4��6�   $��30��6�   $	��270��6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ dataGrid��5      $��Center=�6%   $��Center=�6C   $��5��6^   $	��140��6k   $	��270��6y   �� 5   
   -   5         ��Name$
 Back��5      $��Powrót��6   $��Center=�60   $��Center=�6N   $��7��6i   $��30��6v   $	��200��6�   6�   �� 5   
   -   5        $ AddUser��5      $��Dodaj użytkownika��6"   $
��Left=�6>   $��6��6Z   $��Center=�6g   $��25��6�   $	��120��6�   $��
10,17,0,17q�6�   6�   �� 5   
   -	   5        $ DelUser��5      $��Usuń użytkownika��6"   $��Right=�6=   $��6��6Z   $��Center=�6g   $��25��6�   $	��120��6�   $��
0,17,10,17q�6�   6�   5       5!      