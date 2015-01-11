<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="articlesBoard.ascx.cs" Inherits="DiabetesCMS.articlesBoard" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mainboard">
        Main Board
    </div>
</div>
<div class="row articlesboardcontainer">
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 articlesboardgrid">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 captureitemsheadings">
                <span class="label label-default">Captured Articles</span>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <span class="label label-primary category">Category</span>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <select id="category" class="articleBoardCategory">
                    <% foreach(var category in categories){ %>
                        <option value="<%=category["id"] %>" <% if(Convert.ToInt32(category["id"]) == categoryId){ %> selected="selected" <%} %>><%=category["categoryname"] %></option>
                    <%} %>
                </select>
            </div>
        </div>
      <div class="row articlestable">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                    <table class="table table-striped table-condensed table-hover">
                        <thead>
                            <tr>
                                <th>Article Heading</th>
                                <th>Status</th>
                                <th>Date Created</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                         <% foreach(var item in articles){ %>
                            <tr>
                                <td width="35%" class="header<%=item["id"] %>"><%=item["header"] %></td>
                                <td width="18%">
                                    <% if (item["draft"] == "True"){ %>
                                        <span class="label label-danger">Draft</span>
                                    <%}else if (item["complete"] == "True"){ %>
                                        <span class="label label-success">Completed</span>
                                    <%} %>
                                </td>
                                <td width="25%">
                                    <%=item["dateCreated"] %>
                                </td>
                                <td width="45%">
                                    <p class="text-info displayinline" data-toggle="modal" data-target="#myModal<%=item["id"] %>">View</p><p class="displayinline"> | </p> <p class="text-danger displayinline cursor delete" id="<%=item["id"] %>"> Delete</p><p class="displayinline"> | </p><p class="text-success displayinline editArticle" id="<%=item["id"] %>">Edit</p>
                                </td>
                            </tr>
                         <%} %>
<%--                        <% foreach(KeyValuePair<string,string> en_trans in englishTrans){ %>
                        <tr>
                            <td width="35%"><%= en_trans.Value %></td>
                            <td>
                                <% if (String.IsNullOrEmpty(portugueseTrans[en_trans.Key])){ %>
                                    <span class="label label-danger">Missing portuguese </span><span class="<%=en_trans.Key %>"></span>
                                <%}else{ %>
                                    <span class="label label-success" data-container="body" data-toggle="popover" data-placement="right" data-original-title="Captured translation" data-content="<%=portugueseTrans[en_trans.Key] %>" data-trigger="hover">Portuguese captured</span><span class="<%=en_trans.Key %>"></span>
                                <%} %>
                            </td>
                            <td><a href="Javascript:void(0);" class="anchoroveride edittranslation"><span class="glyphicon glyphicon-pencil"></span><small class="edittrans" id="<%= en_trans.Key %>"> [ edit ]</small></a></td>
                        </tr>
                        <%} %>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- delete article -->
        <div class="row deleteArticle">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="alert alert-danger backgroundcolorwhite" role="alert">
                    <p>Article <strong class="articleContent"></strong> will be deleted</p>
                    <p>
                    <button type="button" class="btn btn-default btn-sm proceedWithArticleDelete">Proceed</button>
                    <button type="button" class="btn btn-danger btn-sm cancellArticleDelete">Cancel</button>
                    </p>
                </div>
            </div>
        </div>
        <!-- end delete article -->
        <div class="row onArticleDeletingMessage">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="alert alert-info backgroundcolorwhite" role="alert">
                    <strong>Deleting article </strong> Please wait .....
                </div>
            </div>
        </div>
        <div class="row onArticleDeletingSuccessfully">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="alert alert-success backgroundcolorwhite" role="alert">
                    <p><strong>Deleted Succesfully</strong>......Page been refreshed</p>
                </div>
            </div>
        </div>
        <% if (articles.Count == 0){ %>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="alert alert-danger backgroundcolorwhite" role="alert">
                    <strong>No Articles </strong> have been captured for this category .....
                </div>
            </div>
        </div>
        <%} %>

<%--        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <ul class="pagination pagination-sm">                  
                   <% for (int i = 0; i < Math.Ceiling((Convert.ToDouble(termsListSize) / this.TermsPerPage)); i++) { %>
                        <% if (this.page == 0){ %>
                            <li class="active"><a href="/translations/dashboard.aspx?page=<%= i %>"><%= i + 1 %></a></li>
                            <%this.page = -1; %>
                        <%}else { %>
                        <li <% if (this.page == i){ %> class="active" <%} %>><a href="/translations/dashboard.aspx?page=<%= i %>"><%= i + 1 %></a></li>
                        <%} %>
                  <%} %>                  
                </ul>
            </div>
        </div>--%>
<%--        <div class="row paginationrow">
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <div class="paginText">.</div>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            </div>
        </div>--%>
    </div>
<%--    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 edittranslations">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 captureitemsheadings">
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">                         
                    </div>
                    <span class="label label-info editingitemslabel">Editing Item</span>
                </div>               
            </div>
        </div>
        <div class="row translationtableedit">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="panel panel-default">
                  <div class="panel-body editpanelbackground">
                      <form role="form">
                          <div class="form-group aligncenter">
                              <span class="glyphicon glyphicon-hand-right"></span> <strong>&nbsp;&nbsp;<u class="termvalue"></u>&nbsp;&nbsp;</strong> <span class="glyphicon glyphicon-hand-left"></span>
                          </div>
                          <div class="form-group">
                              <select id="choosetranslatedlanguage" class="form-control">
                                  <option value="-1">In Portuguese</option>
                                  <!--<option value="">Choose language</option>-->
                              </select>
                          </div>
                          <div class="form-group">
                              <input type="text" class="form-control newtranslation" placeholder="Add translation" />
                          </div>
                      </form>                
                      <button type="button" class="btn btn-default btn-block savetranslation">Save </button>   
                      <button type="button" class="btn btn-default btn-block canceltranslation">Cancel </button> 
                      <p class="text-danger margintop5 updatingtranslation">Updating .....</p>
                      <p class="text-success margintop5 translationsuccesfullyupdated">Updated Successfull ....</p>
                      <p class="text-success margintop5 entertranslationbeforesave"><span class="glyphicon glyphicon-info-sign"></span> <small>Please enter translation</small></p>
                          
                  </div>
                </div>
            </div>            
        </div>
    </div>--%>
<!-- Modal -->
        <%foreach (var item in articles){ %>
            <div class="modal fade" id="myModal<%=item["id"] %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <!--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                    <h4 class="modal-title" id="myModalLabel"><%=item["header"] %></h4>
                  </div>
                  <div class="modal-body">
                      <%=item["body"] %>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                  </div>
                </div>
              </div>
            </div>
    <%} %>
</div>

<script>
    $(document).ready(function () {
        $("#dashboard").attr("class", "active");
    });
</script>