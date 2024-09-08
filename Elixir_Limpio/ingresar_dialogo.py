import sys
import tkinter as tk
from tkinter import simpledialog

# Inicializa la ventana
root = tk.Tk()
root.withdraw()  # Oculta la ventana principal

# Pide un string al usuario
entrada = simpledialog.askstring("Entrada", sys.argv[1])

# Devuelve la entrada por stdout
if entrada:
    print(entrada)
