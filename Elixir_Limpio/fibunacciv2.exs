defmodule Fibonacci do
  def main do
  "\nIngrese un valor mayor o igual a cero: "
  |> Util.ingresar(:entero)
  |> determinar_termino_fibonacci()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  11

  defp determinar_termino_fibonacci(0, _, _ ), do: 0
  defp determinar_termino_fibonacci(1, b, _ ), do: b
  defp determinar_termino_fibonacci(n, b, a ) do
  determinar_termino_fibonacci(n-1, b + a, b )
  end

  defp determinar_termino_fibonacci(n) do
  determinar_termino_fibonacci(n, 1 ,0 )
  end

  defp generar_mensaje(termino_fibonacci) do
    "El término de la sucesión de fibonacci es #{termino_fibonacci}"
    end
    end

    Fibonacci.main()
