<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageCategory.aspx.cs" Inherits="Default3" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Manage Category
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Category</label>
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Enter Category"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Category Status</label>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">Active</asp:ListItem>
                                        <asp:ListItem Value="0">Deactive</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" 
                                    onclick="Button1_Click" ></asp:Button>
                                 
                                 <br />
                                 
                                 <br />
                                 
                                 <div class="checkbox">  
                                  
                                     <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                     <br />
                                     <br />
                                     <br />
                                     ***Category Data Show***<br />
                                     <br />
                                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                         BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                                         CellPadding="20" CellSpacing="2" GridLines="Horizontal" Width="670px">
                                         <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                         <Columns>
                                             <asp:TemplateField HeaderText="Id">
                                                 <ItemTemplate>
                                                     <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Category Name">
                                                 <ItemTemplate>
                                                     <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("category") %>'></asp:Literal>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status">
                                                 <ItemTemplate>
                                                     <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("status") %>'></asp:Literal>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Update">
                                                 <ItemTemplate>
                                                     <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                         Text="Edit" onclick="Button2_Click" />
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Delete">
                                                 <ItemTemplate>
                                                     <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                         onclick="Button3_Click" Text="Delete" />
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                         <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                         <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                                             HorizontalAlign="Center" VerticalAlign="Middle" />
                                         <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                         <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" 
                                             VerticalAlign="Middle" />
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

