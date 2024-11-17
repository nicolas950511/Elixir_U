defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(texto) do
    Util.mostrar_mensaje(texto)

    nombre = Util.ingresar("Ingrese nombre: ", :texto)
    edad = Util.ingresar("Ingrese edad: ", :entero)
    altura = Util.ingresar("Ingrese altura: ", :real)


    crear(nombre, edad, altura)
  end

  def ingresar(mensaje, :clientes) do
    mensaje
    |> ingresar([], :clientes)
  end

  defp ingresar(mensaje, lista, :clientes) do

    cliente=
      mensaje
      |> ingresar()

      nueva_lista = lista ++ [cliente]

      mas_clientes =
        "\nIngresar más clientes (s/n): "
        |> Util.ingresar(:boolean)

      case mas_clientes do
        true ->
          mensaje
          |> ingresar(nueva_lista, :clientes)
        false -> nueva_lista
      end
  end

  def generar_mensaje_clientes(lista_clientes, parse) do
    lista_clientes
    |>Enum.map(parse)
    |>Enum.join()
  end
end
