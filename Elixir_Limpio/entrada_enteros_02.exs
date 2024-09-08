defmodule EntradaEnteros do
      @moduledoc """
Módulo con funciones que se reutilizan. Problema 3 version 2
- autor: Nicolás Ortiz
- fecha: Junio del 2024
- licencia: MIT
"""
  def main do
  valor_total = "Ingrese valor total de la factura: "
  |> Util.ingresar_problema3(:entero)
  valor_entregado = "Ingrese valor entregado para el pago: "
  |> Util.ingresar_problema3(:entero)
  calcular_devuelta(valor_entregado, valor_total)
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end
  defp calcular_devuelta(valor_pago, valor_total) do
    valor_pago - valor_total
    end

    defp generar_mensaje(devuelta) do
    "El valor de devuelta es $ #{devuelta}"
    end
    end

    EntradaEnteros.main()
