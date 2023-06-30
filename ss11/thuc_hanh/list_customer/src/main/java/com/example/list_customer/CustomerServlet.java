package com.example.list_customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://nld.mediacdn.vn/thumb_w/684/291774122806476800/2021/9/20/david-de-gea-16321026911331208259644.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-07-10", "Bắc Giang", "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt5b612eca83540f27/62e26c3888ccd83f7530526e/Lisandro_Martinez_Manchester_United_(1)_copy.jpg?auto=webp&format=pjpg&width=828&quality=60"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1993-01-20", "Nam Định ", "https://cdn-img.thethao247.vn/origin_865x0/storage/files/hungtm/2023/05/12/bruno-fernadnes-1683858834-093552.jpg"));

        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
