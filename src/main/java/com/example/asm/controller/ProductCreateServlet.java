package com.example.asm.controller;

import com.example.asm.dao.CategoryDao;
import com.example.asm.dao.ProductDao;
import com.example.asm.models.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductCreateServlet", value = "/createProduct")
public class ProductCreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("product", new Product());
        request.setAttribute("categories", CategoryDao.getAll());
        request.getRequestDispatcher("/create_or_edit_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setPrice(Float.parseFloat(request.getParameter("price")));
        product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        ProductDao.insert(product);
        response.sendRedirect(request.getContextPath() + "/product");
    }
}
