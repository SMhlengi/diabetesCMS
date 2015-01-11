<%@ Page Title="" Language="C#" MasterPageFile="~/Diabetes.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DiabetesCMS._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signform">
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>        
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <h3 class="">Login</h3>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>  
        </div>
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>  
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <hr class="nomargintop" />
            </div> 
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>             
        </div>
        <div class="row">
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            </div> 
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 loginform">
                 <h4 class="marginbottom22">With GoldCreative CMS account</h4>
                <form role="form">
                    <div class="form-group" id="username">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input  type="text" class="form-control username" placeholder="Username" />
                        </div>
                    </div>
                    <div class="form-group" id="password">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input  type="password" class="form-control password" placeholder="Password" />
                        </div>
                    </div>
<%--                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value"true" id="rememberme"/> Remember me
                            </label>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary btn-block greycolor login">Sign In</button>--%>
                    <div class="form-group">
                        <table class="table table-striped">
                            <tbody>
                                <tr class="active">
                                    <td width="22%">
                                        <button type="button" class="btn btn-primary login">Sign In</button>
                                    </td>
                                    <td>
                                    <div class="checkbox">
                                        <label class="checkboxfont">
                                            <input type="checkbox" id="rememberme"/> Remember me on this computer
                                        </label>
                                    </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            </div> 
        </div>
        <div class="row nomargintop">
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 loginvalidation">
                <img class="img-responsive inlineoveride spinner" src="<%=ResolveUrl("~/assets/images/spinner.GIF")%>" />
                <div class="message"></div>
            </div>               
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            </div>          
        </div>
    </div>  
</asp:Content>
