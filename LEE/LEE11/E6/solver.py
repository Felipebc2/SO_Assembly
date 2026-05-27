#!/usr/bin/env python3
import pexpect
import re
import sys

def get_bin(prog):
    gdb = pexpect.spawn(f'gdb -q /desafio/{prog}', encoding='utf-8', timeout=30)
    gdb.expect('gef>')
    gdb.sendline('catch syscall exit_group')
    gdb.expect('gef>')
    gdb.sendline('run')
    gdb.expect('gef>')
    gdb.sendline('heap bins')
    gdb.expect('gef>')
    output = gdb.before
    gdb.sendline('quit')
    try:
        gdb.expect(pexpect.EOF)
    except:
        pass

    if re.search(r'Found [1-9]\d* valid chunks in fastbins', output):
        return 'fastbin'
    if re.search(r'Found [1-9]\d* valid chunks in unsorted bin', output):
        return 'unsortedbin'
    if re.search(r'Found [1-9]\d* valid chunks in \d+ small bin', output):
        return 'smallbin'
    if re.search(r'Found [1-9]\d* valid chunks in \d+ large bin', output):
        return 'largebin'
    return 'unknown'

validador = pexpect.spawn('/desafio/validador', encoding='utf-8', timeout=60)
validador.logfile_read = sys.stdout

for prog in ['prog_00', 'prog_01', 'prog_02']:
    validador.expect(rf'{prog} foi gerenciado:')
    bin_name = get_bin(prog)
    sys.stdout.write(f' {bin_name}\n')
    sys.stdout.flush()
    validador.sendline(bin_name)

try:
    validador.expect(pexpect.EOF, timeout=10)
    print(validador.before)
except:
    pass
