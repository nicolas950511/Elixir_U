defmodule UtilV2 do
  @moduledoc """
  Módulo con funciones que se reutilizan.
  - autor: Nicolás Ortiz
  - fecha: Junio del 2024
  - licencia: MIT
  """

  @doc """
  Muestra un mensaje.
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
  Muestra un mensaje usando Python para mostrar un diálogo.
  """
  def mostrar_mensaje_python(mensaje) do
    System.cmd("python", ["mostrar_dialogo.py", mensaje])
  end

  @doc """
  Muestra un mensaje usando Zenity para mostrar un diálogo en sistemas Unix.
  """
  def mostrar_mensaje_zenity(mensaje) do
    System.cmd("zenity", ["--info", "--text=#{mensaje}"])
  end

  @doc """
   Muestra un mensaje usando Zenity para mostrar un diálogo en sistemas Unix. Aclaracion 3
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

 @doc """
   Muestra un mensaje usando Zenity para mostrar un diálogo en sistemas Unix. Aclaracion 4
  """
  def ingresar_python(mensaje, :texto) do
    {entrada, 0} = System.cmd("python", ["ingresar_dialogo.py", mensaje])
    entrada
    |> String.trim()
  end

  @doc """
  Problema 3 version 2 Ingresar un valor entero funciona como polimorfismo en java estando la misma funcion pero con diferente entrada
  """
    def ingresar_problema3(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.to_integer()
    end

      @doc """
       Problema 3 version 3 Ingresar un valor entero funciona como polimorfismo en java estando la misma funcion pero con diferente entrada
      """
    def ingresar_problema3v2(mensaje, :entero) do
      try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
      rescue
      ArgumentError ->
      "Error, se espera que ingrese un número entero\n"
      |> mostrar_error()
      mensaje
      |> ingresar(:entero)
      end
      end


   @doc """
       Problema 3 version 3 muestra el error
   """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
    end

  @doc """
      Ingresa numero real version 1 muestra el error
  """
  def ingresar_real(mensaje, :real) do
      try do
        mensaje
        |> ingresar(:texto)
        |> String.to_float()
      rescue
        ArgumentError ->
          "Error, se espera que ingrese un número real\n"
          |> mostrar_error()

          mensaje
          |> ingresar_real(:real)
      end
    end



end
