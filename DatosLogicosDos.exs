defmodule DatosLogicosDos do
  def main do
  "Ingrese la antigüedad del cliente en años: "
  |> Util.ingresar(:entero)
  |> obtener_porcentaje_descuento()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  #FORMA 1
  # defp obtener_porcentaje_descuento(antiguedad) do
  #   if antiguedad < 1 do
  #     0.0
  #     else if antiguedad <= 2 do
  #       0.10
  #       else if antiguedad <= 6 do
  #         0.14
  #         else
  #           0.17
  #         end
  #       end
  #     end
  # end

  #FORMA 2
  # defp obtener_porcentaje_descuento(antiguedad) when antiguedad < 1, do: 0.0
  # defp obtener_porcentaje_descuento(antiguedad) when antiguedad <= 2, do: 0.10
  # defp obtener_porcentaje_descuento(antiguedad) when antiguedad <= 6, do: 0.14
  # defp obtener_porcentaje_descuento(_), do: 0.0

  #FORMA 3
  defp obtener_porcentaje_descuento(antiguedad) do
    cond do
    antiguedad < 1 -> 0.0
    antiguedad <= 2 -> 0.10
    antiguedad <= 6 -> 0.14
    true -> 0.17
    end
  end

  def generar_mensaje(porcentaje) do
    "El porcentaje es de #{porcentaje}"
  end

end

DatosLogicosDos.main()
