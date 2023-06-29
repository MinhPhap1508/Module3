package com.example.product_discount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));
        double amount= price * percent * 0.01;
        double discount_price=price-amount;

        String product = request.getParameter("product_description");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product: " + product + "</h1>" );
        writer.println("<h2>Discount Amount: " + amount + "</h2>");
        writer.println("<h2>Discount Price: " + discount_price + "</h2>");
        writer.println("</html>");
    }
}
