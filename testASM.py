def main() : 
	asm = []
	sym = [0,0,0,0,0,0,0,0]
	with open('res') as f:
		lines = f.readlines()
		[asm.append(line) for line in lines]
	print(asm)
	i = 0
	while i < len(asm) :
		
		ins = asm[i].split()
		ins = ins[2:]
		if len(ins) > 1 :
			print(ins)
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
				print(i)
				print(tmp) 
				nextl = (asm[i+1].split())[2:]
				tmp2 = nextl[0]
				print(tmp2) 
				if tmp2 == "BEQ":
					if (sym[int(ins[1])] == sym[int(ins[2])]) : 
						i = int(nextl[1])-1
				elif tmp2 == "BNE" : 
					if (sym[int(ins[1])] != sym[int(ins[2])]) : 
						i = int(nextl[1])-1
				
							 

		i+=1
		print(i)
		print(sym)
		print("\n")

		
		
	



main()