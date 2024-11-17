defmodule IPCLocal do
  @doc """
  Función principal que coordina la ejecución de los procesos y gestiona el servicio de comunicación.

  ## Retorno:
    - Inicia el proceso principal, crea un servicio, produce elementos y luego recibe respuestas.
  """
  def main() do
    Util.mostrar_mensaje("PROCESO PRINCIPAL")

    crear_servicio()
    |> producir_elementos()

    recibir_respuestas()
  end

  @doc """
  Produce y envía mensajes a un servicio determinado.

  ## Parámetros:
    - `servicio`: El proceso donde se enviarán los mensajes (proceso del servicio).

  ## Retorno:
    - Envía diversos mensajes al servicio para ser procesados.
  """
  def producir_elementos(servicio) do
    {:mayusculas, "Juan"} |> enviar_mensaje(servicio)
    {:mayusculas, "Ana"} |> enviar_mensaje(servicio)
    {:minusculas, "Diana"} |> enviar_mensaje(servicio)
    {&String.reverse/1, "Julián"} |> enviar_mensaje(servicio)

    "Uniquindio" |> enviar_mensaje(servicio)

    :fin |> enviar_mensaje(servicio)
  end

  @doc """
  Crea un servicio en un proceso separado que estará escuchando mensajes.

  ## Retorno:
    - Un proceso `pid` que representa el servicio creado.
  """
  defp crear_servicio() do
    spawn(IPCLocal, :activar_servicio, [])
  end

  @doc """
  Envía un mensaje al servicio especificado.

  ## Parámetros:
    - `mensaje`: El mensaje a enviar, puede ser una tupla o un mensaje simple.
    - `servicio`: El proceso del servicio al que se enviará el mensaje.

  ## Retorno:
    - Envía el mensaje al servicio.
  """
  defp enviar_mensaje(mensaje, servicio) do
    send(servicio, {self(), mensaje})
  end

  @doc """
  Activa el servicio para recibir y procesar los mensajes.

  Este proceso está en espera de mensajes, los procesa de acuerdo con el tipo y responde
  al productor. Luego vuelve a esperar más mensajes.

  ## Retorno:
    - No retorna, se mantiene en un bucle esperando y procesando mensajes.
  """
  def activar_servicio() do
    receive do
      {productor, :fin} ->  # Recibe el mensaje de fin
        send(productor, :fin)  # Responde con :fin
      {productor, {:mayusculas, mensaje}} ->  # Recibe mensaje para convertir a mayúsculas
        send(productor, String.upcase(mensaje))
        activar_servicio()  # Llama recursivamente para seguir esperando mensajes

      {productor, {:minusculas, mensaje}} ->  # Recibe mensaje para convertir a minúsculas
        send(productor, String.downcase(mensaje))
        activar_servicio()

      {productor, {funcion, mensaje}} ->  # Recibe una función para aplicar sobre el mensaje
        send(productor, funcion.(mensaje))
        activar_servicio()

      {productor, mensaje} ->  # Si el mensaje no es reconocido
        send(productor, "El mensaje \"#{mensaje}\" es desconocido.")
        activar_servicio()
    end
  end

  @doc """
  Recibe las respuestas del servicio y las muestra en pantalla.

  Esta función espera mensajes y los imprime. Si el mensaje es `:fin`, termina.

  ## Retorno:
    - No retorna, se mantiene esperando respuestas hasta que reciba `:fin`.
  """
  def recibir_respuestas() do
    receive do
      :fin ->  # Si recibe :fin, termina
        :ok

      mensaje ->  # Si recibe un mensaje, lo muestra
        Util.mostrar_mensaje("\t -> \"#{mensaje}\"")
        recibir_respuestas()  # Llama recursivamente para seguir esperando mensajes
    end
  end
end

IPCLocal.main()  # Llama a la función principal
