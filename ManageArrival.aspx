<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageArrival.aspx.cs" Inherits="Default3" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Manage New Arrivals
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">New Arrival Image</label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" 
                                        Width="273px" />
                                    <br />
                                    <asp:Image ID="Image1" runat="server" Height="100px" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">New Arrival Name</label>
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Enter New Arrival Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Arrival Price</label>
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="New Arrival Price"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">New Arrival Status</label>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">Active</asp:ListItem>
                                        <asp:ListItem Value="0">Deactive</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" 
                                    onclick="Button1_Click"></asp:Button>
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Update" class="btn btn-info"  />
                                 <div class="checkbox">  
                                   <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                   <br />
                                   <br />
                                   ***New Arrivals Show***<br />
                                   <br />
                                   <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" 
                                       BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                       CellSpacing="2" AutoGenerateColumns="False" Width="661px">
                                       <Columns>
                                           <asp:TemplateField HeaderText="Id">
                                               <ItemTemplate>
                                                   <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Inages">
                                               <ItemTemplate>
                                                   <asp:Image ID="Image2" runat="server" Height="100px" 
                                                       ImageUrl='<%# Eval("image", "~/uploads/{0}") %>' />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Name">
                                               <ItemTemplate>
                                                   <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("name") %>'></asp:Literal>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Price">
                                               <ItemTemplate>
                                                   <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("price") %>'></asp:Literal>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Status">
                                               <ItemTemplate>
                                                   <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("status") %>'></asp:Literal>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Edit">
                                               <ItemTemplate>
                                                   &nbsp;&nbsp;
                                                   <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                       Text="Edit" onclick="Button2_Click" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Delete">
                                               <ItemTemplate>
                                                   &nbsp;&nbsp;
                                                   <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                       Text="Delete" onclick="Button3_Click" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                       </Columns>
                                       <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                       <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                       <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                       <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                       <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                       <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                       <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                       <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                       <SortedDescendingHeaderStyle BackColor="#93451F" />
                                   </asp:GridView>
                                   
                                </div>
                            </form>
                            </div>

                        </div>
                    </section>
                    </div>
                    </div>
                    </div>
                    </section>
</asp:Content>

