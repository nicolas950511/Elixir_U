defmodule Tienda do
  def main do
    valor_total = "Ingrese el total:"
    |> Util.ingresar(:entero)

    valor_entregado = "Ingrese con cuánto pago:"
    |> Util.ingresar(:entero)

    valor_total
    |> calcular_factura(valor_entregado)
    |> Util.mostrar_mensaje()
  end

  defp calcular_factura(valor_total, valor_entregado) do
    valor_resultado = valor_total - valor_entregado
    "El valor es #{valor_resultado}"
  end
end

Tienda.main()
