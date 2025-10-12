import numpy as np
import matplotlib.pyplot as plt
import math
import cmath

# --- Color palettes ---
palette_4bit = ["#000000", "#FFFFFF", "#808080", "#704214"]
palette_8bit = ["#000000", "#FF0000", "#FFA500", "#00FF00", "#0000FF", "#4B0082", "#8A2BE2", "#FFFFFF"]
palette_12bit = ["#000000", "#704214", "#FF0000", "#FFA500", "#FFFF00", "#00FF00",
                 "#00FFFF", "#0000FF", "#4B0082", "#8A2BE2", "#FFC0CB", "#FFFFFF"]
palette_16bit = ["#00000000", "#010101", "#704214", "#DC143C", "#FF0000", "#FFA500",
                 "#FFD700", "#FFFF00", "#00FF00", "#00FFFF", "#0000FF", "#4B0082",
                 "#8A2BE2", "#FFC0CB", "#FFFFFF", "#808080"]

# --- Core algorithm ---
def generate_colors(palette, n):
    colors = []
    for i in range(n):
        r = i / n
        z = cmath.exp(2j * math.pi * r)  # cos(2πr) + i sin(2πr)
        index = int((z.real + 1)/2 * (len(palette)-1))
        colors.append(palette[index])
    return colors

# --- Plotting ---
def plot_circular_palette(colors):
    n = len(colors)
    theta = np.linspace(0, 2 * np.pi, n, endpoint=False)
    
    fig, ax = plt.subplots(figsize=(6,6), subplot_kw=dict(polar=True))
    
    for angle, color in zip(theta, colors):
        ax.bar(angle, 1, width=2*np.pi/n, color=color, edgecolor='k', linewidth=0.5)
    
    ax.set_yticklabels([])
    ax.set_xticklabels([])
    ax.set_ylim(0, 1)
    ax.set_frame_on(False)
    plt.show()

# --- Example usage ---
num_doraz = 16
palette = generate_colors(palette_16bit, num_doraz)  # use whichever palette you want
plot_circular_palette(palette)
