package uz.pdp.car;

import java.sql.*;
import java.util.*;

public class CarService {
    static String url = "jdbc:postgresql://localhost:5432/";
    static String user = "";
    static String password = "";

    static {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection con = DriverManager.getConnection(url, user, password)) {
                Statement st = con.createStatement();
                st.executeUpdate("""
                            CREATE TABLE IF NOT EXISTS cars (
                                id SERIAL PRIMARY KEY,
                                brand VARCHAR(100),
                                model VARCHAR(100),
                                color VARCHAR(100),
                                year INT,
                                price DOUBLE PRECISION
                            );
                        """);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateCar(Car car) {
        String sql = "UPDATE cars SET brand = ?, model = ?, color = ?, year = ?, price = ? WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setString(3, car.getColor());
            ps.setInt(4, car.getYear());
            ps.setDouble(5, car.getPrice());
            ps.setLong(6, car.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteCar(Long id) {
        String sql = "DELETE FROM cars WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertCar(Car car) {
        try (Connection con = DriverManager.getConnection(url, user, password)) {
            String sql = "INSERT INTO cars(brand, model, color, year, price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setString(3, car.getColor());
            ps.setInt(4, car.getYear());
            ps.setDouble(5, car.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Car getCarById(Long id) {
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT * FROM cars WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Car(
                        rs.getLong("id"),
                        rs.getString("brand"),
                        rs.getString("model"),
                        rs.getString("color"),
                        rs.getInt("year"),
                        rs.getDouble("price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Car> getAllCars() {
        List<Car> list = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT * FROM cars";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Car(
                        rs.getLong("id"),
                        rs.getString("brand"),
                        rs.getString("model"),
                        rs.getString("color"),
                        rs.getInt("year"),
                        rs.getDouble("price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
