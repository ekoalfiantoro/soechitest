<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" id="Invoice" runat="server">
        <br />
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>Item Desc</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtItemDesc" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>UOM</span>
                </div>
                <div class="col-md-6">
                    <asp:DropDownList class="form-control" ID="listUOM" runat="server" Value=""  onchange="populateRate()">
                    </asp:DropDownList>
                </div>
            </div>
             <div class="col-md-6">
                <div class="col-md-6">
                    <span>Rate</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtRate" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
         <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>QTY</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtQty" runat="server"  TextMode="Number" onkeyup="calculateQtyKecil(event)"></asp:TextBox>
                </div>

            </div>
              <div class="col-md-6">
                <div class="col-md-6">
                    <span>QTY Kecil</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtQTYkecil" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
        </div>
         <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>Price</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
        </div>
          <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>Diskon</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtDiskon" runat="server" onkeyup="calculateDiskon()"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>Diskon amt</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtDiskonamt" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="col-md-6">
                    <span>Total</span>
                </div>
                <div class="col-md-6">
                    <asp:TextBox class="form-control" ID="txtTot" runat="server" TextMode="Number"></asp:TextBox>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">

        function populateRate() {
            let selectedValue = document.getElementById("<%= listUOM.ClientID %>").value;
            document.getElementById("<%= txtRate.ClientID %>").value = selectedValue;
        }

        function calculateQtyKecil(event) {
            let qty = document.getElementById("<%= txtQty.ClientID %>").value;
            let rate = document.getElementById("<%= txtRate.ClientID %>").value;
            let qtyKecil = qty * rate;
            document.getElementById("<%= txtQTYkecil.ClientID %>").value = qtyKecil;
        }

        function calculateDiskon(event) {
            let diskon = document.getElementById("<%= txtDiskon.ClientID %>").value;
            let price = document.getElementById("<%= txtPrice.ClientID %>").value;
            let qty = document.getElementById("<%= txtQty.ClientID %>").value;
            if (diskon.includes("%") || diskon.includes("+")) {
                diskon = diskon.replace(/%/g, "");
                let nilaiDiskon = 0;
                if (diskon.includes("+")) {
                    diskon = diskon.replace(/\+/g, ",");
                    let arrayDiskon = diskon.split(",");
                    for (var i = 0; i < arrayDiskon.length; i++) {
                        nilaiDiskon = nilaiDiskon + parseInt(arrayDiskon[i]);
                    }
                }
                else {
                    nilaiDiskon = diskon;
                }
                document.getElementById("<%= txtDiskonamt.ClientID %>").value = (nilaiDiskon / 100) *(price * qty);
                document.getElementById("<%= txtTot.ClientID %>").value = (price*qty)  - ((nilaiDiskon / 100) * (price * qty));
            }
            else {
                document.getElementById("<%= txtDiskonamt.ClientID %>").value = diskon;
                document.getElementById("<%= txtTot.ClientID %>").value = (price * qty) - diskon; 
            }
        }
    </script>
</asp:Content>







