using RFID_AttendanceSystem.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RFID_AttendanceSystem.Dashboard
{
    public partial class AddUser : Form
    {
        private static DatabaseConnector connector = new DatabaseConnector();
        public string conectionString = connector.GetConnection();
        public AddUser()
        {
            InitializeComponent();
        }

        public void SaveRecord()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(conectionString))
                using (SqlCommand command = new SqlCommand("SaveRecord", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", tbUserId.Text);
                    command.Parameters.AddWithValue("@first_name", tbFirstName.Text);
                    command.Parameters.AddWithValue("@middle_name", tbMiddleName.Text);
                    command.Parameters.AddWithValue("@last_name", tbLastName.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    MessageBox.Show("Successfully inserted record");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnEnter_Click(object sender, EventArgs e)
        {
            SaveRecord();
        }
    }
}
