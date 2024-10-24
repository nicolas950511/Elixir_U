defmodule Factorial do
  def main do
  "\nIngrese un valor mayor o igual a cero: "
  |> Util.ingresar(:entero)
  |> determinar_termino_fibonacci()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  7

  defp determinar_termino_fibonacci(0), do: 0
  defp determinar_termino_fibonacci(1), do: 1
  defp determinar_termino_fibonacci(n) do
  determinar_termino_fibonacci(n - 1) + determinar_termino_fibonacci(n - 2)
  end
  defp generar_mensaje(termino_fibonacci) do
  "El término de la sucesión de fibonacci es #{termino_fibonacci}"
  end
  end

  Factorial.main()
