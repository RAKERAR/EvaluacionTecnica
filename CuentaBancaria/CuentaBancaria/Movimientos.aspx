<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Movimientos.aspx.cs" Inherits="CuentaBancaria.Movimientos" %>

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
<asp:UpdatePanel ID="upPrincipal" runat="server">
   <ContentTemplate>
     <div class="panel panel-primary">
     <div class="panel-heading">
        <h3 class="panel-title">Movimientos</h3>
     </div>
      <div class="panel-body">
        <div class="container" >
            
          <div class="row form-horizontal">
              <div class="form-group">
                <label class="control-label col-sm-2" for="txtTarjeta">No. Cliente</label>
                <div class="col-lg-4" >
                   <asp:Panel runat="server"  DefaultButton="btnBuscar">
                       <asp:TextBox id="txtCliente" ClientIDMode="Static" runat="server" CssClass="col-sm-2 form-control" > </asp:TextBox>
                       <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" style="display:none;"/>
                       <asp:RequiredFieldValidator  runat="server" CssClass="col-sm-1" Display="Dynamic" ControlToValidate="txtCliente" ClientIDMode="Static" Visible="true" ErrorMessage="*" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                   </asp:Panel>
                </div>
                <label class="control-label col-sm-2" for="lblCliente">Cliente:</label>
                  <asp:Label runat="server" CssClass="control-label col-sm-2" ClientIDMode="Static" ID="lblCliente"></asp:Label>
               
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2" for="ddlMovimiento">Movimiento:</label>
                <div class="col-sm-4" style="padding-right:0px;" >
                   <asp:DropDownList ID="ddlMovimiento" ClientIDMode="Static" runat="server" AutoPostBack="true" CssClass="col-sm-2  form-control" style="width:100%">
                   </asp:DropDownList>
                </div>
                <label class="control-label col-sm-2" for="txtMonto">Monto:</label>
                <div class="col-lg-2">
                      <asp:TextBox ID="txtMonto" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                     <asp:Button ID="btnGuadar" ClientIDMode="Static" runat="server" CssClass="btn btn-primary col-sm-1" Text="Aceptar" OnClick="btnGuadar_Click" />
              </div>
              
              <div class="form-group">
                <label class="control-label col-sm-2 col-md-offset-6" for="txtTarjeta">Saldo:</label>
                <div class="col-lg-2" >
                   <asp:TextBox id="txtSaldo" ClientIDMode="Static" runat="server" CssClass="col-sm-1 form-control" > </asp:TextBox>
                </div>
              </div>

              <div class="form-group">
                  <div >
                      <asp:GridView ID="gvMovimiento" runat="server" ClientIDMode="Static"  CssClass="table table-bordered bs-table" ShowHeader="true" ShowHeaderWhenEmpty="true"  AutoGenerateColumns="false"  >
                          <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#ffffcc" />
                            <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
                            <emptydatatemplate>
                                No se a seleccionado nada
                            </emptydatatemplate> 
                          <Columns>
                              <asp:BoundField  HeaderText="Cuenta"  DataField="NumCuenta"/>
                              <asp:BoundField  HeaderText="Tipo Movimiento"  DataField="Tipo"/>
                               <asp:BoundField  HeaderText="Importe"  DataField="Importe"/>
                              <asp:BoundField HeaderText ="Fecha" DataField="FechaMovimiento" />
                          </Columns>
                      </asp:GridView>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </div>
    <asp:HiddenField ID="hfCuenta" runat="server" />
    <asp:HiddenField ID="hfIdCliente" runat="server" />
    <asp:HiddenField ID="hfCajero" runat="server" />
 </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>