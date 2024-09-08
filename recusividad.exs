defmodule Recursividad do

  def main do
  "Ingrese el numero: "
  |> Util.ingresar(:entero)
  |> determinar_par?()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  # defp determinar_par?(0), do: :true
  # defp determinar_par?(n), do: determinar_impar?(n-1)

  # defp determinar_impar?(0), do: :false
  # defp determinar_impar?(n), do: determinar_par?(n-1)

  defp determinar_par?(n) do
    if n == 0 do
      :true
    else
      determinar_impar?(n-1)
    end
  end

  def generar_mensaje(:true), do: "El numero es par"
  def generar_mensaje(:false), do: "El numero es impar"

end

Recursividad.main()
