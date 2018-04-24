using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

    public partial class DelRoomSure : Window
    {
        Room Data;

        public DelRoomSure(Room data)
        {
            InitializeComponent();
            
            label.Content += data.Name_Room.ToString();

            Data = data;
        }

        private void ButtonNo_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ButtonYes_Click(object sender, RoutedEventArgs e)
        {
            using (var command = new SqlCommand("DelRoom", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", Data.Id_Room));
                command.ExecuteNonQuery();
            }
            this.Close();
        }
    }
}
