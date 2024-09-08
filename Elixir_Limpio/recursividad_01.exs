defmodule Factorial do
  def main do
  "\nIngrese la cantidad de clientes : "
  |> Util.ingresar(:entero)
  |> calcular_permitaciones_circulares()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  defp calcular_permitaciones_circulares(n) do
    (n - 1)
    |> calcular_factorial()
  end

  defp calcular_factorial(0), do: 1
  defp calcular_factorial(m), do: m * calcular_factorial(m - 1)
  defp generar_mensaje(cantidad_maneras) do
  "Se pueden sentar de #{cantidad_maneras} formas diferentes\n"
  end
end

Factorial.main()
