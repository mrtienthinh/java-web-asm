package com.example.asm.controller;

import com.example.asm.dao.CategoryDao;
import com.example.asm.dao.ProductDao;
import com.example.asm.models.Category;
import com.example.asm.models.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryCreateServlet", value = "/createCategory")
public class CategoryCreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("category", new Category());
        request.getRequestDispatcher("/create_or_edit_category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category category = new Category();
        category.setName(request.getParameter("name"));
        CategoryDao.insert(category);
        response.sendRedirect(request.getContextPath() + "/category");
    }
}
