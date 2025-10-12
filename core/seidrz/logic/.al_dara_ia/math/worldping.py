import subprocess
import time
import math
import os
import cmath

# --- ZerothInit ---
def ZerothInit(x: float) -> bool:
    now = os.times()[4]
    w = 2.0 * math.pi
    t_c = complex(now, 0.0)
    fibprime = 2.971215073e9
    theta = math.pi * now
    ei = complex(math.cos(theta), math.sin(theta))
    ei_mag = abs(ei.real) + abs(ei.imag)

    for x_ in range(-1000, 1000):
        nx = float(x_)
        wt_abs = abs(w * nx)
        e1 = complex(wt_abs, wt_abs) * t_c
        e2 = complex(0.0, wt_abs ** 2) * t_c
        e3 = complex(-wt_abs ** 2, 0.0) * t_c
        e4 = complex(wt_abs, -wt_abs) * t_c
        log_val = math.log(wt_abs, 2) if wt_abs > 0 else 0.0
        exp_angle = wt_abs * log_val
        e5 = complex(math.cos(exp_angle), math.sin(exp_angle)) * t_c
        y = x_
        xt = float(x_) * now
        yt = float(y) * now
        e6 = (abs(xt) + abs(yt)) <= 1.0
        angle = w * nx
        e7 = complex(math.cos(angle), math.sin(angle)) * t_c
        abs_diff = (abs(float(x_)) - abs(float(y))) * now
        e8 = abs_diff >= 0.0
        c = ((abs(e1.real) > 0.5 or abs(e1.imag) > 0.5) or
             (abs(e2.real) > 0.5 or abs(e2.imag) > 0.5) or
             (e3.real < 0.0) or (e4.imag < 0.0) or
             (e5.real > 0.0 and e5.imag > 0.0) or
             e6 or (e7.real > 0.0 and e7.imag > 0.0) or
             e8)
        if not c:
            return False

    epsilon = 1e-6
    time1 = fibprime * now
    time2 = fibprime / now
    tan1 = math.tan(time1)
    tan2 = math.tan(time2)
    if abs(tan1) > 1e6 or abs(tan2) > 1e6:
        return False
    l1 = math.log(abs(tan1) + epsilon, 2.0)
    l2 = math.log(abs(tan2) + epsilon, 2.0)
    return (l1 == l2 or l1 != l2)

# --- Silent ZMap ---
def run_zmap(output_csv="zmap_results.csv"):
    subprocess.run([
        "zmap", "-p", "80",
        "-o", output_csv,
        "-f", "saddr",
        "-r", "1000000000"
    ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# --- Silent Evaluation ---
def evaluate_ips_silent(csv_file):
    with open(csv_file, 'r') as f:
        for line in f:
            ip = line.strip()
            if not ip or ip.startswith("saddr"):
                continue
            ip_val = sum(ord(c) for c in ip)
            ZerothInit(ip_val)

# --- Main ---
if __name__ == "__main__":
    run_zmap("zmap_results.csv")
    evaluate_ips_silent("zmap_results.csv")
    print("complete")
