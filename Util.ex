defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Nicolas Ortiz
  - fecha: Agosto del 2024
  - licencia: GNU GPL v3
  """
  def mostrar_mensaje_antiguo(mensaje) do
    System.cmd("python", ["mostrar_dialogo.py", mensaje])
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |>IO.gets()
      |> String.trim()
      |> String.to_integer()
    rescue
      ArgumentError ->
        IO.puts("Error, se espera que ingrese un número entero")
        ingresar(mensaje, :entero)
    end
  end

  def ingresar(mensaje, :real) do
    try do
      mensaje
      |>IO.gets()
      |> String.trim()
      |> String.to_float()
    rescue
      ArgumentError ->
        IO.puts("Error, se espera que ingrese un número real")
        ingresar(mensaje, :real)
    end
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end
