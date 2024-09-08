defmodule ParImpar do
  def main do
  "\nIngrese un valor mayor o igual a cero: "
  |> Util.ingresar(:entero)
  |> determinar_par?()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end
  defp determinar_par?(0), do: true
  defp determinar_par?(1), do: false
  defp determinar_par?(n), do: determinar_par?(n - 2)
  defp generar_mensaje(true), do: "El número ingresado es PAR\n"
  defp generar_mensaje(false), do: "El número ingresado es IMPAR\n"

  # defp generar_mensaje(par?) do
  #   if par? do
  #   "El número ingresado es PAR\n"
  #   else
  #   "El número ingresado es IMPAR\n"
  #   end
  # end

  # defp determinar_par?(n), do: determinar_par?(0, n)
  # defp determinar_par?(m, n) when m * 2 == n, do: true
  # defp determinar_par?(m, n) when m * 2 > n, do: false
  # defp determinar_par?(m, n), do: determinar_par?(m+1, n)

  # defp determinar_par?(0), do: true
  # defp determinar_par?(n), do: determinar_impar?(n-1)
  # defp determinar_impar?(0), do: false
  # defp determinar_impar?(n), do: determinar_par?(n-1)

  # defp determinar_par?(n) when rem(n, 2) == 0, do: true
  # defp determinar_par?(_), do: false

  # defp determinar_par?(n), do: rem(n, 2) == 0 end

  # defp determinar_par?(n) do
  #   if rem(n, 2) == 0 do
  #     true
  #   else
  #     false
  # end

end

ParImpar.main()
