<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt" %>
<mt:mainlayout title="Category Page">
    <jsp:attribute name="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong>Category</strong> new
                    </div>
                    <div class="card-body card-block">
                        <form id="categoryForm" action="${category.id > 0 ? '/editCategory' : '/createCategory'}" method="post" class="form-horizontal">
                            <input type="hidden" name="id" value="${category.id}"/>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-name" class=" form-control-label">Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="hf-name" name="name" placeholder="Enter name..." class="form-control" value="${category.name}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary btn-sm" form="categoryForm">
                            <i class="fa fa-dot-circle-o"></i> Submit
                        </button>
                        <a href="/category" class="btn btn-danger btn-sm" role="button">
                            <i class="fa fa-ban"></i> Back
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:mainlayout>