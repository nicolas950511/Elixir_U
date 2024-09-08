defmodule DatosLogicos do

    @anio_fundacion 1991

    def main do
    "Ingrese número de cédula: "
    |> Util.ingresar(:entero)
    |> hay_promocion?(@anio_fundacion)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
    end

    defp hay_promocion?(cedula, fecha_promocion)
    when rem(cedula, fecha_promocion) == 0, do: true
    defp hay_promocion?(_,_), do: false

    defp generar_mensaje(true), do: "Recibe el descuento"
    defp generar_mensaje(false), do: "No recibe descuento"

  end
  DatosLogicos.main()
