<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pdfView.aspx.cs" Inherits="KnowledgeNexus.pdfView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">


    <%-- <script type="text/javascript">
        window.onload = function () {
            var viewerElement = document.getElementById("pdfViewer");
            viewerElement.innerHTML = '<%= viewerUrl %>';
        };
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=MSI\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True;" ProviderName="System.Data.SqlClient" SelectCommand="sp_GetPdfById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="BookId" SessionField="BookId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <iframe id="pdfViewer" src="<%#Eval("PdfLink") %>" width="100%" height="900px"></iframe>
            
        </ItemTemplate>
    </asp:Repeater>


    <%--<iframe id="pdfViewer" width="100%" height="600px"></iframe>

    <script>
        document.getElementById("pdfViewer").src = "@pdfLink";
    </script>--%>

   

    <%--<iframe src="PDFs/395f0adb-3a90-4d7d-b8b3-8b27157a0aa3.pdf" width="100%" height="1200"></iframe>--%>
</asp:Content>
