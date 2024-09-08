defmodule EntradaDatos do
    @moduledoc """
  Módulo con funciones que se reutilizan. Aclaracion 3
  - autor: Nicolás Ortiz
  - fecha: Junio del 2024
  - licencia: MIT
  """
  def main do
  "Ingrese nombre del empleado: "
  |> Util.ingresar(:texto)
  |> generar_mensaje()
  |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre) do
  "Bienvenidos #{nombre} a la empresa Once Ltda"
  end
end

  EntradaDatos.main()
