using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {         
            if (!IsPostBack)
            {
                SetSatuan();
                listUOM.Items.Insert(0, new ListItem("Pilih UOM", ""));
            }
        }

        private void SetSatuan()
        {
            dbhandlers handler = new dbhandlers();
            var items = handler.GetListSatuan();
            listUOM.DataValueField = "Rate";
            listUOM.DataTextField = "Satuan";
            listUOM.DataSource = items;
            listUOM.DataBind();
        }
    }
}