defmodule NodoServidor do
  @doc """
  Módulo que representa el nodo servidor. Su función principal es registrar el servicio y
  procesar los mensajes recibidos de un cliente.

  ## Constantes:
    - `@nombre_servicio_local`: Nombre del servicio local para registrar el proceso en el sistema.
  """
  @nombre_servicio_local :nodo_servidor

  @doc """
  Función principal que ejecuta el flujo principal del proceso:
  - Muestra un mensaje indicando que es el proceso secundario.
  - Registra el servicio local.
  - Activa el servicio para recibir y procesar mensajes.
  """
  def main() do
    Util.mostrar_mensaje("PROCESO SECUNDARIO")

    @nombre_servicio_local
    |> registrar_servicio()

    activar_servicio()
  end

  @doc """
  Registra el servicio local utilizando el nombre proporcionado.

  ## Parámetros:
    - `nombre_servicio_local`: El nombre del servicio local que se va a registrar en el sistema.
  """
  defp registrar_servicio(nombre_servicio_local), do: Process.register(self(), nombre_servicio_local)

  @doc """
  Mantiene el proceso activo esperando mensajes entrantes. Al recibir un mensaje, lo procesa
  y envía una respuesta al productor (cliente).

  ## Flujo:
    - Espera recibir mensajes con la estructura {productor, mensaje}.
    - Procesa el mensaje recibido.
    - Envía una respuesta al productor y continúa esperando más mensajes.
  """
  defp activar_servicio() do
    receive do
      {productor, mensaje} ->
        respuesta = procesar_mensaje(mensaje)
        send(productor, respuesta)
        activar_servicio()
    end
  end

  @doc """
  Procesa el mensaje recibido, dependiendo de su tipo.

  ## Casos:
    - `:fin`: Termina la ejecución y devuelve `:fin`.
    - `{:mayusculas, msg}`: Convierte el mensaje a mayúsculas.
    - `{:minusculas, msg}`: Convierte el mensaje a minúsculas.
    - `{funcion, msg}`: Aplica la función proporcionada al mensaje.
    - Otros mensajes: Responde indicando que el mensaje es desconocido.

  ## Parámetros:
    - `mensaje`: El mensaje que se desea procesar, que puede ser de diversos tipos según el caso.

  ## Retorno:
    - La respuesta correspondiente al mensaje procesado.
  """
  defp procesar_mensaje(:fin), do: :fin

  defp procesar_mensaje({:mayusculas, msg}), do: String.upcase(msg)

  defp procesar_mensaje({:minusculas, msg}), do: String.downcase(msg)

  @doc """
  Aplica una función al mensaje. Solo se permite que la función sea de aridad 1.

  ## Parámetros:
    - `funcion`: La función que se desea aplicar al mensaje.
    - `msg`: El mensaje al cual se aplicará la función.

  ## Retorno:
    - El resultado de aplicar la función al mensaje.
  """
  defp procesar_mensaje({funcion, msg}) when is_function(funcion, 1), do: funcion.(msg)

  @doc """
  Responde con un mensaje indicando que el mensaje recibido es desconocido si no coincide con
  ninguno de los casos previos.

  ## Parámetros:
    - `mensaje`: El mensaje recibido, el cual no es reconocido.

  ## Retorno:
    - Un mensaje que indica que el mensaje recibido es desconocido.
  """
  defp procesar_mensaje(mensaje), do: "El mensaje \"#{mensaje}\" es desconocido."

end

# Se ejecuta la función principal del módulo
NodoServidor.main()
