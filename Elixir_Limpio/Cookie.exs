defmodule Cookie do
  @doc """
  Módulo que genera una clave aleatoria de longitud definida y la muestra en base64.

  ## Constantes:
    - `@longitud_llave`: Longitud de la clave a generar, definida como 128 bytes.
  """
  @longitud_llave 128

  @doc """
  Función principal que genera una clave aleatoria, la codifica en base64 y la muestra.

  ## Retorno:
    - Muestra la clave generada y codificada en base64.
  """
  def main() do
    :crypto.strong_rand_bytes(@longitud_llave)  # Genera una secuencia aleatoria de bytes
    |> Base.encode64()  # Codifica los bytes generados en base64
    |> Util.mostrar_mensaje()  # Muestra el mensaje codificado en base64 utilizando la función mostrar_mensaje de Util
  end
end

# Llama a la función main del módulo Cookie para ejecutar la acción.
Cookie.main()
