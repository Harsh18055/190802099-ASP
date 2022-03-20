using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
           Print();
           //DeleteCommand="DELETE FROM [categories] WHERE [id] = @id" 
           //InsertCommand="INSERT INTO [categories] ([category], [status]) VALUES (@category, @status)" 
           //SelectCommand="SELECT [id], [category], [status] FROM [categories]" 
           //UpdateCommand="UPDATE [categories] SET [category] = @category, [status] = @status WHERE [id] = @id">
    }
    private void Print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [category], [status] FROM [categories]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Submit")
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [categories] ([category], [status]) VALUES (@category, @status)", con);
            cmd.Parameters.AddWithValue("@category", TextBox3.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal2.Text = "Category Inserted Successfully!";
                Print();
            }
            else
            {
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal2.Text = "Error!";
                Print();
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [categories] SET [category] = @category, [status] = @status WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("@category", TextBox3.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@id", ViewState["category_id"]);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal2.Text = "Category Updated Successfully!";
                Print();
                Button1.Text = "Submit";
            }
            else
            {
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal2.Text = "Error!";
                Print();
                Button1.Text = "Submit";
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn =(Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [categories] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id",btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            TextBox3.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Literal2.Text = "Category Deleted Successfully!";
            Print();
        }
        else
        {
            TextBox3.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Literal2.Text = "Error!";
            Print();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [category], [status] FROM [categories]  WHERE [id] =" + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox3.Text = dt.Rows[0][1].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][2].ToString();
        ViewState["category_id"] = btn.CommandArgument;
        Button1.Text = "Update";
        
    }
}