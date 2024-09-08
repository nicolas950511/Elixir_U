defmodule TiendaCelulares do
  def main do
    valor_producto = "Ingrese el valor del producto:"
    |> Util.ingresar(:entero)

    valor_porcentaje = "Ingrese el porcentaje del descuento:"
    |> Util.ingresar(:real)

    valor_descuento_producto=calcular_descuento(valor_producto, valor_porcentaje)
    valor_final= calcular_valor_final(valor_producto, valor_descuento_producto)

    generar_mensaje(valor_descuento_producto, valor_final)
    |> Util.mostrar_mensaje()
  end

  defp calcular_descuento(valor_producto, valor_porcentaje) do
    valor_producto * valor_porcentaje
  end

  defp calcular_valor_final(valor_producto, valor_descuento_producto) do
    valor_producto-valor_descuento_producto
  end

  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento= valor_descuento |> Float.round(1)
    valor_final= valor_final |> Float.round(1)

    "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}"
  end
end

TiendaCelulares.main()
