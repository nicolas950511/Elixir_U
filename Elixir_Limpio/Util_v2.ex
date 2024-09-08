defmodule Util do
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
  Solicita un texto y lo convierte a entero.
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc """
  Solicita un número entero y maneja errores.
  """
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()
        ingresar(mensaje, :entero)  # Llamada recursiva correcta
    end
  end

  @doc """
  Solicita un número real y maneja errores.
  """
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número real\n"
        |> mostrar_error()
        ingresar(mensaje, :real)  # Llamada recursiva correcta
    end
  end

  def calcular_permitaciones_circulares(n) do
  (n - 1)
  |> calcular_factorial()
  end
  def calcular_factorial(0), do: 1
  def calcular_factorial(m), do: m * calcular_factorial(m - 1)

  @doc """
  Muestra un mensaje de error.
  """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
