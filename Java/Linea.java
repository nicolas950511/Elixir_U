public class Linea {

    private Punto puntoInicial;

    private Punto puntoFinal;



    public void setPuntoInicial(double x, double y) {

        puntoInicial = new Punto(x, y);

    }



    public void setPuntoFinal(double x, double y) {

        puntoFinal = new Punto(x, y);

    }



    @Override

    public String toString() {

        return "Línea desde " + puntoInicial + " hasta " + puntoFinal;

    }



    // Método estático para iniciar el proceso de construcción

    public static Linea crear() {

        return new Linea();

    }



    public Linea desde(double x, double y) {

        setPuntoInicial(x, y);

        return this;

    }



    public Linea hasta(double x, double y) {

        setPuntoFinal(x, y);

        return this;

    }



    // Default constructor

    public Linea() {

    }

}