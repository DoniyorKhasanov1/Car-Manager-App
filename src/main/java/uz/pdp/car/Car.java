package uz.pdp.car;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
    private Long id;
    private String brand;
    private String model;
    private String color;
    private Integer year;
    private Double price;
}
