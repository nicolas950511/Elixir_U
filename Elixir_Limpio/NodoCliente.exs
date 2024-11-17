defmodule NodoCliente do
  @doc """
  Módulo que se encarga de registrar un servicio local, verificar la conexión con un nodo remoto,
  y producir mensajes que serán enviados a dicho nodo.

  ## Constantes:
    - `@nombre_servicio_local`: Nombre del servicio local que se va a registrar.
    - `@servicio_local`: Tupla que contiene el nombre y la dirección del servicio local.
    - `@nodo_remoto`: Dirección del nodo remoto con el que se intenta conectar.
    - `@servicio_remoto`: Tupla que contiene el nombre y la dirección del servicio remoto.
  """
  @nombre_servicio_local :nodo_cliente
  @servicio_local {@nombre_servicio_local, :"nodocliente@localhost"}

  @nodo_remoto :"nodoservidor@localhost"
  @servicio_remoto {:nodo_servidor, @nodo_remoto}

  @doc """
  Función principal que ejecuta el flujo principal del proceso:
  - Muestra un mensaje indicando que es el proceso principal.
  - Registra el servicio local.
  - Verifica la conexión con el nodo remoto y, si la conexión es exitosa, activa el productor.
  """
  def main() do
    Util.mostrar_mensaje("PROCESO PRINCIPAL")

    @nombre_servicio_local
    |> registrar_servicio()

    @nodo_remoto
    |> verificar_conexion()
    |> activar_productor()
  end

  @doc """
  Registra el servicio local utilizando el nombre proporcionado.

  ## Parámetros:
    - `nombre_servicio_local`: Nombre del servicio local que se quiere registrar.
  """
  defp registrar_servicio(nombre_servicio_local),
    do: Process.register(self(), nombre_servicio_local)

  @doc """
  Verifica la conexión con el nodo remoto.

  ## Parámetros:
    - `nodo_remoto`: Dirección del nodo remoto al que se intentará conectar.

  ## Retorno:
    - Retorna `true` si la conexión es exitosa, `false` en caso contrario.
  """
  defp verificar_conexion(nodo_remoto),
    do: Node.connect(nodo_remoto)

  @doc """
  Activa el productor en caso de que la conexión con el nodo remoto sea exitosa.
  Si la conexión falla, muestra un error.

  ## Parámetros:
    - `true`: Se llama para iniciar la producción de elementos y recibir respuestas.
    - `false`: Muestra un mensaje de error indicando que no se pudo conectar con el nodo servidor.
  """
  defp activar_productor(true) do
    producir_elementos()
    recibir_respuestas()
  end

  defp activar_productor(false),
    do: Util.mostrar_error("No se pudo conectar con el nodo servidor")

  @doc """
  Produce los mensajes que serán enviados al nodo remoto.

  El módulo genera una lista de mensajes que son enviados utilizando la función `enviar_mensaje/1`.
  Los mensajes incluyen operaciones como convertir texto a mayúsculas, minúsculas,
  realizar una reversa en una cadena y el mensaje de fin para indicar el término del proceso.
  """
  defp producir_elementos() do
    mensajes = [
      {:mayusculas, "Juan"},
      {:mayusculas, "Ana"},
      {:minusculas, "Diana"},
      {&String.reverse/1, "Julián"},
      "Uniquindio",
      :fin
    ]

    Enum.each(mensajes, &enviar_mensaje(&1))
  end

  @doc """
  Envía un mensaje al servicio remoto.

  ## Parámetros:
    - `mensaje`: El mensaje que se va a enviar al servicio remoto.
  """
  defp enviar_mensaje(mensaje),
    do: send(@servicio_remoto, {@servicio_local, mensaje})

  @doc """
  Recibe las respuestas del nodo remoto.

  El proceso entra en un bucle donde espera respuestas. Cuando recibe el mensaje `:fin`, termina el proceso.
  Si recibe cualquier otro mensaje, muestra el mensaje recibido y sigue esperando más respuestas.
  """
  defp recibir_respuestas() do
    receive do
      :fin -> :ok

      respuesta ->
        Util.mostrar_mensaje("\t -> \"#{respuesta}\"")
        recibir_respuestas()
    end
  end
end

# Ejecuta el flujo principal del módulo
NodoCliente.main()
