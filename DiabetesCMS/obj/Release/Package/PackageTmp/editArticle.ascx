﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editArticle.ascx.cs" Inherits="DiabetesCMS.editArticle" %>


<div class="row addnewTerms">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mainboard">
        Article Board
    </div>
</div>

<script>
    function saveArticle() {
        $(".articleNotCompletelyFilledIn").hide();
        $(".articleBeenSaved").show();
        if (articleSaved == false) {
            if (allDataFilledIn() == false) {
                $(".articleBeenSaved").hide();
                $(".articleNotCompletelyFilledIn").show();
                return false;
            }

            var postUrl = "/AjaxFunction.aspx/updateArticle";
            var draft = 0;
            var completed = 0;

            if (document.getElementById("draft").checked) {
                draft = 1;
            }

            if (document.getElementById("completed").checked) {
                completed = 1;
            }

            var articlebody = tinyMCE.activeEditor.getContent();
            articlebody = articlebody.replace(/'/g, "\\'");

            var articleheading = $("#articleheading").val();
            articleheading = articleheading.replace(/'/g, "\\'");


            if ($('#category').length) {
                categoryid = $("#category").val();
            }

            $.ajax({
                type: "POST",
                url: postUrl,
                data: "{'heading' : '" + articleheading + "', 'body' : '" + articlebody + "', 'categoryid' : '" + categoryid + "', 'draft' : '" + draft + "', 'complete' : '" + completed + "', 'articleId' : '" + <%=articleId %> + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(
                function (data, textStatus, jqXHR) {
                    if (data.d.articleSaved == 1) {
                        articleSaved = true;
                        setTimeout(function () { $(".buttonSubmitUpdate").click(); }, 2500);
                    }
                }
            ).fail(
                function (data, textStatus, jqXHR) {
                }
            );
            return false;
        } else {
            return articleSaved;
        }
    }

    function allDataFilledIn() {
        var dataCaptured = false;
        if (tinyMCE.activeEditor.getContent() != "" && $("#articleheading").val() != "") {
            if (document.getElementById("draft").checked || document.getElementById("completed").checked) {
                if ($('#category').length) {
                    categoryid = $("#category").val();
                }

                if (categoryid != "") {
                    dataCaptured = true;
                }
            }
        }

        return dataCaptured;
    }
</script>

<div class="row addnewArticleContainer">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 articleboard">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 captureitemsheadings">
                <span class="label label-default">Edit Article</span>
            </div>
        </div>
        <%if (justUpdateArticle == true){ %>
        <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 nocategoryalert">
                        <div class="alert alert-success fade in nocategory backgroundcolorwhite" role="alert">
                        <button type="button" class="close" data-dismiss="alert"><span class="glyphicon glyphicon-ok"></span></button>
                        <h5><b>Article has been successfully Updated !!</b> </h5>
                    Page been refreshed...
                </div>
            </div>
        </div>
        <script>
            setTimeout(function () { location.href = "/dashboard.aspx"; }, 3500);
        </script>
            <%}else{ %>
                <div class="row">
                    <!-- new code -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="alert alert-info fade in margintop14 marginbottom5 backgroundcolorwhite" role="alert">
                              <h4>Please chooce the Category for the new Article.</h4>
                              <select id="category">
                                <% foreach(var category in categories){ %>
                                    <option value="<%=category["id"] %>" <% if (category["id"] == article["categoryId"]){ %> selected="selected"<%} %>><%=category["categoryname"] %></option>
                                <%} %>
                            </select>
                        </div>
                   </div>
                </div>

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margintop20">
                <input type="text" class="form-control" placeholder="Heading" id="articleheading" value="<%= article["header"] %>"/>
            </div>
        </div>
        <div class="row articletable">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 addnewarticleTinyMcContainer">
                		<textarea id="articlebody"><% = articleContent %></textarea>
            </div>
            <!-- article image-->
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 captureitemsheadings">
                <div class="panel panel-default">
                    <div class="panel-heading">Article Image</div>
                    <div class="panel-body">
                    <!-- new code -->
                        <div class="row">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <label for="exampleInputFile">Image</label>
                        </div>
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <!-- new code -->
                            <!-- preview -->
                            <!-- Button trigger modal -->
                            <p class="btn btn-primary btn-xs previewimage1" data-toggle="modal" data-target="#myEditArticleModal">
                              View Image
                            </p>
                            <!-- end preview -->

                            <span class="label label-default changeImageOne">change image</span>

                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 editFileUpload1">
                                <asp:FileUpload ID="articleImage" runat="server" />
                            </div>

                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 cancelFileUpload1">
                                <span class="label label-danger cancelEditFileUpload1">cancel</span>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="myEditArticleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Article Image</h4>
                                  </div>
                                  <div class="modal-body">
                                      <% if (String.IsNullOrEmpty(article["picture"])){ %>
                                        <img src="../../articleImages/noImageAvailable.jpg" height="366px" width="561px"/>
                                      <%} else { %>
			                                <img src="../../articleImages/<%=article["picture"] %>" height="366px" width="561px"/>
                                      <%} %>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                        <!-- end of new code -->
                        </div>
                    </div>
                    <!-- end of new code -->
                    </div>
                </div>
            </div>
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 captureitemsheadings">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Article Status
                    </div>
                    <div class="panel-body">
                            <div class="radio">
                                <label class="radio-inline">
                                    <input type="radio" name="articlestatus" id="draft" <%if (article["draft"] == "True"){ %> checked="checked" <%} %>/>Draft
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="articlestatus" id="completed" <%if (article["complete"] == "True"){ %> checked="checked" <%} %> />Completed
                                </label>
                            </div>
                    </div>
                </div>
            </div>
            <!-- end of article image -->
        </div>
        <div class="row">
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <asp:Button ID="articleUpdate" runat="server" Text="Update Article" class="btn btn-default btn-block buttonSubmitUpdate" OnClick="articleUpdate_Click" OnClientClick="return saveArticle()" />
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <button type="button" class="btn btn-danger btn-block cancelUpdate">Cancel</button>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="alert alert-danger backgroundcolorwhite articleNotCompletelyFilledIn" role="alert">
                    <strong>Some Article attributes have not been filled in!!</strong><br />
                    Please complete and save the article
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="alert alert-info backgroundcolorwhite articleBeenSaved" role="alert">
                    <strong>Updating Article</strong><br />
                    Please wait.......
                </div>
            </div>
        </div>

        <%} %>
</div>
</div>


<script>

    $(document).ready(function () {
        $("#articles").attr("class", "active");
        $("#articles").find("a").html("Editing Article");
    });
</script>