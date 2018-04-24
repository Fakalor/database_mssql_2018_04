using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public class UserRoom
    {
        public UserRoom(string room_name, string exit_date)
        {
            Name = room_name;
            Exit_Date = exit_date;
        }

        public string Name { get; set; }
        public string Exit_Date { get; set; }
    }

    public partial class ShowUserDetails : Window
    {
        public ShowUserDetails(User data)
        {
            InitializeComponent();
            label.Content += data.Id_User.ToString();
            label2.Content += data.Login;
            label3.Content += data.Email;
            label4.Content += data.Description;
            label5.Content += data.Password;

            using (var command = new SqlCommand("ShowUserKey", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", data.Id_User));

                SqlDataReader reader;
                DataTable dt = new DataTable();
                string key = "";

                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    key = reader["Klucz publiczny"].ToString();
                }

                label6.Content += key;
                reader.Close();
            }

            using (var command = new SqlCommand("ShowUserRoom", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", data.Id_User));


                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                UserRoom UsRm;
                ObservableCollection<UserRoom> UsRms = new ObservableCollection<UserRoom>();

                da.SelectCommand = command;
                da.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    UsRm = new UserRoom(row["Nazwa pokoju"].ToString(), row["Data wyjścia"].ToString());

                    UsRms.Add(UsRm);

                }
                dataGrid.ItemsSource = UsRms;
            }
        }

        private void BackClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
