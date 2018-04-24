using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
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

    public partial class AddRoomWindow : Window
    {
        public AddRoomWindow()
        {
            InitializeComponent();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow MeWi = new MenuWindow();
            this.Close();
            MeWi.ShowDialog();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            using (var command = new SqlCommand("AddNewRoom", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@name_room", TextBoxName.Text));
                command.Parameters.Add(new SqlParameter("@limit", TextBoxLimit.Text));

                byte[] key = new byte[16];
                RandomNumberGenerator rand = RandomNumberGenerator.Create();
                rand.GetBytes(key);
                command.Parameters.Add(new SqlParameter("@key", Convert.ToBase64String(key)) );

                command.ExecuteNonQuery();

                AddUserCorrWindow AdUsC = new AddUserCorrWindow();
                TextBoxName.Text = "";
                TextBoxLimit.Text = "";

                AdUsC.ShowDialog();
            }
        }
    }
}
