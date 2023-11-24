package controller.service;

import model.Service;
import service.service.IServiceService;
import service.service.impl.ServiceService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/ServiceServlet")
public class ServiceServlet extends HttpServlet {
    private IServiceService serviceService = new ServiceService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                response.sendRedirect("service/add.jsp");
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                listService(request, response);
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        serviceService.deleteService(id);
        List<Service> serviceList = serviceService.displayAll();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/service.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Service service = serviceService.getById(id);
        request.setAttribute("service", service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList = serviceService.displayAll();
        System.out.println(serviceList);
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/service.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addService(request, response);
                break;
            case "edit":
                editService(request, response);
                break;
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        Service editService = new Service(id, name, price);
        this.serviceService.updateService(editService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        Service service = new Service(name, price);
        this.serviceService.addService(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/add.jsp");
        dispatcher.forward(request, response);
    }
}
