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
    public partial class DelUserSure : Window
    {
        User Data;

        public DelUserSure(User data)
        {
            InitializeComponent();
            label.Content += data.Login.ToString();

            Data = data;
        }


        private void ButtonNo_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ButtonYes_Click(object sender, RoutedEventArgs e)
        {
            using (var command = new SqlCommand("DelUser", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", Data.Id_User));
                command.ExecuteNonQuery();
            }
            this.Close();
        }
    }

}

