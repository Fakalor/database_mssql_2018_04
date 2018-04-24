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

    public partial class ShowMessRoom : Window
    {
        public ShowMessRoom(Room data)
        {
            InitializeComponent();

            using (var command = new SqlCommand("ShowMess", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", data.Id_Room));

                SqlDataReader reader;
                DataTable dt = new DataTable();
                string mess = "";
                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    mess = reader["Wiadomości"].ToString();
                }
                Mess.Inlines.Add(mess);
                
                reader.Close();
            }
        }

        private void BackClick(object sender, RoutedEventArgs e)
        {
           
            this.Close();
                    }
    }
}
