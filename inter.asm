asect 0xfa
dc jump
dc main

dc updMaxScore
dc main


asect 0x00
###################
# Turn on         #
# Enable          #
#   interaptions  #
###################
setsp 0xf0        #
ei                #
###################

main:
	wait
	br main
	
jump:
	ldi r3, 0xf0
	ld r3, r3
	ldi r0, 11	
	if
	cmp r3, r0
	is pl
		ldi r1, 0
		ldi r2, 7
	else
		move r3, r1
		ldi r2, 3
		if
		cmp r1, r2
		is le
			ldi r1, 7
			ldi r2, 0
		else
			sub r0, r1
			ldi r2, 7
			sub r1, r2
			neg r2
		fi
	fi
	ldi r0, 0
	rti

updMaxScore:
	ldi r1, 0xf1
	ld r1, r1
	
	ldi r2, 0xf3
	ld r2, r2
	
	
	if
	cmp r1, r2
	is gt
		ldi r2, 0xf3
		st r2, r1
		
		ldi r1, 0xf2
		ld r1, r1
		ldi r2, 0xf4
		st r2, r1
	else
		if
		cmp r1, r2
		is eq
			if
			ldi r3, 0xf2
			ld r3, r3
		
			ldi r2, 0xf4
			ld r2, r2
				
			cmp r3, r2
			is gt
				ldi r2, 0xf4
				st r2, r3
			
				ldi r1, 0xf1
				ld r1, r1
				ldi r2, 0xf3
				st r2, r1
			fi
		fi
	fi
	ldi r0, 11
	ldi r0, 0
	rti
	
end