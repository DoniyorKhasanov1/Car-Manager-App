package uz.pdp.car;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/addCar")
public class AddCarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String color = req.getParameter("color");
        int year = Integer.parseInt(req.getParameter("year"));
        double price = Double.parseDouble(req.getParameter("price"));

        Car car = new Car(null, brand, model, color, year, price);
        CarService.insertCar(car);

        resp.sendRedirect("cars");
    }
}
