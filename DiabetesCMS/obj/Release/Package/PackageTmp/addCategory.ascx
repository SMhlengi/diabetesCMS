<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addCategory.ascx.cs" Inherits="DiabetesCMS.addCategory" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mainboard">
        Main Board
    </div>
</div>
<div class="row articlesboardcontainer">
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 articlesboardgrid">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 captureitemsheadings">
                <span class="label label-default">Categories</span>
            </div>
        </div>
      <div class="row categoriestable">
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 categoriesborder">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Captured Categories
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach(var item in categories){ %>
                                <tr>
                                    <td width="48%" id="categoryNameId<%=item["id"] %>"><%=item["categoryname"] %></td>
                                    <td width="35%">
                                        <% if (item["categoryname"] != "unassigned"){ %>
                                        <p class="text-danger displayinline cursor deleteCategory" id='<%=item["id"] %>'> Delete</p> <p class="displayinline"> | </p> <p class="text-success displayinline editCategory" id='<%=item["id"] %>'>Edit</p>
                                        <%} %>
                                    </td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil displayinline editPencil editPencil<%=item["id"] %>"></span>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                <div class="row newCategoryrow">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="bg-primary capturenewcategory">Capture New Category</p>
                    </div>
                </div>
                <div class="row newCategoryrow">
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <div class="form-group">
                            <input type="text" class="form-control newcategorycaptured" placeholder="New Category">
                        </div>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-=3">
                        <button type="button" class="btn btn-default btn-block saveCategory">Save</button>
                    </div>
                </div>
                <!-- edit category -->
                <div class="row editCategoryrow">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="bg-primary capturenewcategory">Edit Category</p>
                    </div>
                </div>
                <div class="row editCategoryrow">
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <div class="form-group">
                            <input type="text" class="form-control currentcategorycaptured" placeholder="New Category">
                        </div>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-=3">
                        <button type="button" class="btn btn-default btn-block UpdatedCategory">Update</button>
                    </div>
                    <!-- testing something -->
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 margintopminus10">
                        <button type="button" class="btn btn-danger btn-block CancellUpdatedCategory">Cancel</button>
                    </div>
                </div>
                <!-- end of edit category -->
                <!-- delete category -->
                <div class="row deleteCategoryrow">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="bg-primary capturenewcategory">Delete Category</p>
                    </div>
                </div>
                <div class="row deleteCategoryrow deleteCategoryRowAlert">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="alert alert-danger backgroundcolorwhite" role="alert">
                            <p>Category <strong class="deleteCreatedCategory"></strong> will be deleted</p>
                            <p class="margintop10">
                            <button type="button" class="btn btn-default btn-sm proceedWithCategoryDelete">Proceed</button>
                            <button type="button" class="btn btn-danger btn-sm cancelCategoryDelete">Cancel</button>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end of deletion -->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="alert alert-info backgroundcolorwhite updatingcategory" role="alert">
                            <p><strong>Updating Category</strong>......</p>
                        </div>
                        <div class="alert alert-info backgroundcolorwhite deletinggcategory" role="alert">
                            <p><strong>Deleting Category</strong>......</p>
                        </div>
                        <div class="alert alert-info backgroundcolorwhite UnassignedCategoryExists" role="alert">
                            <p>This category is associated with articles. Please create <strong>Unassigned </strong> category to move these articles to</p>
                            <button type="button" class="btn btn-success btn-sm createUnassignedCategory">Create Unassigned Category </button>
                        </div>
                        <div class="alert alert-success backgroundcolorwhite categoryupdated" role="alert">
                            <p><strong>Updated Succesfully</strong>......Page been refreshed</p>
                        </div>
                        <div class="alert alert-success backgroundcolorwhite categoryDeleted" role="alert">
                            <p><strong>Category Succesfully deleted</strong>......Page been refreshed</p>
                        </div>
                        <div class="alert alert-info backgroundcolorwhite savingcategory" role="alert">
                            <p><strong>Saving Category</strong>......</p>
                        </div>
                        <div class="alert alert-success backgroundcolorwhite categorysaved" role="alert">
                            <p><strong>Saved Succesfully</strong>......Page been refreshed</p>
                        </div>
                        <div class="alert alert-danger backgroundcolorwhite categoryExists" role="alert">
                            <p><strong>Category already Exists......</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#categories").attr("class", "active");
    });
</script>