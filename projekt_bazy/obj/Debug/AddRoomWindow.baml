   M S B A M L   `   `   `  ����G  Cprojekt_bazy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:projekt_bazyprojekt_bazy  5   	        projekt_bazy.AddRoomWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:projekt_bazy     5   	     � Title$  AddRoomWindow��5   	   $	��300��6   $	��300��6,   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��0.6* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $
��0.6* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ 	LebelName��5      $��Nazwa pokoju:  ��6#   $
��Left=�6=   $��1��6X   $��Center=�6e   $	��272��6�   �� 5   
   -   5         ��Name$ TextBoxName��5      $��Right=�6'   $��1��6C    �� TextWrapping$
 Wrap=�6P   $�� ��6d   $��Center=�6l   $	��150��6�   $��
0,14,20,13q�6�   �� 5   
   -   5        $ 
LebelLimit��5      $��Limit osób:  ��6$   $
��Left=�6<   $��2��6W   $��Center=�6d   $	��272��6   �� 5   
   -   5        $ TextBoxLimit��5      $��Right=�6(   $��2��6D   $
 Wrap=�6Q   $�� ��6e   $��Center=�6m   $	��150��6�   $��
0,14,20,13q�6�   �� 5   
   -   5         ��Name$
 Back��5      $��Powrót��6   $
��Left=�60   $��4��6K   $��
20,12,0,12q�6X   $��Center=�6l   $��60��6�   6�   �� 5   
   -   5        $	 Add��5      $��Dodaj pokój��6   $��Right=�64   $��4��6P   $��
0,12,20,12q�6]   $��Center=�6q   $	��120��6�   6�   5      5      