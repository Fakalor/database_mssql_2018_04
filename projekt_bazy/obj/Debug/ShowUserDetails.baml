   M S B A M L   `   `   `  ����G  Cprojekt_bazy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:projekt_bazyprojekt_bazy  5   	   "    projekt_bazy.ShowUserDetails   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:projekt_bazy     5   	     � Title$  ShowUserDetails��5   	   $	��500��6!   $	��300��6.   .��5	      �  � RowDefinitions 5
   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $
��0.7* �6   �� 5      $��3* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$
 Back��5      $��Powrót��6   $��Center=�61   $��Center=�6O   $��8��6j   $��30��6w   $	��200��6�   6�   �� 5   
   -   5         ��Name$ label��5      $
��ID: ��6   $��Center=�6.   $��Center=�6L   $��0��6g   $��30��6t   $	��270��6�   �� 5   
   -   5        $ label2��5      $��Login: ��6    $��Center=�62   $��Center=�6P   $��1��6k   $��30��6x   $	��270��6�   �� 5   
   -   5        $ label3��5      $��Email: ��6    $��Center=�63   $��Center=�6Q   $��2��6l   $��30��6y   $	��270��6�   �� 5   
   -   5        $ label4��5      $��Opis: ��6    $��Center=�62   $��Center=�6P   $��3��6k   $��30��6x   $	��270��6�   �� 5   
   -   5        $ label5��5      $��Hasło: ��6    $��Center=�63   $��Center=�6Q   $��4��6l   $��30��6y   $	��270��6�   �� 5   
   -   5        $ label6��5      $��Klucz: ��6    $��Center=�62   $��Center=�6P   $��5��6k   $��30��6x   $	��270��6�   �� 5   
   -   5        $ label7��5      $*��$Pokoje w których jest użytkownik: ��6    $��Center=�6M   $��Center=�6k   $��6��6�   $��30��6�   $	��270��6�   &   System.Windows.Controls.DataGrid  5   
   -	   5          Name$ dataGrid��5      $��Center=�6&   $��Center=�6D   $��7��6_   $	��110��6l   $	��270��6y   5      5       