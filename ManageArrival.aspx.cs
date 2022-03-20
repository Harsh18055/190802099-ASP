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
         //DeleteCommand="DELETE FROM [arrivals] WHERE [id] = @id" 
         //InsertCommand="INSERT INTO [arrivals] ([image], [name], [price], [status]) VALUES (@image, @name, @price, @status)" 
         //SelectCommand="SELECT [id], [image], [name], [price], [status] FROM [arrivals]" 
         //UpdateCommand="UPDATE [arrivals] SET [image] = @image, [name] = @name, [price] = @price, [status] = @status WHERE [id] = @id">
    }
    private void Print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [image], [name], [price], [status] FROM [arrivals]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
            SqlCommand cmd = new SqlCommand("INSERT INTO [arrivals] ([image], [name], [price], [status]) VALUES (@image, @name, @price, @status)", con);
            cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@price", TextBox3.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                FileUpload1.Attributes.Clear();
                Image1.ImageUrl = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Print();
                Literal2.Text = "New Arrivals Inserted Successfully";
            }
            else
            {
                FileUpload1.Attributes.Clear();
                Image1.ImageUrl = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Print();
                Literal2.Text = "Error!";
            }
        }
        else
        {
            Literal2.Text = "Please select Image or file!";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [arrivals] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            FileUpload1.Attributes.Clear();
            Image1.ImageUrl = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Print();
            Literal2.Text = "New Arrivals Deleted Successfully";
        }
        else
        {
            FileUpload1.Attributes.Clear();
            Image1.ImageUrl = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Print();
            Literal2.Text = "Error!";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [image], [name], [price], [status] FROM [arrivals]  WHERE [id] =" + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        Image1.ImageUrl = "~/uploads/" + dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        TextBox3.Text = dt.Rows[0][3].ToString();
        RadioButtonList1.SelectedValue=dt.Rows[0][4].ToString();
        ViewState["user_id"] = btn.CommandArgument;
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
            SqlCommand cmd = new SqlCommand("UPDATE [arrivals] SET [image] = @image, [name] = @name, [price] = @price, [status] = @status WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@price", TextBox3.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@id", ViewState["user_id"]);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                FileUpload1.Attributes.Clear();
                Image1.ImageUrl = string.Empty;
                
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Print();
                Literal2.Text = "New Arrivals Updated Successfully";
            }
            else
            {
                FileUpload1.Attributes.Clear();
                Image1.ImageUrl = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Print();
                Literal2.Text = "Error!";
            }
        }
        else
        {
            Literal2.Text = "Please select Image or file!";
        }
    }
}