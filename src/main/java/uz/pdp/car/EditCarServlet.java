package uz.pdp.car;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editCar")
public class EditCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Car car = CarService.getCarById(id);
        req.setAttribute("car", car);
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String color = req.getParameter("color");
        int year = Integer.parseInt(req.getParameter("year"));
        double price = Double.parseDouble(req.getParameter("price"));

        Car updatedCar = new Car(id, brand, model, color, year, price);
        CarService.updateCar(updatedCar);
        resp.sendRedirect("cars");
    }
}

