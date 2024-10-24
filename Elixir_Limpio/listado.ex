defmodule Listado do
  def main do
    valor_inicial =
      "\nIngrese un valor inicial: "
      |> Util.ingresar(:entero)

    valor_final =
      "\nIngrese un valor final: "
      |> Util.ingresar(:entero)

    valor_inicial
    |> generar_listado(valor_final)
    |> Util.mostrar_mensaje()
  end

  defp generar_listado(valor_inicial, valor_final)
    when valor_inicial > valor_final,
    do: ""

  defp generar_listado(valor_inicial, valor_final) do
    linea =
      valor_inicial
      |> (fn posicion -> "#{posicion}.______________________\n" end).()

    linea <> generar_listado(valor_inicial + 1, valor_final)
  end

end
Listado.main()
