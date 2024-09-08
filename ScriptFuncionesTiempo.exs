defmodule ScriptFuncionesTiempo do
  def main() do
    valor = 200_000

    algoritmo1 = {ScriptFuncionesTiempo, :determinar_par1?, [valor]}
    algoritmo2 = {ScriptFuncionesTiempo, :determinar_par2?, [valor]}
    algoritmo3 = {ScriptFuncionesTiempo, :determinar_par3?, [valor]}
    algoritmo4 = {ScriptFuncionesTiempo, :determinar_par4?, [valor]}

    duracion1 = DeterminarTiempoEjecucion.determinar_tiempo_ejecucion(algoritmo1)
    duracion2 = DeterminarTiempoEjecucion.determinar_tiempo_ejecucion(algoritmo2)
    duracion3 = DeterminarTiempoEjecucion.determinar_tiempo_ejecucion(algoritmo3)
    duracion4 = DeterminarTiempoEjecucion.determinar_tiempo_ejecucion(algoritmo4)

    DeterminarTiempoEjecucion.generar_mensaje(duracion1, duracion2, duracion3, duracion4)
    |> Util.mostrar_mensaje()
  end

  # Version 1 - Cambiamos de defp a def
  def determinar_par1?(0), do: true
  def determinar_par1?(1), do: false
  def determinar_par1?(n), do: determinar_par1?(n - 2)

  # Version 2 - Cambiamos de defp a def
  def determinar_par2?(n), do: determinar_par2?(0, n)

  def determinar_par2?(m, n) when m * 2 == n, do: true
  def determinar_par2?(m, n) when m * 2 > n, do: false
  def determinar_par2?(m, n), do: determinar_par2?(m + 1, n)

  # Version 3 - Cambiamos de defp a def
  def determinar_par3?(0), do: true
  def determinar_par3?(n), do: determinar_impar3?(n - 1)

  def determinar_impar3?(0), do: false
  def determinar_impar3?(n), do: determinar_par3?(n - 1)

  # Version 5 - Cambiamos de defp a def
  def determinar_par4?(n) when rem(n, 2) == 0, do: true
  def determinar_par4?(_), do: false
end

ScriptFuncionesTiempo.main()
