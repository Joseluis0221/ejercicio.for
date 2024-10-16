import java.util.Scanner;

class Personas {
    private double edad;
    private double estadoCivil; // 1: Soltero, 2: Casado
    private double estatura; // en cm
    private double sexo; // 1: Hombre, 2: Mujer

    // Constructor
    public Personas(double edad, double estadoCivil, double estatura, double sexo) {
        this.edad = edad;
        this.estadoCivil = estadoCivil;
        this.estatura = estatura;
        this.sexo = sexo;
    }

    public double getEdad() {
        return edad;
    }

    public double getEstadoCivil() {
        return estadoCivil;
    }

    public double getEstatura() {
        return estatura;
    }

    public double getSexo() {
        return sexo;
    }

    public boolean cumpleCondiciones() {
        return (edad > 18 && estadoCivil == 1 && estatura > 170 && sexo == 1);
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        double promedioEdad = 0, promedioEstatura = 0, porcentajePersonas = 0;
        int contadorPersonas = 0;
        double acumuladorEdad = 0, acumuladorEstatura = 0;
        int cantidadPersonas = 2; // Cambiar este número si deseas más entradas

        for (int numeroPersona = 1; numeroPersona <= cantidadPersonas; numeroPersona++) {
            System.out.println("Datos de la persona " + numeroPersona + ":");

            System.out.print("Ingrese la edad: ");
            double edad = scanner.nextDouble();

            System.out.print("Ingrese el estado civil (1. Soltero, 2. Casado): ");
            double estadoCivil = scanner.nextDouble();

            System.out.print("Ingrese la altura en cm: ");
            double estatura = scanner.nextDouble();

            System.out.print("Ingrese el sexo (1. Hombre, 2. Mujer): ");
            double sexo = scanner.nextDouble();

            // Crear un objeto Persona
            Personas persona = new Personas(edad, estadoCivil, estatura, sexo);

            if (persona.cumpleCondiciones()) {
                contadorPersonas++;
                acumuladorEdad += persona.getEdad();
                acumuladorEstatura += persona.getEstatura();
            }

            System.out.println(); // Para separar la entrada de cada persona
        }

        if (contadorPersonas > 0) {
            promedioEdad = acumuladorEdad / contadorPersonas;
            promedioEstatura = acumuladorEstatura / contadorPersonas;
            porcentajePersonas = (contadorPersonas / (double) cantidadPersonas) * 100;

            System.out.println("El promedio de edad de las personas que cumplen es: " + promedioEdad + " años");
            System.out.println("El promedio de estatura de las personas que cumplen es: " + promedioEstatura + " centímetros");
            System.out.println("El porcentaje de las personas que cumplen con la condición es del: " + porcentajePersonas + " %");
        } else {
            System.out.println("No hay personas que cumplan con las condiciones.");
        }

        scanner.close();
    }
}
