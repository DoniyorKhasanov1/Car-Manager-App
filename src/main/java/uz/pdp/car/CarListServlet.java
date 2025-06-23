package uz.pdp.car;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/cars")
public class CarListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Car> cars = CarService.getAllCars();
        req.setAttribute("carList", cars);
        req.getRequestDispatcher("list.jsp").forward(req, resp);
    }}
