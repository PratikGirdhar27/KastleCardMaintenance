using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace KastleCardMaintenance
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblName.Text = DropDownList1.SelectedItem.Text;
            HiddenField1.Value = DropDownList1.SelectedItem.Value;
        }

        protected void btnAddCard_Click(object sender, EventArgs e)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["WRFMasterConnectionString"].ToString();
            SqlConnection wrfmasterConnectionString = new SqlConnection(dbConnectionString);
            wrfmasterConnectionString.Open();
            SqlCommand com = new SqlCommand("[Identification].[usp_AddKastleCardIdentity]", wrfmasterConnectionString);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@PartyID",HiddenField1.Value);
            com.Parameters.AddWithValue("@Identifier", txtCardNum.Text.ToString());
            int i= com.ExecuteNonQuery();
            wrfmasterConnectionString.Close();
            if (i >= 1)
            {
                Response.Write("<script>alert('Kastle Card Added Sucessfully');window.location=self.location;</script>");
            }
            else
            {
                Response.Write("<script>alert('Kastle Card Not Added');</script>");
            }
        
        }
    }
}