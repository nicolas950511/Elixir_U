defmodule Cliente do

  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do
    mensaje
    |> Util.mostrar_mensaje()

    nombre =
      "Ingrese un nombre: "
      |> Util.ingresar(:texto)

    edad =
      "Ingresar edad: "
      |> Util.ingresar(:entero)

    altura =
      "Ingrese la altura: "
      |> Util.ingresar(:real)

    crear(nombre, edad, altura)
  end
end
