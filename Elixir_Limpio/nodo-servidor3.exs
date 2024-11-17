defmodule NodoServidor3 do
  @moduledoc """
  Módulo que representa el servidor 3 encargado de procesar los mensajes relacionados con
  las funciones. El servidor registra un servicio global y escucha los mensajes que recibe,
  procesándolos y enviando las respuestas correspondientes.

  ## Variables:
    - `@nombre_servicio_global`: Nombre global del servicio de funciones.
  """

  @nombre_servicio_global :servicio_funcion

  @doc """
  Función principal del servidor. Registra el servicio global, espera los mensajes,
  procesa los mensajes y finalmente desregistra el servicio al finalizar.

  ## Flujo:
    - Muestra un mensaje indicando que es el servidor de funciones.
    - Registra el servicio global.
    - Escucha los mensajes y los procesa.
    - Desregistra el servicio cuando se recibe el mensaje `:fin`.
  """
  def main() do
    Util.mostrar_mensaje("SERVIDOR 3 - Servidor de Funciones")
    registrar_servicio(@nombre_servicio_global)
    esperar_mensajes()
    deregistrar_servicio(@nombre_servicio_global)
  end

  @doc """
  Registra el servicio global en el clúster para que otros nodos puedan acceder a él.

  ## Parámetros:
    - `nombre_servicio_global`: Nombre del servicio a registrar en el clúster global.
  """
  defp registrar_servicio(nombre_servicio_global) do
    :global.register_name(nombre_servicio_global, self())
    :global.sync()
  end

  @doc """
  Desregistra el servicio global para que ya no esté disponible en el clúster.

  ## Parámetros:
    - `nombre_servicio_global`: Nombre del servicio a desregistrar.
  """
  defp deregistrar_servicio(nombre_servicio_global) do
    :global.unregister_name(nombre_servicio_global)
  end

  @doc """
  Escucha los mensajes que llegan a este servidor y los procesa. Si el mensaje es `:fin`,
  se desconectará y terminará el proceso. Si el mensaje es una solicitud para aplicar una
  función, lo procesa y responde al productor.

  ## Flujo:
    - Si el mensaje es `:fin`, muestra un mensaje de desconexión y termina.
    - Si el mensaje es una solicitud de ejecución de función, aplica la función al mensaje
      y responde al productor.
  """
  defp esperar_mensajes() do
    receive do
      {_, :fin} ->
        Util.mostrar_mensaje("Desconectando servicio...")
        :ok

      {productor, mensaje} ->
        mensaje
        |> procesar_mensaje()
        |> send_respuesta(productor)

        esperar_mensajes()
    end
  end

  @doc """
  Procesa los mensajes recibidos. Si el mensaje es `:fin`, termina el proceso. Si el mensaje
  es una solicitud para ejecutar una función sobre el mensaje, se evalúa y ejecuta la función.
  Si el mensaje no es reconocido, se devuelve un mensaje de error.

  ## Parámetros:
    - `mensaje`: El mensaje recibido que se va a procesar.

  ## Retorno:
    - `:fin` si el mensaje es `:fin`.
    - El resultado de aplicar la función al mensaje si el mensaje es una solicitud válida de función.
    - Un mensaje de error si el mensaje no es reconocido.
  """
  defp procesar_mensaje(:fin), do: :fin

  defp procesar_mensaje({funcion, msg}) when is_function(funcion, 1), do: funcion.(msg)

  defp procesar_mensaje(mensaje), do: "El mensaje \"#{mensaje}\" es desconocido."

  @doc """
  Envía la respuesta al productor que envió el mensaje.

  ## Parámetros:
    - `respuesta`: La respuesta que se enviará al productor.
    - `productor`: El proceso productor que envió el mensaje.
  """
  defp send_respuesta(respuesta, productor) do
    IO.puts(respuesta)
    send(productor, respuesta)
  end
end

NodoServidor3.main()
