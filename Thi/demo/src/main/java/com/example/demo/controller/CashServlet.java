package com.example.demo.controller;

import com.example.demo.model.Cash;
import com.example.demo.service.CashService;
import com.example.demo.service.ICashService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CashServlet", value = "/CashServlet")
public class CashServlet extends HttpServlet {
    private static ICashService cashService = new CashService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                response.sendRedirect("add.jsp");
                break;
            case "delete":
                deleteCash(request, response);
            default:
                showListCash(request, response);
                break;
        }
    }

    private void deleteCash(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        cashService.deleteCash(id);
        RequestDispatcher dispatcher =request.getRequestDispatcher("/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListCash(HttpServletRequest request, HttpServletResponse response) {
        List<Cash> cashList = cashService.displayAll();
        request.setAttribute("cashList", cashList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        boolean choose = Boolean.parseBoolean(request.getParameter("choose"));
        String date = request.getParameter("date");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        Cash cash = new Cash(name, choose, date, price, description);
        cashService.addCash(cash);
        response.sendRedirect("/CashServlet");
    }
}
