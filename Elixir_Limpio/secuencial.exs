defmodule Proceso do
  @cantidad_procesos_internos 5

  @doc """
  Función principal que mide el tiempo de ejecución de la simulación.

  ## Retorno:
    - Muestra un mensaje con el tiempo de ejecución de la simulación en microsegundos.
  """
  def main do
    Benchmark.determinar_tiempo_ejecucion({Proceso, :simulacion, [@cantidad_procesos_internos]})
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  @doc """
  Simula la ejecución de un conjunto de procesos con tiempos de demora predefinidos.

  ## Parámetros:
    - `cantidad_procesos_internos`: Número de procesos internos a simular (entero).

  ## Retorno:
    - Ejecuta el proceso para cada conjunto de datos de prueba con los tiempos de demora definidos.
  """
  def simulacion(cantidad_procesos_internos) do
    datos_prueba = [{"A", 2500}, {"\tB", 1500}, {"\t\tC", 500}, {"\t\t\tD", 3500}]

    Enum.each(datos_prueba, fn valor ->
      simulando_proceso(valor, cantidad_procesos_internos)
    end)
  end

  @doc """
  Simula un solo proceso con el mensaje y la demora proporcionada, ejecutando múltiples hilos.

  ## Parámetros:
    - `mensaje`: Un string que representa el nombre del proceso (cadena de texto).
    - `demora`: El tiempo de demora en milisegundos (entero).
    - `cantidad_procesos_internos`: Número de procesos internos que se ejecutan simultáneamente (entero).

  ## Retorno:
    - Muestra en la consola el inicio y fin de cada proceso, junto con el progreso de los procesos internos.
  """
  def simulando_proceso({mensaje, demora}, cantidad_procesos_internos) do
    IO.puts("#{mensaje} -> (Inicia)")

    Enum.each(1..cantidad_procesos_internos, fn i ->
      :timer.sleep(demora)
      IO.puts("\t#{mensaje}-#{i}")
    end)

    IO.puts("#{mensaje} -> (Finalizada)")
  end

  @doc """
  Genera un mensaje con el tiempo de ejecución de la simulación.

  ## Parámetros:
    - `tiempo`: Tiempo de ejecución en microsegundos (entero).

  ## Retorno:
    - Un string con el mensaje indicando el tiempo de ejecución.
  """
  def generar_mensaje(tiempo), do: "\nEl tiempo de ejecución es de #{tiempo} microsegundos."
end

Proceso.main()
