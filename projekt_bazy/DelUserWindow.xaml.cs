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

    public partial class DelUserWindow : Window
    {
        public DelUserWindow()
        {
            InitializeComponent();

            using (var command = new SqlCommand("ShowUsersDel", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                User user;
                ObservableCollection<User> users = new ObservableCollection<User>();

                da.SelectCommand = command;
                da.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    user = new User(int.Parse(row["id_user"].ToString()), row["login"].ToString(), row["email"].ToString(),
                                    row["description"].ToString(), row["password"].ToString());

                    users.Add(user);

                }
                dataGrid.ItemsSource = users;

            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow MeWi = new MenuWindow();
            this.Close();
            MeWi.ShowDialog();
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (sender != null)
            {
                var user = dataGrid.SelectedItem as User;
                DelUserSure DeUs = new DelUserSure(user);

                DeUs.ShowDialog();
            }
        }
    }
}
