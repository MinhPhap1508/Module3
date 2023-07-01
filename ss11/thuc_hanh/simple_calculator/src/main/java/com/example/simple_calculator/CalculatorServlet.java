package com.example.simple_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        float firstOperand = Float.parseFloat(request.getParameter("first_operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second_operand"));
        char Operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result: </h1>");
        try {
            float result = Calculator.calculate(firstOperand,secondOperand, Operator);
            writer.println(firstOperand + "" + Operator+ "" + secondOperand + "=" + result);
        }catch (Exception exception){
            writer.println("Invalid math");
        }
        writer.println("</html>");
    }
}
