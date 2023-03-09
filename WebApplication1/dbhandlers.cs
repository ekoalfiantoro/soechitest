using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class dbhandlers
    {
        string koneksi = @"Data Source=DESKTOP-8UJHIF3;Initial Catalog=TestSoechi;Integrated Security=True";
        public List<SatuanUOM> GetListSatuan()
        {
            List<SatuanUOM> listResult = new List<SatuanUOM>();

            string query = @"SELECT Satuan
                             ,Rate
                             FROM TestSoechi.dbo.Satuan";
            using (SqlConnection con = new SqlConnection(koneksi))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.CommandType = System.Data.CommandType.Text;
                    try
                    {
                        SqlDataReader dataReader = command.ExecuteReader();
                        while (dataReader.Read())
                        {
                            SatuanUOM item = new SatuanUOM();
                            item.Satuan = dataReader["Satuan"].ToString();
                            item.Rate = Convert.ToInt64(dataReader["Rate"]);
                            listResult.Add(item);
                        }
                    }
                    catch (Exception e)
                    {
                        var a = e.Message;
                    }
                    con.Close();
                }
            }
            return listResult;
        }
    }

    public class SatuanUOM
    {
        public string Satuan { get; set; }
        public long Rate { get; set; }
    }
}

