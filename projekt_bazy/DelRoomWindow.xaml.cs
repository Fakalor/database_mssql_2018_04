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
    public partial class DelRoomWindow : Window
    {
        public DelRoomWindow()
        {
            InitializeComponent();

            using (var command = new SqlCommand("ShowRoomsDel", Connect.Conn) { CommandType = CommandType.StoredProcedure })
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                Room room;
                ObservableCollection<Room> rooms = new ObservableCollection<Room>();

                da.SelectCommand = command;
                da.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    room = new Room(int.Parse(row["id_room"].ToString()), row["name_room"].ToString(), int.Parse(row["limit"].ToString()));

                    rooms.Add(room);

                }
                dataGrid.ItemsSource = rooms;

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
                var room = dataGrid.SelectedItem as Room;
                DelRoomSure DeRo = new DelRoomSure(room);

                DeRo.ShowDialog();
            }
        }
    }
}
