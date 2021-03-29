// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// screen range are between 16384 to 24575(16384+(32*256-1))
// 32*256-1=8191

@LOOP
0;JMP
@reseted
M=0

(LOOP)
  @reseted
  D=M
  @RESET
  D;JEQ
  @KBD
  D=M
  @BLACK
  D;JNE
  @WHITE
  D;JEQ
  @LOOP
  0;JMP

(BLACK)
  @reseted
  M=0
  @i
  A=M
  M=-1
  @i
  M=M+1
  D=M
  @24575
  D=D-A
  @LOOP
  D;JGT
  @BLACK
  0;JMP

(RESET)
  @SCREEN
  D=A
  @i
  M=D
  @reseted
  M=1
  @LOOP
  0;JMP
 
(WHITE)
  @reseted
  M=0
  @i
  A=M
  M=0
  @i
  M=M+1
  D=M
  @24575
  D=D-A
  @LOOP
  D;JGT
  @WHITE
  0;JMP
