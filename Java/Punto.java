public record Punto(double x, double y) {
    @Override
    public final String toString() {
        return "(" + x + ", " + y + ")";
    }
}
