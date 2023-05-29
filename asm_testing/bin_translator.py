def main():
    asm = []
    op_to_str = {"NULL":"00", "AFF":"01", "COP":"02", "ADD":"03", "SUB":"04",
                "MUL":"05", "DIV":"06", "CMP":"07", "B":"08", "BEQ":"09",
                "BNE":"0a", "BN":"0b", "BNZ":"0c", "BP":"0d", "BSP":"0e",
                "BF":"0f", "RET":"10", "PUSH":"11", "POP":"12", "STR":"13",
                "LDR":"14", "PRINT":"15", "AND":"16", "OR":"17", "NOT":"18", "XOR":"19"}

    with open("asm_testing/asm_output", "r") as f_asm:
        lines = f_asm.readlines()
        [asm.append(line) for line in lines]
    asm = asm[1:-1]

    with open("bin/bin_output", "w") as f_bin:
        for i in asm:
            ins = i.split()
            ins = ins[2:]
            while len(ins) != 4:
                ins.append("00")

            f_bin.write(op_to_str[ins[0]])

            a = ins[1]
            if a != "00":
                a = str(hex(int(a)))
                a = a[2:]
                a = a[-2:]
                if len(a) == 1:
                    a = "0" + a

            b = ins[2]
            if b != "00":
                b = str(hex(int(b)))
                b = b[2:]
                b = b[-2:]
                if len(b) == 1:
                    b = "0" + b

            c = ins[3]
            if c != "00":
                c = str(hex(int(c)))
                c = c[2:]
                c = c[-2:]
                if len(c) == 1:
                    c = "0" + c

            f_bin.write(a)
            f_bin.write(b)
            f_bin.write(c)
            f_bin.write("\n")


main()