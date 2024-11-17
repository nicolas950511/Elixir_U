defmodule NodoCliente do
  @moduledoc """
  Módulo que representa el cliente en un sistema distribuido. Se conecta a varios nodos,
  envía mensajes a diferentes servicios, y espera recibir respuestas de los mismos.

  ## Variables:
    - `@servicio_mayusculas`: Nombre del servicio que maneja las conversiones a mayúsculas.
    - `@servicio_minusculas`: Nombre del servicio que maneja las conversiones a minúsculas.
    - `@servicio_funcion`: Nombre del servicio que aplica una función personalizada al mensaje.
    - `@cluster`: Lista de nodos a los que el cliente intentará conectarse.
  """
  @servicio_mayusculas :servicio_mayusculas
  @servicio_minusculas :servicio_minusculas
  @servicio_funcion :servicio_funcion
  @cluster [:nodoservidor1@localhost, :nodoservidor2@localhost, :nodoservidor3@localhost]

  @doc """
  Función principal que inicia el flujo del cliente:
  - Muestra un mensaje indicando que es el proceso cliente.
  - Se conecta a los nodos del clúster.
  - Envía una serie de mensajes a los servicios correspondientes.
  - Espera recibir las respuestas de los servicios.
  """
  def main() do
    Util.mostrar_mensaje("PROCESO PRINCIPAL - Cliente")
    conectar_nodos(@cluster)
    enviar_mensajes()
    esperar_respuestas(0)
  end

  @doc """
  Conecta el cliente a cada nodo en el clúster proporcionado.

  ## Parámetros:
    - `cluster`: Lista de nodos a los que el cliente intentará conectarse.
  """
  defp conectar_nodos(cluster) do
    Enum.each(cluster, &Node.connect/1)
    :global.sync()
  end

  @doc """
  Obtiene el servicio registrado por nombre en el clúster global.

  ## Parámetros:
    - `nombre_servicio`: Nombre del servicio a buscar.

  ## Retorno:
    - `pid` del servicio encontrado, o `:undefined` si no se encuentra el servicio.
  """
  defp obtener_servicio(nombre_servicio), do: :global.whereis_name(nombre_servicio)

  @doc """
  Envía una serie de mensajes a los servicios correspondientes. Cada mensaje tiene un servicio
  asociado a él. Luego de enviar los mensajes, finaliza los servicios.

  ## Flujo:
    - Los mensajes se estructuran en una lista, cada uno acompañado del servicio al que deben ser enviados.
    - Después de enviar los mensajes, se llama a `finalizar_servicios()` para finalizar la comunicación.
  """
  defp enviar_mensajes() do
    mensajes = [
      {{:mayusculas, "Juan"}, @servicio_mayusculas},
      {{:mayusculas, "Ana"}, @servicio_mayusculas},
      {{:minusculas, "Diana"}, @servicio_minusculas},
      {{&String.reverse/1, "Julián"}, @servicio_funcion},
      {"Uniquindio", @servicio_minusculas}
    ]

    Enum.each(mensajes, fn {mensaje, servicio} -> enviar_mensaje(mensaje, servicio) end)
    finalizar_servicios()
  end

  @doc """
  Envía un mensaje a un servicio específico. Si el servicio no está disponible, muestra un error.

  ## Parámetros:
    - `mensaje`: El mensaje que se va a enviar al servicio.
    - `servicio`: El servicio al cual se enviará el mensaje.
  """
  defp enviar_mensaje(mensaje, servicio) do
    case obtener_servicio(servicio) do
      :undefined ->
        IO.puts("No se encontró el servicio #{servicio}.")

      pid ->
        send(pid, {self(), mensaje})
    end
  end

  @doc """
  Envía un mensaje de finalización a cada servicio una vez que todos los mensajes han sido enviados.

  Los servicios recibirán el mensaje `:fin` para indicar que la interacción ha finalizado.

  ## Flujo:
    - Se envía un mensaje de finalización a cada servicio (`@servicio_mayusculas`,
      `@servicio_minusculas`, `@servicio_funcion`).
  """
  defp finalizar_servicios() do
    [:fin, :fin, :fin]
    |> Enum.zip([@servicio_mayusculas, @servicio_minusculas, @servicio_funcion])
    |> Enum.each(fn {fin, servicio} -> enviar_mensaje(fin, servicio) end)
  end

  @doc """
  Espera recibir respuestas de los servicios. Cada respuesta será mostrada en consola.

  La función recursiva espera hasta que reciba tres respuestas o más (de acuerdo con el valor de `i`).

  ## Parámetros:
    - `i`: Contador que indica cuántas respuestas se han recibido. El proceso terminará
      cuando se reciban 3 respuestas.
  """
  defp esperar_respuestas(3), do: :ok

  defp esperar_respuestas(i) do
    receive do
      :fin ->
        esperar_respuestas(i + 1)

      respuesta ->
        Util.mostrar_mensaje("\t -> \"#{respuesta}\"")
        esperar_respuestas(i)
    end
  end
end

NodoCliente.main()
