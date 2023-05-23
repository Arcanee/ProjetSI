def main(): 
	print()
	asm = []
	stack = [-1,0,0,0,0,0,0,0]
	reg = [0,0,0,0]
	flags = [0,0,0,0] #Neg, Zero, Carry, Overflow
	sp = 0

	with open("asm_testing/asm_output", "r") as f:
		lines = f.readlines()
		[asm.append(line) for line in lines]

	asm = asm[1:-1]
	print("See all instructions in file 'asm_output'")
	print()

	# Possible instructions : AFF, COP, ADD, SUB, MUL, DIV, B, NIL, CMP, BEQ, BNE, RET, PSH, POP, BF, STR, LDR
	# R is for register number
	# V is for numerical value
	# M is for memory stack addr
	# I is for intruction number

	i = 0
	while i < len(asm) :
		if i < 0:
			print("End of program")
			print()
			break

		ins = asm[i].split()
		ins = ins[2:]

		if len(ins) > 1 :
			print("Instruction", i, ":", ins)
			opcode = ins[0]

			# AFF [R] [V]
			if opcode == "AFF": 
				reg[int(ins[1])] = int(ins[2])
			
			# Not used anymore
			elif opcode == "COP": 
				pass
			
			# ADD [R] [R] [R]
			elif opcode == "ADD": 
				reg[int(ins[1])] = reg[int(ins[2])] + reg[int(ins[3])]
			
			# SUB [R] [R] [R]
			elif opcode == "SUB": 
				reg[int(ins[1])] = reg[int(ins[2])] - reg[int(ins[3])]
			
			# MUL [R] [R] [R]
			elif opcode == "MUL": 
				reg[int(ins[1])] = reg[int(ins[2])] * reg[int(ins[3])]
			
			# DIV [R] [R] [R]
			elif opcode == "DIV": 
				reg[int(ins[1])] = reg[int(ins[2])] / reg[int(ins[3])]
			
			# B [I]
			elif opcode == "B": 
				i = int(ins[1])-1
			
			# CMP [R] [R]
			elif opcode == "CMP":
				res = reg[int(ins[1])] - reg[int(ins[2])]
				flags[0] = int(res < 0)
				flags[1] = int(res == 0)
			
			# BNE [I]
			elif opcode == "BNE":
				if flags[1] == 0: 
					i = int(ins[1])-1

			# BEQ [I]
			elif opcode == "BEQ":
				if flags[1] == 1: 
					i = int(ins[1])-1

			# RET [M]
			elif opcode == "RET":
				i = stack[sp + int(ins[1])] - 1
			
			# PSH [V]
			elif opcode == "PSH":
				sp += int(ins[1])
			
			# POP [V]
			elif opcode == "POP":
				sp -= int(ins[1])
			
			# BF [I]
			elif opcode == "BF":
				stack[sp] = i+1
				i = int(ins[1])-1
			
			# STR [R] [M]
			elif opcode == "STR":
				stack[sp + int(ins[1])] = reg[int(ins[2])]
			
			# LDR [R] [M]
			elif opcode == "LDR":
				reg[int(ins[2])] = stack[sp + int(ins[1])]
			
			# BN [I]
			elif opcode == "BN":
				if flags[0] == 1:
					i = int(ins[1])-1

			# BNZ [I]
			elif opcode == "BNZ":
				if flags[0] == 1 or flags[1] == 1:
					i = int(ins[1])-1

			# BP [I]
			elif opcode == "BP":
				if flags[0] == 0:
					i = int(ins[1])-1

			# BSP [I]
			elif opcode == "BSP":
				if flags[0] == 0 and flags[1] == 0:
					i = int(ins[1])-1
							 

		i+=1
		print("Stack :", stack)
		print("Registers :", reg)
		print("Flags :", flags)
		print("Stack pointer :", sp)
		print("Next : instruction", i)
		print()

		
main()