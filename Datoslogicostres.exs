defmodule Datoslogicostres do

  def main do
  "Ingrese el tipo de bolsa del cliente: "
  |> Util.ingresar(:texto)
  |> obtener_porcentaje_descuento()
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  defp obtener_porcentaje_descuento(tipo_bolsa) do
    if tipo_bolsa == "Plastica" do
      0.0
      else if tipo_bolsa == "Biodegradable" do
        0.10
        else if tipo_bolsa == "reutilizable" do
          0.14
          else
            0.17
          end
        end
      end
  end

  def generar_mensaje(porcentaje) do
    "El porcentaje es de #{porcentaje}"
  end

  defp obtener_porcentaje_descuento(tipo_bolsa) do
    cond do
    tipo_bolsa == "plastica" -> 0.02
    tipo_bolsa == "biodegradable" -> 0.12
    tipo_bolsa == "reutilizable" -> 0.17
    true -> 0.0
    end
  end

  defp obtener_porcentaje_descuento(tipo_bolsa) do
    case tipo_bolsa do
    "plastica" -> 0.02
    "biodegradable" -> 0.12
    "reutilizable" -> 0.17
    _ -> 0.0
    end
  end

  defp obtener_porcentaje_descuento(tipo) when tipo == "plastica", do: 0.02
  defp obtener_porcentaje_descuento(tipo) when tipo == "biodegradable", do: 0.12
  defp obtener_porcentaje_descuento(tipo) when tipo == "reutilizable", do: 0.17

  defp obtener_porcentaje_descuento(_), do: 0.0
  defp obtener_porcentaje_descuento("plastica"), do: 0.02
  defp obtener_porcentaje_descuento("biodegradable"), do: 0.12
  defp obtener_porcentaje_descuento("reutilizable"), do: 0.17
  defp obtener_porcentaje_descuento(_), do: 0.0

end

Datoslogicostres.main()
