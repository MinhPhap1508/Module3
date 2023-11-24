package service.service;

import model.Service;

import java.util.List;

public interface IServiceService {
    List<Service> displayAll();

    void addService(Service service);

    public boolean updateService(Service service);

    public boolean deleteService(int id);
    Service getById(int id);
}
