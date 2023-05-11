asect 0xf2
dc jump
dc main



asect 0x00
###################
# Turn on         #
#   interaptions  #
###################
setsp 0xf0		  #	
ldi r3, 0x09      #
push r3			  #	
ldi r3, 0x80      #
push r3			  #	
rti               #
setsp 0x00        #
###################


main:
	wait
	
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
	br main



end