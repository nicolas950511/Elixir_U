defmodule Factorial do
  def main do
  "\nIngrese la cantidad de clientes : "
  |> Util.ingresar(:entero)
  |> Util.calcular_permitaciones_circulares()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(cantidad_maneras) do
  "Se pueden sentar de #{cantidad_maneras} formas diferentes\n"
  end
  end

  Factorial.main()
