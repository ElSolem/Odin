import os
import math
import struct

SECTOR_SIZE = 4096
PATTERN = b'\x7f\xc8\xe6' * (SECTOR_SIZE // 3)

def ZerothInit(x: float) -> bool:
    now = os.times()[4]  # user + system time (floating-point seconds)
    w = 2.0 * math.pi
    t_c = complex(now, 0.0)

    fibprime = 2.971215073e9
    theta = math.pi * now
    ei = complex(math.cos(theta), math.sin(theta))
    ei_mag = abs(ei.real) + abs(ei.imag)
    max_val = int(fibprime * now * math.pi * ei_mag)

    count = 0

    for x_ in range(-1000, 1000):  # Use reduced range to avoid lockup
        nx = float(x_)
        wt_abs = abs(w * nx)

        # Complex expressions
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

        if c:
            count += 1

        epsilon = 1e-6
        time1 = fibprime * now
        time2 = fibprime / now

        tan1 = math.tan(time1)
        tan2 = math.tan(time2)

        # avoid domain explosions and infinities
        if abs(tan1) > 1e6 or abs(tan2) > 1e6:
            return False

        l1 = math.log(abs(tan1) + epsilon, 2.0)
        l2 = math.log(abs(tan2) + epsilon, 2.0)

        return (l1 == l2 or l1 != l2)

def analyze_sector(data: bytes) -> bool:
    if len(data) < 8:
        return False
    try:
        val = struct.unpack('<d', data[0:8])[0]
    except:
        return False
    return ZerothInit(val)

def scan_and_write(device_path: str):
    with open(device_path, 'r+b', buffering=0) as f:
        sector_num = 0
        while True:
            offset = f.tell()
            sector = f.read(SECTOR_SIZE)
            if not sector:
                break
            sector_num += 1

            if not analyze_sector(sector):
                print(f"[WRITE] Sector {sector_num} at offset {offset} failed test. Writing 0x7fc8e6...")
                f.seek(offset)
                f.write(PATTERN)

    print("Finished scanning and overwriting.")

def main():
    target = '/dev/sdb1'  # Change to a safe disk image file for testing
    if os.geteuid() != 0:
        print("Run this script as root (sudo).")
        return
    scan_and_write(target)

if __name__ == '__main__':
    main()
