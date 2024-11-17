defmodule Proceso do
  @cantidad_procesos_internos 5

  # Función principal que inicia el proceso de simulación y mide el tiempo de ejecución
  def main do
    # Llama a la función 'Benchmark.determinar_tiempo_ejecucion' con la función de simulación
    Benchmark.determinar_tiempo_ejecucion({Proceso, :simulacion, [@cantidad_procesos_internos]})
    |> generar_mensaje()   # Genera un mensaje con el tiempo de ejecución obtenido
    |> Util.mostrar_mensaje()  # Muestra el mensaje en la consola
  end

  # Función de simulación que ejecuta un proceso concurrente para cada dato de prueba
  def simulacion (cantidad_procesos_internos) do
      datos_prueba = [{"A", 2500}, {"\tB", 1500}, {"\t\tC", 500}, {"\t\t\tp", 3500}]

     tarea =
      Enum.map(datos_prueba, fn valor ->
       Task.async(fn -> simulando_proceso(valor, cantidad_procesos_internos) end)
      end)
      # Si se omite el último valor, por defecto es 5000 milisegundos Enum. each(tarea, &Task. await (&1, 100_000))
      Enum.each(tarea, &Task.await(&1, 100_000))
  end

  # Función que simula un proceso, recibe un mensaje, una demora y una cantidad de procesos internos
  def simulando_proceso({mensaje, demora}, cantidad_procesos_internos) do
    IO.puts("#{mensaje} -> (Inicia)")

    # Simula procesos internos con el mismo mensaje y una demora dada
    Enum.each(1..cantidad_procesos_internos, fn i ->
      :timer.sleep(demora)  # Pausa el proceso por el tiempo especificado (en milisegundos)
      IO.puts("\t#{mensaje}-#{i}")  # Imprime el mensaje con el número de iteración
    end)

    IO.puts("#{mensaje} -> (Finalizada)")
  end

  # Genera un mensaje con el tiempo de ejecución
  def generar_mensaje(tiempo), do: "\nEl tiempo de ejecución es de #{tiempo} microsegundos."
end
Proceso.main()
