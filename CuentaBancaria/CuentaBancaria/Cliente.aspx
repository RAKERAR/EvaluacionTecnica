<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CuentaBancaria.Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <div class="panel panel-primary">
     <div class="panel-heading">
        <h3 class="panel-title">Registro Cliente</h3>
     </div>
     <div class="panel-body">
        <div class="container" >
             <div class="row form-horizontal">
       <div class="form-group">
          <label class="control-label col-sm-2" for="txtTarjeta">Tarjeta</label>
           <div class="col-lg-4" >
              <asp:TextBox id="txtTarjeta" ClientIDMode="Static" runat="server" CssClass="col-lg-1 form-control" > </asp:TextBox>
             <asp:RequiredFieldValidator  runat="server" CssClass="col-lg-1" Display="Dynamic" ControlToValidate="txtTarjeta" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
           </div>
                  </div>
       <div class="form-group">
            <label class="control-label col-sm-2" for="txtTarjeta">Nombre</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtNombre" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <label class="control-label col-sm-2" for="txtTarjeta">Apellidos</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtApellidos" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtTelefono">Fecha de Nacimiento</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtFechaNacimeinto" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <label class="control-label col-sm-2" for="txt">Sexo</label>
            <div class="col-lg-4">
                <asp:DropDownList ID="ddlSexo" ClientIDMode="Static" runat="server"  CssClass="form-control">
                   
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="ddlEstadoCivil">Fecha de Nacimiento</label>
            <div class="col-lg-4">
                <asp:DropDownList ID="ddlEstadoCivil" ClientIDMode="Static" runat="server"  CssClass="form-control">
                    <asp:ListItem Text="Soltero" Value="1"> </asp:ListItem>
                    <asp:ListItem Text="Casado" Value="2"> </asp:ListItem>
                    <asp:ListItem Text="Union Libre"  Value="3"> </asp:ListItem>
                    <asp:ListItem Text="Viudo" Value="4"> </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <hr />
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtDireccion">Dirección</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtDireccion" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="txtEstado">Estado</label>
            <div class="col-lg-4">
              <asp:DropDownList ID="ddlEstado" ClientIDMode="Static" runat="server"  CssClass="form-control">
                </asp:DropDownList>
            </div>
            <label class="control-label col-sm-2" for="txtCP">C.P.</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtCP" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtTelefono">Telefono</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtTelefono" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <label class="control-label col-sm-2" for="txtCP">Cel</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtCelular" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>       
    </div>
             <div class="row form-horizontal">
                 <asp:Button ID="btnGuadar" ClientIDMode="Static" runat="server" CssClass="btn btn-primary col-md-offset-11" Text="Guardar" />
             </div>
        </div>
     </div>
   </div>
</asp:Content>
