<%@ Page Title="" Language="C#" MasterPageFile="~/Diabetes.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DiabetesCMS.dashboard" %>
<%@ Register Src="~/uc_norecords.ascx" TagName="records" TagPrefix="no" %>
<%@ Register Src="~/addnewarticle.ascx" TagName="article" TagPrefix="addnew" %>
<%@ Register Src="~/addCategory.ascx" TagName="category" TagPrefix="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="javascript:void(0);">Dashboard</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-5">
          <p class="navbar-text navbar-right">Signed in as <u><script>if ($.cookie("logged_in_user")) { document.write($.cookie("logged_in_user").toUpperCase()) }</script>&nbsp;</u>&nbsp;&nbsp; <strong> [ </strong> <a href="javascript:void(0);" class="logout"> Logout </a> <strong> ] </strong></p>                      
        </div>
    </div>
</nav>

<div class="panel panel-default">
    <div class="panel-body">
        <div class="dashboard">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-2 col-lg-2 margintop40">
                    <ul class="nav nav-pills nav-stacked">
                      <li id="dashboard" class=""><a href="/articlesboard">Home</a></li>
                      <li id="articles" class=""><a href="/addnewarticle">Add Article</a></li>
                      <li id="categories" class=""><a href="/addcategory">Add Categories</a></li>
                    </ul>
                </div>
                <div class="col-xs-9 col-sm-10 col-md-10 col-lg-10 margintop40">
                    <% if (View == "norecords"){ %>         
                    <no:records id="norecordscontrol" runat="server" />    
                   <%}else if (View =="addnewarticle"){ %>       
                    <addnew:article ID="newarticle" runat="server" />
                     <%}
                       else if (View == "articlesboard")
                       { %>
                            <asp:Placeholder ID="articlesboard_two" runat="server" />
                    <%}
                       else if (View == "addnewcategory")
                       { %>
                        <view:category ID="addnewcategory" runat="server" />
                    <%}else if (View =="editarticle") { %>
                        <asp:PlaceHolder id="editArticle" runat="server" />
                        <%} %>
                </div>    
                <!--<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2"></div>-->
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">         
                </div>    
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
            </div>
            <div class="margintop10"></div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                </div> 
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
