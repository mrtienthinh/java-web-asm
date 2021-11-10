<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mt" %>
<mt:mainlayout title="Product Page">
    <jsp:attribute name="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong>Product</strong> new
                    </div>
                    <div class="card-body card-block">
                        <form id="productForm" action="${product.id > 0 ? '/editProduct' : '/createProduct'}" method="post" class="form-horizontal">
                            <input type="hidden" name="id" value="${product.id}"/>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-name" class=" form-control-label">Email</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="hf-name" name="name" placeholder="Enter name..." class="form-control" value="${product.name}">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-price" class=" form-control-label">Price</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="number" id="hf-price" name="price" placeholder="Enter price..." class="form-control" value="${product.price}">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-quantity" class=" form-control-label">Quantity</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="number" id="hf-quantity" name="quantity" placeholder="Enter quantity..." class="form-control" value="${product.quantity}">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="select" class=" form-control-label">Category</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="categoryId" id="select" class="form-control">
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.id}" ${category.id == product.categoryId ? 'selected' : ''}>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary btn-sm" form="productForm" >
                            <i class="fa fa-dot-circle-o"></i> Submit
                        </button>
                        <a href="/product" class="btn btn-danger btn-sm" role="button">
                            <i class="fa fa-ban"></i> Back
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:mainlayout>