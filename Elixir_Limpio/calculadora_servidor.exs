defmodule Calculadora do
  @moduledoc """
  Módulo que representa un servidor de calculadora simple.
  Este módulo se encarga de esperar una señal y luego realizar operaciones matemáticas.

  ## Funciones:
    - `main/0`: Inicia el servidor y espera mensajes.
    - `esperar/0`: Escucha los mensajes entrantes y se detiene cuando recibe uno.
    - `sumar/2`: Realiza la suma de dos números.
  """

  @doc """
  Función principal que inicia el servidor de la calculadora.
  Muestra un mensaje indicando que el servidor ha comenzado a funcionar y luego espera mensajes.
  """
  def main() do
    Util.mostrar_mensaje("INICIÓ EL SERVIDOR")
    :global.register_name(:calculadora_servidor, self())
    esperar()
  end

  defp esperar() do
    receive do
      _ -> :ok
    end
  end

  def sumar(a, b) do
    a + b
  end
end

Calculadora.main()
