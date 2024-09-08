public class Demo {
    public static void main(String[] args) {
        demoTradicional();
        demoDSL();
    }

    public static void demoTradicional() {
        var linea = new Linea();
        linea.setPuntoInicial(4.0, 5.0);
        linea.setPuntoFinal(8.0, 9.0);
        System.out.println(linea);
    }

    public static void demoDSL() {
        Linea linea = Linea.crear()
                           .desde(4.0, 5.0)
                           .hasta(8.0, 9.0)
                           .construir();
        System.out.println(linea);
    }
}
