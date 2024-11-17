defmodule ClienteA do
  @moduledoc """
  Módulo para manejar información de clientes, incluyendo la creación, ingreso de datos
  y generación de listas de clientes.
  """

  defstruct nombre: "", edad: 0, altura: 0.0

  @doc """
  Crea un nuevo cliente utilizando los datos proporcionados.

  ## Parámetros:
    - `nombre`: Nombre del cliente (cadena de texto).
    - `edad`: Edad del cliente (entero).
    - `altura`: Altura del cliente (flotante).

  ## Retorno:
    - Una estructura `%ClienteA{}` con los datos ingresados.
  """
  def crear(nombre, edad, altura) do
    %ClienteA{nombre: nombre, edad: edad, altura: altura}
  end

  @doc """
  Solicita información al usuario para crear un cliente y la retorna como estructura.
  """
  def ingresar(mensaje) do
    mensaje
    |> Util.mostrar_mensaje()  # Muestra el mensaje inicial al usuario.

    nombre = "Ingrese nombre: "
    |> Util.ingresar(:texto)  # Solicita el nombre del cliente.

    edad = "Ingrese edad: "
    |> Util.ingresar(:entero)  # Solicita la edad del cliente.

    altura = "Ingrese la altura: "
    |> Util.ingresar(:real)  # Solicita la altura del cliente.

    crear(nombre, edad, altura)  # Crea la estructura del cliente.
  end

  @doc """
  Inicia el proceso para ingresar una lista de clientes.

  ## Parámetros:
    - `mensaje`: Mensaje inicial para el ingreso.
    - `:clientes`: Etiqueta para identificar el tipo de ingreso.

  ## Retorno:
    - Lista de estructuras `%ClienteA{}`.
  """
  def ingresar(mensaje, :clientes) do
    mensaje
    |> ingresar([], :clientes)  # Llama a la función auxiliar con una lista vacía.
  end

  # No usar @doc aquí, ya que es una función privada.
  defp ingresar(mensaje, lista, :clientes) do
    cliente =
      mensaje
      |> ingresar()  # Solicita datos para un nuevo cliente.

    nueva_lista = lista ++ [cliente]  # Agrega el nuevo cliente a la lista.

    mas_clientes =
      "\nIngresar más clientes (s/n): "
      |> Util.ingresar(:boolean)  # Pregunta si se desean ingresar más clientes.

    case mas_clientes do
      true ->
        mensaje
        |> ingresar(nueva_lista, :clientes)  # Llama de nuevo con la lista actualizada.

      false ->
        nueva_lista  # Retorna la lista final.
    end
  end

  def escribir_csv(clientes, nombre) do
    clientes
    |> Enum.map(&convertir_cliente_linea_csv/1)
    |> (&(["nombre,edad,altura"] ++ &1)).() # adiciona los títulos
    |> Enum.join("\n")
    |> File.write(nombre)
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}"
  end
end
