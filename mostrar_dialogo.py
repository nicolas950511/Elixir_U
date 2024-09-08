import sys
import tkinter as tk
from tkinter.simpledialog import messagebox

root=tk.Tk()
root.title("python")
root.withdraw()

messagebox.showinfo("Informacion", sys.argv[1])