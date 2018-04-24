using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;


namespace projekt_bazy
{

    public sealed class Connect
    {
        static SqlConnection conn;
        static bool connected;

        static Connect()
        {
            try
            {
                SqlConnectionStringBuilder stringConn = new SqlConnectionStringBuilder();
                stringConn.Add("Data Source", @"VLADIMIR\SQLEXPRESS");
                stringConn.Add("Initial Catalog", "projekt_bazy_danych");
                stringConn.Add("Trusted_Connection", "True");

                conn = new SqlConnection(stringConn.ConnectionString);
                conn.Open();
                connected = true;
            }
            catch
            {
                conn.Dispose();
                connected = false;
            }
        }

        public static bool isConnected
        {
            get { return connected; }
        }

        public static SqlConnection Conn
        {
            get
            {
                return conn;
            }
        }
    }

    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();

       
            if (Connect.isConnected == true)
                label.Content = "Połączenie z bazą zostało nawiązane.";
            else
                label.Content = "Nie udało się nawiązać połączenia z bazą.";
        }

        private void NextClick(object sender, RoutedEventArgs e)
        {
            if (Connect.isConnected == true)
            {
                MenuWindow MeWi = new MenuWindow();
                this.Close();
                MeWi.ShowDialog();
            }

            this.Close();
        }

    }


}
