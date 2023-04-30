def main() : 
	print()
	asm = []
	sym = [0,0,0,0,0,0,0,0,False]

	with open("asm_testing/asm_output", "r") as f:
		lines = f.readlines()
		[asm.append(line) for line in lines]

	asm = asm[1:-1]
	print("All instructions :", asm)
	print()

	i = 0
	while i < len(asm) :
		if i < 0:
			print("error: incorrect value for i")
			break

		ins = asm[i].split()
		ins = ins[2:]

		if len(ins) > 1 :
			print("Instruction", i, ":", ins)
			tmp = ins[0]

			if tmp == "AFF": 
				sym[int(ins[1])] = int(ins[2])
			
			elif tmp == "COP": 
				sym[int(ins[1])] = sym[int(ins[2])]
			
			elif tmp == "ADD": 
				sym[int(ins[1])] = sym[int(ins[2])] + sym[int(ins[3])]
			
			elif tmp == "SUB": 
				sym[int(ins[1])] = sym[int(ins[2])] - sym[int(ins[3])]
			
			elif tmp == "MUL": 
				sym[int(ins[1])] = sym[int(ins[2])] * sym[int(ins[3])]
			
			elif tmp == "DIV": 
				sym[int(ins[1])] = sym[int(ins[2])] / sym[int(ins[3])]
			
			elif tmp == "B": 
				i = int(ins[1])-1
			
			elif tmp == "CMP":
				sym[-1] = sym[int(ins[1])] == sym[int(ins[2])]
			
			elif tmp == "BNE":
				prev_ins = asm[i-1].split()
				prev_ins = prev_ins[2:]
				if (sym[int(prev_ins[1])] != sym[int(prev_ins[2])]) : 
						i = int(ins[1])-1

			elif tmp == "BEQ":
				prev_ins = asm[i-1].split()
				prev_ins = prev_ins[2:]
				if (sym[int(prev_ins[1])] == sym[int(prev_ins[2])]) : 
						i = int(ins[1])-1

				
							 

		i+=1
		print("Memory :", sym) 
		print("Next : instruction", i)
		print()

		
main()