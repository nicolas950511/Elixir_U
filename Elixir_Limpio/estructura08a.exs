# Asegúrate de compilar el módulo ClienteA antes de ejecutar este script
Code.require_file("cliente_a.ex")

defmodule Estructuras do
  @moduledoc """
  Módulo para crear y manejar listas de estructuras de clientes y generar archivos CSV.

  ## Funcionalidades:
  - Crear una lista de clientes.
  - Guardar la lista en un archivo CSV.

  Autor: Nicolás Ortiz
  Fecha: Junio del 2024
  Licencia: MIT
  """

  def main do
    # Llama a la función que crea una lista de clientes y escribe esa lista en un archivo CSV.
    crear_lista_clientes()
    |> ClienteA.escribir_csv("clientes.csv")
  end

  @doc """
  Crea una lista predefinida de estructuras de clientes.

  ## Retorno:
  - Una lista de estructuras `%ClienteA{}` con los datos de varios clientes.
  """
  defp crear_lista_clientes do
    [
      ClienteA.crear("Ana", 16, 1.70),   # Crea un cliente llamado Ana.
      ClienteA.crear("Juan", 20, 1.72),  # Crea un cliente llamado Juan.
      ClienteA.crear("Diana", 48, 1.71), # Crea un cliente llamado Diana.
      ClienteA.crear("Julian", 51, 1.73),# Crea un cliente llamado Julian.
      ClienteA.crear("Isbella", 6, 1.00),# Crea un cliente llamado Isbella.
      ClienteA.crear("Sara", 8, 1.30)    # Crea un cliente llamado Sara.
    ]
  end
end

# Llama a la función principal para ejecutar el flujo del programa.
Estructuras.main()
