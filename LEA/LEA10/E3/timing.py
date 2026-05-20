import subprocess
import string

charset = string.ascii_letters + string.digits
password = ""

for pos in range(5):
    best_char = None
    best_time = 0
    for c in charset:
        guess = password + c + "A" * (4 - pos)
        times = []
        for _ in range(5):
            proc = subprocess.run(
                ["/desafio/exercicio"],
                input=guess.encode() + b"\n",
                capture_output=True,
                cwd="/desafio"
            )
            output = proc.stdout.decode()
            for line in output.split("\n"):
                if "Tempo:" in line:
                    t = int(line.split(":")[1].strip())
                    times.append(t)
        if times:
            median = sorted(times)[len(times)//2]
            if median > best_time:
                best_time = median
                best_char = c
    password += best_char
    print(f"Posição {pos}: '{best_char}' tempo={best_time} | parcial: {password}")

print(f"\nPassword final: {password}")
