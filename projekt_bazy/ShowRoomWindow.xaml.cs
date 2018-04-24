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
    public class Room
    {
        public Room(int id, string name_room, int limit)
        {
            Id_Room = id;
            Name_Room = name_room;
            Limit = limit;
           
        }

        public int Id_Room { get; set; }
        public string Name_Room { get; set; }
        public int Limit { get; set; }
    }

    public partial class ShowRoomWindow : Window
    {
        public ShowRoomWindow()
        {
            InitializeComponent();

            using (var command = new SqlCommand("ShowRooms", Connect.Conn) { CommandType = CommandType.StoredProcedure })
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

        private void BackClick(object sender, RoutedEventArgs e)
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
                ShowRoomDetails ShRo = new ShowRoomDetails(room);

                ShRo.ShowDialog();
            }
        }
    }
}
