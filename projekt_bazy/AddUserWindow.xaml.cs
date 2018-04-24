using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public partial class AddUserWindow : Window
    {
        public AddUserWindow()
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
            using (var command = new SqlCommand("AddNewUser", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@login", TextBoxLogin.Text));
                command.Parameters.Add(new SqlParameter("@email", TextBoxEmail.Text));
                command.Parameters.Add(new SqlParameter("@password", Convert.ToBase64String(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(TextBoxPassword.Text)))));

                using (var rsa = new RSACryptoServiceProvider(1024))
                {
                    try
                    {
                        byte[] pub = rsa.ExportCspBlob(false);
                        byte[] priv = rsa.ExportCspBlob(true);
                        string rsaBlock;

                        rsaBlock = Convert.ToBase64String(pub);
                        command.Parameters.Add(new SqlParameter("@key", rsaBlock));
                    }
                    finally
                    {
                        rsa.PersistKeyInCsp = false;
                    }
                }

                command.ExecuteNonQuery();

                AddUserCorrWindow AdUsC = new AddUserCorrWindow();
                TextBoxLogin.Text = "";
                TextBoxEmail.Text = "";
                TextBoxPassword.Text = "";
                
                AdUsC.ShowDialog();
            }
        }
    }


}
