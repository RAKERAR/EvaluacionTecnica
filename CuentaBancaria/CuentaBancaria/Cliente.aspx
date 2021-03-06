﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CuentaBancaria.Cliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function soloNumeros(e, decimal, rango) {
        var texto = (e.target || e.srcElement).id;
        var key;
        var keychar;

        if (window.event) {
            key = window.event.keyCode;
        }
        else if (e) {
            key = e.which;
        }
        else {
            return true;
        }
        keychar = String.fromCharCode(key);
        if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27) || (key == 45)) {
            return true;
        }
        else if ((("0123456789").indexOf(keychar) > -1) || (("-").indexOf(keychar) > -1)) {
            return true;
        }
        else if (decimal && (keychar == ".")) {
            if ($("#" + texto).val().indexOf(".") >= 0) return false;
            return true;
        }
        else
            return false;
    }
 </script>
<asp:UpdatePanel ID="upPrincipal" runat="server" UpdateMode="Always" >
    <ContentTemplate>
     <asp:Panel ID="pRegistro" runat="server" >
      <div class="panel panel-primary">
     <div class="panel-heading">
        <h3 class="panel-title">Registro Cliente</h3>
     </div>
     <div class="panel-body">
       <div class="container" >
        <div class="row form-horizontal">
        <div class="form-group">
          <label class="control-label col-sm-2" for="txtTarjeta">Numero Cliente</label>
           <div class="col-lg-4" >
              <asp:TextBox id="txtID" ClientIDMode="Static" runat="server" Enabled="false" CssClass="col-lg-1 form-control" > </asp:TextBox>
           </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="txtTarjeta">Tarjeta</label>
           <div class="col-lg-4" >
              <asp:TextBox id="txtTarjeta" ClientIDMode="Static" runat="server" CssClass="col-lg-1 form-control" > </asp:TextBox>
             <asp:RequiredFieldValidator  runat="server" CssClass="col-lg-1" Display="Dynamic" ControlToValidate="txtTarjeta" ValidationGroup="Guardar" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
           </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtTarjeta">Nombre</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtNombre" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
                 <asp:RequiredFieldValidator  runat="server" CssClass="col-lg-1" Display="Dynamic" ControlToValidate="txtNombre" ValidationGroup="Guardar" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
            </div>
            <label class="control-label col-sm-2" for="txtTarjeta">Apellidos</label>
            <div class="col-lg-4">
                <asp:TextBox id="txtApellidos" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
                <asp:RequiredFieldValidator  runat="server" CssClass="col-lg-1" Display="Dynamic" ControlToValidate="txtApellidos" ValidationGroup="Guardar" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtTelefono">Edad</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtEdad" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>             
            </div>
            <label class="control-label col-sm-2" for="txt">Sexo</label>
            <div class="col-lg-4" style="padding-right:0px;">
                <asp:DropDownList ID="ddlSexo" ClientIDMode="Static" runat="server"  CssClass="form-control">
                      <asp:ListItem Text="SELECCIONAR" Value="0"> </asp:ListItem>
                     <asp:ListItem Text="FEMENINO" Value="1"> </asp:ListItem>
                     <asp:ListItem Text="MASCULINO" Value="2"> </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="ddlEstadoCivil">Estado Civil</label>
            <div class="col-lg-4" style="padding-right:0px;">
                <asp:DropDownList ID="ddlEstadoCivil" ClientIDMode="Static" runat="server"  AutoPostBack="true" CssClass="form-control"> 
                </asp:DropDownList>
            </div>
            <label class="control-label col-sm-2" for="txt">Correo Electronico</label>
            <div class="col-lg-4">
                   <asp:TextBox id="txtCorreoElectronico" ClientIDMode="Static" runat="server" CssClass="form-control"> </asp:TextBox>
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
              <asp:DropDownList ID="ddlEstado" ClientIDMode="Static" runat="server"  AutoPostBack="true" CssClass="form-control">
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
            <label class="control-label col-sm-2" for="txtCP">Celular</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtCelular" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>    
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtTelefono">Saldo Inicial</label>
            <div class="col-lg-4">
                <asp:TextBox ID="txtSaldoIni" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator  runat="server" CssClass="col-lg-1" Display="Dynamic" ControlToValidate="txtSaldoIni"  ValidationGroup="Guardar" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
            </div>
        </div>       
       </div>
        <div>
             <div class="row form-horizontal ">
              <div class="col-md-offset-6 col-sm-6">
                 <div class="col-sm-2">
                   <asp:Button ID="btnNuevo" ClientIDMode="Static" runat="server" CssClass="btn btn-primary " Text="  Nuevo " OnClick="btnNuevo_Click" />
                 </div>
                 <div class="col-sm-2"> 
                    <asp:Button ID="btnBuscar" ClientIDMode="Static" runat="server" CssClass="btn btn-primary " Text=" Buscar " OnClick="btnBuscar_Click" />
                 </div>
                 <div class="col-sm-2" >         
                   <asp:Button ID="btnEditar" ClientIDMode="Static" runat="server" CssClass="btn btn-primary " Text=" Editar  " OnClick="btnEditar_Click" />
                 </div>  
                 <div class="col-sm-6 form-horizontal" >
                      <div class="col-sm-6">  
                        <asp:Button ID="btnGuadar" ClientIDMode="Static" runat="server" ValidationGroup="Guardar" CssClass="btn btn-primary col-sm-12"  Text="Guardar" OnClick="btnGuadar_Click" />
                      </div>    
                      <div class="col-sm-6"> 
                        <asp:Button ID="btnCancelar" ClientIDMode="Static" runat="server" CssClass="btn btn-danger col-sm-12" Text="Cancelar" OnClick="btnCancelar_Click" />
                     </div> 
                 </div>         
               </div>     
            </div>    
        </div>
       </div>
     </div>
    <asp:HiddenField ID="hfEjecutivo" runat="server" />
    </div>
     </asp:Panel> 
   </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

