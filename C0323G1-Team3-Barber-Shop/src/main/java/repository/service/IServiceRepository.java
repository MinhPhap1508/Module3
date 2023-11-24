package repository.service;

import model.Service;

import java.util.List;

public interface IServiceRepository {
    List<Service> displayAll();

    void addService(Service service);

    public boolean updateService(Service service);

    public boolean deleteService(int id);

    Service getById(int id);
}
