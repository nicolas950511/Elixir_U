defmodule Calculadora do
  @moduledoc """
  Módulo que representa una calculadora cliente que solicita la suma de dos números a un servidor remoto.

  ## Funciones:
    - `main/0`: Función principal que obtiene los números de entrada, realiza la suma y muestra el resultado.
    - `obtener_entradas/1`: Convierte los argumentos de entrada a números enteros.
    - `generar_mensaje/3`: Genera el mensaje a mostrar con el resultado de la suma.
    - `sumar/2`: Realiza la llamada remota al servidor para sumar dos números.
  """

  @servicio_remoto :calculadora_servidor@localhost

  @doc """
  Función principal del cliente, que obtiene las entradas, realiza la suma
  de los dos números y muestra el resultado.

  ## Pasos:
    1. Obtiene las entradas desde la línea de comandos.
    2. Realiza la suma de los dos números.
    3. Genera y muestra un mensaje con el resultado de la suma.
  """
  def main() do
    [a, b] = obtener_entradas(System.argv())
    suma = sumar(a, b)
    mensaje = generar_mensaje(a, b, suma)
    Util.mostrar_mensaje(mensaje)
  end

  defp obtener_entradas(entradas) do
    case Enum.map(entradas, &String.to_integer/1) do
      [a, b] -> [a, b]
      _ -> raise "Por favor, introduce dos números como argumentos."
    end
  end

  def generar_mensaje(_, _, {:badrpc, _}) do
    "Hubo un error al invocar el procedimiento remoto"
  end

  def generar_mensaje(a, b, suma) do
    "La suma de #{a} y #{b} es: #{suma}"
  end

  def sumar(a, b) do
    :rpc.call(@servicio_remoto, Calculadora, :sumar, [a, b])
  end
end

Calculadora.main()
