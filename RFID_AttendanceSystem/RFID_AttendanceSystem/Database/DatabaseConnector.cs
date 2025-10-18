using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RFID_AttendanceSystem.Database
{
    public class DatabaseConnector
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
        public string GetConnection()
        {
            return connectionString ?? string .Empty;
        }
    }
}
