import hashlib
import colorsys
import matplotlib.pyplot as plt
import numpy as np

def rgb_to_cmyk(r, g, b):
    r, g, b = r / 255.0, g / 255.0, b / 255.0
    k = 1 - max(r, g, b)
    if k < 1:
        c = (1 - r - k) / (1 - k)
        m = (1 - g - k) / (1 - k)
        y = (1 - b - k) / (1 - k)
    else:
        c = m = y = 0
    return (c, m, y, k)

def get_sha256_color_data(input_str):
    hash_hex = hashlib.sha256(input_str.encode()).hexdigest()
    first_chunk = hash_hex[:6].ljust(6, '0')
    r = int(first_chunk[0:2], 16)
    g = int(first_chunk[2:4], 16)
    b = int(first_chunk[4:6], 16)
    h, s, v = colorsys.rgb_to_hsv(r / 255, g / 255, b / 255)
    c, m, y, k = rgb_to_cmyk(r, g, b)
    return {
        "input": input_str,
        "hex": first_chunk,
        "rgb": (r, g, b),
        "hsv": (h, s, v),
        "cmyk": (c, m, y, k)
    }


def plot_color_wheel_w_labels(color_data_list):
    fig, ax = plt.subplots(figsize=(10, 10))
    ax.set_aspect('equal')
    ax.axis('off')  # Hide axes

    # Draw circle wheel base
    circle = plt.Circle((0, 0), 1, color='lightgray', fill=False, linewidth=2)
    ax.add_artist(circle)

    # Parameters for label placement
    label_radius = 1.2  # radius just outside the wheel
    dot_radius = 0.05   # size of color dots

    for data in color_data_list:
        h, s, v = data["hsv"]
        r, g, b = data["rgb"]
        hexcode = data["hex"]
        input_str = data["input"]

        # Angle for hue (radians)
        theta = h * 2 * np.pi

        # Dot position on the wheel circumference
        x = np.cos(theta)
        y = np.sin(theta)

        # Plot colored dot
        ax.plot(x, y, 'o', markersize=20, color=(r/255, g/255, b/255), markeredgecolor='black', markeredgewidth=1)

        # Label position just outside the wheel
        lx = label_radius * np.cos(theta)
        ly = label_radius * np.sin(theta)

        # Label text
        rgb_text = f"RGB: {r},{g},{b}"
        hsv_text = f"HSV: {h:.2f},{s:.2f},{v:.2f}"
        hex_text = f"Hex: #{hexcode}"
        label_text = f"{input_str}\n{hex_text}\n{rgb_text}\n{hsv_text}"

        # Adjust text alignment based on quadrant to avoid overlap
        ha = 'left' if np.cos(theta) > 0 else 'right'
        va = 'bottom' if np.sin(theta) > 0 else 'top'

        ax.text(lx, ly, label_text, fontsize=9, ha=ha, va=va,
                bbox=dict(boxstyle="round,pad=0.3", fc="white", alpha=0.8, ec='gray'))

    # Set limits a bit larger than label radius to fit text
    ax.set_xlim(-1.5, 1.5)
    ax.set_ylim(-1.5, 1.5)
    ax.set_title("SHA256 First 6 Hex Chars Color Wheel", fontsize=16)
    plt.show()

if __name__ == "__main__":
    inputs = [
        "Hello World!",
        "Hello World!0",
        "Hello World!1",
        "Hello World!2",
        "Hello World!3",
        "Hello World!4",
        "Hello World!5",
        "Hello World!6",
        "Hello World!7",
        "Hello World!8",
        "Hello World!9",
    ]

    color_data_list = [get_sha256_color_data(s) for s in inputs]
    plot_color_wheel_w_labels(color_data_list)

# RGB → CMYK
def rgb_to_cmyk(r, g, b):
    r, g, b = r / 255.0, g / 255.0, b / 255.0
    k = 1 - max(r, g, b)
    if k < 1:
        c = (1 - r - k) / (1 - k)
        m = (1 - g - k) / (1 - k)
        y = (1 - b - k) / (1 - k)
    else:
        c = m = y = 0
    return (c, m, y, k)

# SHA256 → RGB → CMYK
def get_sha256_cmyk_data(input_str):
    hash_hex = hashlib.sha256(input_str.encode()).hexdigest()
    first_chunk = hash_hex[:6].ljust(6, '0')
    r = int(first_chunk[0:2], 16)
    g = int(first_chunk[2:4], 16)
    b = int(first_chunk[4:6], 16)
    c, m, y, k = rgb_to_cmyk(r, g, b)
    return {
        "input": input_str,
        "hex": first_chunk,
        "rgb": (r, g, b),
        "cmyk": (c, m, y, k)
    }

# Visualize as block bars using CMY as RGB approximation
def plot_cmyk_blocks(data_list):
    fig, ax = plt.subplots(figsize=(6, len(data_list) * 1))
    ax.axis('off')

    for i, data in enumerate(data_list):
        c, m, y, k = data["cmyk"]
        label = data["input"]
        hexcode = data["hex"]
        color_rgb_approx = (1 - c, 1 - m, 1 - y)  # CMY as inverted RGB

        ax.add_patch(plt.Rectangle((0, i), 1, 1, color=color_rgb_approx))

        text = f"{label}  [#{hexcode}]\nCMYK: {c:.2f}, {m:.2f}, {y:.2f}, {k:.2f}"
        ax.text(1.05, i + 0.5, text, va='center', ha='left', fontsize=9, color='white')

    ax.set_xlim(0, 3)
    ax.set_ylim(0, len(data_list))
    ax.set_title("SHA256 First 6 Chars → CMYK Blocks", fontsize=14, color='white')
    fig.patch.set_facecolor('#222')
    ax.set_facecolor('#222')
    plt.tight_layout()
    plt.show()

# Test
if __name__ == "__main__":
    inputs = [
        "Hello World!",
        "Hello World!0",
        "Hello World!1",
        "Hello World!2",
        "Hello World!3",
        "Hello World!4",
        "Hello World!5",
        "Hello World!6",
        "Hello World!7",
        "Hello World!8",
        "Hello World!9",
    ]
    cmyk_data = [get_sha256_cmyk_data(s) for s in inputs]
    plot_cmyk_blocks(cmyk_data)
