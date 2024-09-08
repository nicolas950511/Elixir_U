
defmodule DeterminarTiempoEjecucion do

  def calcular_speedup(t1, t2, t3, t4), do:  t1/t2/t3/t4

  def determinar_tiempo_ejecucion({modulo, funcion, argumentos}) do
    tiempo_inicial= System.monotonic_time()
    apply(modulo, funcion, argumentos)
    tiempo_final= System.monotonic_time()

    duracion= System.convert_time_unit(
      tiempo_final-tiempo_inicial,
      :native, :microsecond)
    duracion
  end

  def generar_mensaje(tiempo1, tiempo2, tiempo3, tiempo4) do
    speedup= calcular_speedup(tiempo1, tiempo2, tiempo3, tiempo4) |> Float.round(2)

    "Tiempos: #{tiempo1} y  #{tiempo2} y #{tiempo3} y  #{tiempo4} microsegundos, "<>
    "el primer algoritmo es #{speedup} veces mas rapido que el segundo"
  end

end
