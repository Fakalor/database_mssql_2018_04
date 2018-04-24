using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace projekt_bazy
{
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void ShowUserClick(object sender, RoutedEventArgs e)
        {
            ShowUserWindow ShUs = new ShowUserWindow();
            this.Close();
            ShUs.ShowDialog();
        }

        private void ShowRoomClick(object sender, RoutedEventArgs e)
        {
            ShowRoomWindow ShRo = new ShowRoomWindow();
            this.Close();
            ShRo.ShowDialog();
        }

        private void ShowMessClick(object sender, RoutedEventArgs e)
        {
            ShowMessWindow ShMs = new ShowMessWindow();
            this.Close();
            ShMs.ShowDialog();
        }

        private void AddUserClick(object sender, RoutedEventArgs e)
        {
            AddUserWindow AdUs = new AddUserWindow();
            this.Close();
            AdUs.ShowDialog();
        }

        private void AddRoomClick(object sender, RoutedEventArgs e)
        {
            AddRoomWindow AdRo = new AddRoomWindow();
            this.Close();
            AdRo.ShowDialog();
        }

        private void DelUserClick(object sender, RoutedEventArgs e)
        {
            DelUserWindow DeUs = new DelUserWindow();
            this.Close();
            DeUs.ShowDialog();
        }

        private void DelRoomClick(object sender, RoutedEventArgs e)
        {
            DelRoomWindow DeRo = new DelRoomWindow();
            this.Close();
            DeRo.ShowDialog();
        }

        private void ExitClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
