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

    public partial class ShowRoomDetails : Window
    {
        public ShowRoomDetails(Room data)
        {
            InitializeComponent();
            label.Content += data.Id_Room.ToString();
            label2.Content += data.Name_Room;
            label3.Content += data.Limit.ToString();

            using (var command = new SqlCommand("ShowRoomKey", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", data.Id_Room));

                SqlDataReader reader;
                DataTable dt = new DataTable();
                string key = "";

                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    key = reader["Klucz symetryczny"].ToString();
                }

                label4.Content += key;
                reader.Close();
            }

            using (var command = new SqlCommand("ShowRoomUser", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@id", data.Id_Room));


                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                UserRoom UsRm;
                ObservableCollection<UserRoom> UsRms = new ObservableCollection<UserRoom>();

                da.SelectCommand = command;
                da.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    UsRm = new UserRoom(row["Login"].ToString(), row["Data wyjścia"].ToString());

                    UsRms.Add(UsRm);

                }
                dataGrid.ItemsSource = UsRms;
            }
        }

        private void BackClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DelUser_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
