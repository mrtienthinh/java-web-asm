package com.example.asm.controller;

import com.example.asm.dao.CategoryDao;
import com.example.asm.models.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryEditServlet", value = "/editCategory")
public class CategoryEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("category", CategoryDao.getById(Integer.parseInt(request.getParameter("id"))));
        request.getRequestDispatcher("/create_or_edit_category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category category = CategoryDao.getById(Integer.parseInt(request.getParameter("id")));
        category.setName(request.getParameter("name"));
        CategoryDao.insert(category);
        response.sendRedirect(request.getContextPath() + "/category");
    }
}
