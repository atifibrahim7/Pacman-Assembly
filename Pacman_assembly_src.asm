INCLUDE Irvine32.inc
include macros.inc
includelib Winmm.lib

.386
.model flat,stdcall
.stack 4096
    BUFFER_SIZE = 501

.data   
   aye         db 'C:\Users\Dell\OneDrive - University of Bradford\Desktop\music.wav' ,0  
   
      namee  byte 20 dup(?)
    promptname byte "Enter your name : ", 0 
    promptmenu BYTE "                                           MENU " , 0Ah ;
               BYTE "                                    1 .  Play Game ", 0AH ; 
               BYTE "                                    2 .  Instructions " , 0Ah ; 
               BYTE "                                    3 .   Exit          ", 0 

    instructions BYTE "                                 PAC-MAN INSTRUCTIONS " , 0Ah ;
             BYTE "    Pac-Man is a classic arcade game where the player controls a yellow ", 0AH ; 
             BYTE "    character, Pac-Man, to navigate a maze and eat pellets. Here are the ", 0AH ; 
             BYTE "    basic instructions to play the game:", 0AH ; 
             BYTE "    1. Use arrow keys to move Pac-Man: Up, Down, Left, and Right.", 0AH ; 
             BYTE "    2. Navigate the maze and eat all the pellets to advance to the next level.", 0AH ; 
             BYTE "    3. Avoid the ghosts (Blinky, Pinky, Inky, and Clyde) as they will", 0AH ; 
             BYTE "       attempt to catch Pac-Man.", 0AH ; 
             BYTE "    4. Eating a power pellet allows Pac-Man to turn the tables and eat ghosts.", 0AH ; 
             BYTE "    5. The game ends when Pac-Man loses all lives or completes all levels.", 0AH ; 
             BYTE "    6. Score points by eating pellets, fruits, and ghosts.", 0AH ; 
             BYTE "    7. Have fun and aim for the highest score!", 0AH ; 
             BYTE "    Press any key to return to the main menu.", 0

     front    BYTE "                                                                                          " , 0Ah ; 
      BYTE "                                                                                          " , 0Ah ; 
      BYTE "                 _____       ___     ___       __      __        ___           __     ___    " , 0Ah ;
      BYTE "                ||    ||    /| ||   //        || \    || \      || ||         || \\  // || " , 0Ah ; 
      BYTE "                ||    ||   /|  ||   ||   ___  ||  \   ||  \     ||  ||   ___   ||  \\/  || " , 0Ah ;
      BYTE "                ||    ||  /|___||   ||  // \\ ||   \  ||   \    ||___||  // \\  ||      || " , 0Ah ;
      BYTE "                ||    ||  ||---||   ||  || || ||    \ ||    \   ||---||  || ||  ||      || " , 0Ah ;
      BYTE "                ||-----   ||   ||   ||  \\_// ||     \||     \  ||   ||  \\_//  ||      || " , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       || " , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       || " , 0Ah ;
      BYTE "                ||        ||   ||   \\__      ||      ||      || ||  ||        ||       || " , 0
      

 ppause BYTE "                                                                                          " , 0Ah ; 
      BYTE "                                                                                          " , 0Ah ; 
      BYTE "                 _____       ___     ___       __      __        ___           __     ___ " , 0Ah ;
      BYTE "                ||    ||    /| ||   //        || \    || \      || ||         || \\  // ||" , 0Ah ; 
      BYTE "                ||    ||   /|  ||   ||   ___  ||  \   ||  \     ||  ||   ___   ||  \\/  ||" , 0Ah ;
      BYTE "                ||    ||  /|___||   ||  // \\ ||   \  ||   \    ||___||  // \\  ||      ||" , 0Ah ;
      BYTE "                ||    ||  ||---||   ||  || || ||    \ ||    \   ||---||  || ||  ||      ||" , 0Ah ;
      BYTE "                ||-----   ||   ||   ||  \\_// ||     \||     \  ||   ||  \\_//  ||      ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   \\__      ||      ||      || ||  ||        ||       ||" , 0

      promptpause byte "Paused! press any key to continue: ", 0

      endscreen BYTE "                                                                                          " , 0Ah ; 
      BYTE "                                                                                          " , 0Ah ; 
      BYTE "                 _____       ___     ___       __      __        ___           __     ___ " , 0Ah ;
      BYTE "                ||    ||    /| ||   //        || \    || \      || ||         || \\  // ||" , 0Ah ; 
      BYTE "                ||    ||   /|  ||   ||   ___  ||  \   ||  \     ||  ||   ___   ||  \\/  ||" , 0Ah ;
      BYTE "                ||    ||  /|___||   ||  // \\ ||   \  ||   \    ||___||  // \\  ||      ||" , 0Ah ;
      BYTE "                ||    ||  ||---||   ||  || || ||    \ ||    \   ||---||  || ||  ||      ||" , 0Ah ;
      BYTE "                ||-----   ||   ||   ||  \\_// ||     \||     \  ||   ||  \\_//  ||      ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   \\__      ||      ||      || ||  ||        ||       ||" , 0

      promptend byte "congratulations you Won", 0

      levelpassed BYTE "                                                                                          " , 0Ah ; 
      BYTE "                                                                                          " , 0Ah ; 
      BYTE "                 _____       ___     ___       __      __        ___           __     ___ " , 0Ah ;
      BYTE "                ||    ||    /| ||   //        || \    || \      || ||         || \\  // ||" , 0Ah ; 
      BYTE "                ||    ||   /|  ||   ||   ___  ||  \   ||  \     ||  ||   ___   ||  \\/  ||" , 0Ah ;
      BYTE "                ||    ||  /|___||   ||  // \\ ||   \  ||   \    ||___||  // \\  ||      ||" , 0Ah ;
      BYTE "                ||    ||  ||---||   ||  || || ||    \ ||    \   ||---||  || ||  ||      ||" , 0Ah ;
      BYTE "                ||-----   ||   ||   ||  \\_// ||     \||     \  ||   ||  \\_//  ||      ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   ||        ||      ||      || ||  ||        ||       ||" , 0Ah ;
      BYTE "                ||        ||   ||   \\__      ||      ||      || ||  ||        ||       ||" , 0

      promptpass byte "level passed! press any kry", 0

  map BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"     
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
      BYTE "||o                                    |||||o           o|||||||||||||||||o     o||"
      BYTE "||    |||||||||||                      |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||           |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||           |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||           |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||           |||||                                     ||"
      BYTE "||    ||||   ||||      |||||           |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||o            o||||||||||||||||       ||"
      BYTE "||                     |||||    |||||  |||||||||||||||||||||||||||||||||||       ||"
      BYTE "||                     |||||    |||||  |||||||||||||||||||||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||    |||||                     ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||    |||||           ||||||    ||||||||||||||||       ||"
      BYTE "||    |||||||||||               |||||  |||||    ||||||                           ||"
      BYTE "||    |||||||||||               |||||  |||||    ||||||    ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||    |||||  |||||    ||||||    ||||||||||||||||       ||"
      BYTE "||    ||||||||||||||||||||||    |||||  |||||           o  ||||||||||||||||       ||"
      BYTE "||    ||||||||||||||||||||||           |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||                                     ||"
      BYTE "||    |||||||||||      |||||           |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||||||||||||||||||              ||||||||||||||||       ||"
      BYTE "||                     |||||o                             ||||||||||||||||       ||"
      BYTE "||                     |||||                             o||||||||||||||||       ||"
      BYTE "||o                                         o                                   o||"
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" , 0
      
      
      map2 BYTE "+________________________________________________________________________________X|"     
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||X|"
      BYTE "||                       *             |||||*      o    *|||||||||||||||||o    * X|"
      BYTE "||    |||||||||||                      |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||o           o|||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||                                     ||"
      BYTE "||    ||||   ||||      |||||     o     |||||              ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||*      o     *||||||||||||||||       ||"
      BYTE "||                     |||||    |||||  |||||||||||||||||||||||||||||||||||       ||"
      BYTE "||                     |||||    |||||  |||||||||||||||||||||||||||||||||||  o    ||"
      BYTE "||    |||||||||||      |||||    |||||                     ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||    |||||           ||||||    ||||||||||||||||       ||"
      BYTE "||    |||||||||||               |||||  |||||    ||||||                           ||"
      BYTE "||    |||||||||||               |||||  |||||    ||||||    ||||||||||||||||       ||"
      BYTE "|| *  |||||||||||      |||||    |||||  |||||    ||||||    ||||||||||||||||       ||"
      BYTE "||    ||||||||||||||||||||||    |||||  |||||              ||||||||||||||||       ||"
      BYTE "||    ||||||||||||||||||||||           |||||   |||||||||| ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||   ||      || ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||   ||      ||                        ||"
      BYTE "||    |||||||||||      |||||           |||||   ||      || ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||          *|||||   ||      || ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||||||||||||||||||   ||      || ||||||||||||||||       ||"
      BYTE "||                     |||||                   ||      || ||||||||||||||||       ||"
      BYTE "|| *                   |||||                   |||||||||| ||||||||||||||||o      ||"
      BYTE "||                                             *                               * ||"
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" , 0

      map3 BYTE "+________________________________________________________________________________X|"     
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
      BYTE "||                       *             |||||*     o     *|||||||||||||||||o    * ||"
      BYTE "||    |||||||||||      |||||     ||||| |||||             |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||    ||||||   |||||||||||||||||       ||"
      BYTE "|| || ||||   ||||      |||||     |||||                   |||||||||||||||||       ||"
      BYTE "||    ||||   |||| |||| |||||     ||||| |||||    ||||||   |||||||||||||||||       ||"
      BYTE "||    ||||   ||||      |||||     ||||| |||||                               ||||| ||"
      BYTE "||    ||||   ||||      |||||           |||||    |||||||   ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||           |||||*            *||||||||||||||||       ||"
      BYTE "||                     |||||    |||||  ||||||||||| |||||||||||||||||||||||   o   ||"
      BYTE "||    |||||||||||      |||||    |||||  ||||||||||| ||||||||||||||||||||||| ||||| ||"
      BYTE "||    |||||||||||      |||||    |||||                     ||||||||||||||||       ||"
      BYTE "|| || |||||||||||      |||||    |||||           ||||||    ||||||||||||||||       ||"
      BYTE "||    |||||||||||               |||||  |||||    ||||||                           ||"
      BYTE "||    |||||||||||      |||||    |||||  |||||    ||||||    ||||||||||||||||       ||"
      BYTE "|| *  |||||||||||      |||||    |||||  |||||    ||||||    ||||||||||||||||   o   ||"
      BYTE "||    ||||||||||||| ||||||||    |||||o |||||      |       |||||||||||||||| ||||| ||"
      BYTE "||    ||||||||||||| ||||||||    ||||||||||||   |||||||||| ||||||||||||||||       ||"
      BYTE "||    |||||||||||*    *|||||    |||||  |||||   ||      || ||||||||||||||||       ||"
      BYTE "|| || |||||||||||      |||||    |||||  |||||   ||      ||              o |       ||"
      BYTE "||    |||||||||||      |||||    |||||  |||||   ||      || ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||          *|||||   ||      || ||||||||||||||||       ||"
      BYTE "||    |||||||||||      |||||||| ||||||||||||   ||      || ||||||||||||||||o||||| ||"
      BYTE "||                     |||||      |||||        ||      || ||||||||||||||||       ||"
      BYTE "|| *      ||||         |||||      |||||        |||||||||| ||||||||||||||||       ||"
      BYTE "||                                             *                               * ||"
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
      BYTE "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" , 0

     ;total no of rows and cols 
      mapRow EQU 29
    mapCol EQU 83
    ; pacman and its position 
    inputchar byte '@'
    xPos byte 29
    yPos byte 14
    ; enemy and its posiiton 
    enemy byte 'E'
    erow byte 9 
    ecol byte 20

    enemy2 byte 'E'
    erow2 byte 24 
    ecol2 byte 30
    ; flags for direction of enemy 
    eright db 0
    eleft db 0 
    eup db 0
    edown db 0
     ; flags for direction of enemy 
    eright2 db 0
    eleft2 db 0 
    eup2 db 0
    edown2 db 0
    ; scoring varaible 
    score dd 0 
    numscore db 0
    life dd 3 
    exitflag byte 0 

    pr db 0

    ; level 3 enemies ;
    ; enemy and its posiiton 
    l3enemy1 byte 'E'
    l3e1row byte 9 
    l3e1col byte 20

    l3enemy2 byte 'E'
    l3e2row byte 25 
    l3e2col byte 30

    l3enemy3 byte 'E'
    l3e3row byte 3 
    l3e3col byte 5

    l3enemy4 byte 'E'
    l3e4row byte 1 
    l3e4col byte 35
    ; flags for direction of enemy 
    l3e1right db 0
    l3e1left db 0 
    l3e1up db 0
    l3e1down db 0

    l3e2right db 0
    l3e2left db 0 
    l3e2up db 0
    l3e2down db 0

    l3e3right db 0
    l3e3left db 0 
    l3e3up db 0
    l3e3down db 0

    l3e4right db 0
    l3e4left db 0 
    l3e4up db 0
    l3e4down db 0
    buffer dd BUFFER_SIZE DUP(?)
    filename byte 'file.txt'
    filestr byte 255 dup(?)
    fileHandle   HANDLE ?
    lvl db 0 
    PlaySound   PROTO,
                pszSound:PTR BYTE,
                hmod:DWORD,
                fdwSound:DWORD



.code



getArrayVal PROC, x:BYTE, y:BYTE
    mov eax, 0
    mov ebx , 0 
    mov al, x           ; ROW
    mov bl, mapCol      ; TOTAL ROW
    mul bl
    movsx bx, y
    add ax, bx           ; RESULT + COL
                ; i*no.ofcol + j 

    mov ecx, eax        ; save the result in ecx for later use
    mov esi  , offset map
    mov al, map[eax]

    cmp al, '|'
    je  is_pipe
    cmp al , '_'
    je is_line
    cmp al, 'X'
    je  is_x
    cmp al , 'o'
    je is_food 
   
not_special_char:
    mov ah, 0
    jmp done
is_line: 
is_x:
    mov ah, 1
    jmp done
is_pipe:
    mov ah, 1
    jmp done

is_food : 
    mov ah , 2
    cmp pr,0
    jne co
    mov bl,' '
    mov map[ecx],bl
    co:
    jmp done 
done:
    ret
getArrayVal ENDP

getArrayVal2 PROC, x:BYTE, y:BYTE
    mov eax, 0
    mov ebx , 0 
    mov al, x           ; ROW
    mov bl, mapCol      ; TOTAL ROW
    mul bl
    movsx bx, y
    add ax, bx           ; RESULT + COL
                ; i*no.ofcol + j 

    mov ecx, eax        ; save the result in ecx for later use
    mov esi  , offset map2
    mov al, map2[eax]

    cmp al, '|'
    je  is_pipe
    cmp al , '_'
    je is_line
    cmp al, 'X'
    je  is_x
    cmp al , 'o'
    je is_food 
     cmp al, '*'
    je is_pp
not_special_char:
    mov ah, 0
    jmp done
is_line: 
is_x:
    mov ah, 1
    jmp done
is_pipe:
    mov ah, 1
    jmp done
is_pp:
    mov ah,5
    mov al,'*'
    cmp pr,0
    jne co2
    mov bl,' '
    mov map2[ecx],bl
    co2:
    jmp done 
is_food : 
 mov ah , 2 
 cmp pr,0
    jne co
    mov bl,' '
    mov map2[ecx],bl
    co:
    jmp done 
done:
    ret
getArrayVal2 ENDP

getArrayVal3 PROC, x:BYTE, y:BYTE
    mov eax, 0
    mov ebx , 0 
    mov al, x           ; ROW
    mov bl, mapCol      ; TOTAL ROW
    mul bl
    movsx bx, y
    add ax, bx           ; RESULT + COL
                ; i*no.ofcol + j 

    mov ecx, eax        ; save the result in ecx for later use
    mov esi  , offset map3
    mov al, map3[eax]

    cmp al, '|'
    je  is_pipe
    cmp al , '_'
    je is_line
    cmp al, 'X'
    je  is_x
    cmp al , 'o'
    je is_food 
     cmp al, '*'
    je is_pp
not_special_char:
    mov ah, 0
    jmp done
is_line: 
is_x:
    mov ah, 1
    jmp done
is_pipe:
    mov ah, 1
    jmp done
is_pp:
    mov ah,5
    mov al,'*'
    cmp pr,0
    jne co2
    mov bl,' '
    mov map3[ecx],bl
    co2:
    jmp done 
is_food : 
 mov ah , 2 
 mov al,'o'
 cmp pr,0
    jne co
    mov bl,' '
    mov map3[ecx],bl
    co:
    jmp done 
done:
    ret
getArrayVal3 ENDP

printMap PROC
    mov dl, 0   ; row
    mov dh, 0   ; col
    outer_loop:
        cmp dl, mapRow
        je  end_outer_loop

        inner_loop:
            cmp dh, mapCol
            je  end_inner_loop

            invoke getArrayVal, dl, dh      ; return char in al
            
            cmp al, 'o'
            jne cont
            inc numscore
            mov eax , white + (red*16)
            call setTextColor
            cont:
            cmp al , '|'
            jne ddownn

            mov eax , yellow + (yellow*16)
            call setTextColor
            ddownn : 
            call WriteChar
            INC dh
             mov eax , white + (Black * 16)
            call setTextColor
            jmp inner_loop

        end_inner_loop:
            mov dh, 0
            call Crlf
            inc dl

        jmp outer_loop

    end_outer_loop:
    ret
printMap ENDP

printMap2 PROC
    mov dl, 0   ; row
    mov dh, 0   ; col
    outer_loop:
        cmp dl, mapRow
        je  end_outer_loop

        inner_loop:
            cmp dh, mapCol
            je  end_inner_loop

            invoke getArrayVal2, dl, dh      ; return char in al
            cmp ah, 5
            jne c2
            mov al,'*'
            jmp cont
           
            c2:
            cmp al, 'o'
            jne cont
            inc numscore
            cont:
             cmp al , '|'
            jne down
            mov eax , yellow + (yellow*16)
            call setTextColor
            down : 
            call WriteChar
            INC dh
             mov eax , white + (Black * 16)
            call setTextColor
            jmp inner_loop

        end_inner_loop:
            mov dh, 0
            call Crlf
            inc dl

        jmp outer_loop

    end_outer_loop:
    ret
printMap2 ENDP

printMap3 PROC
    mov dl, 0   ; row
    mov dh, 0   ; col
    outer_loop:
        cmp dl, mapRow
        je  end_outer_loop

        inner_loop:
            cmp dh, mapCol
            je  end_inner_loop

            invoke getArrayVal3, dl, dh      ; return char in al
            cmp ah, 5
            jne c2
            mov al,'*'
            jmp cont
            c2:
            cmp al, 'o'
            jne cont
             mov eax , red + (red*16)
            call setTextColor
            inc numscore
            cont:
            cmp al , '|'
            jne down
            mov eax , yellow + (yellow*16)
            call setTextColor
            down : 
            call WriteChar
            INC dh
             mov eax , white + (black*16)
            call setTextColor
            jmp inner_loop

        end_inner_loop:
            mov dh, 0
            call Crlf
            inc dl

        jmp outer_loop

    end_outer_loop:
    ret
printMap3 ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  lvl1  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
level1 PROC
call drawplayer
gameLoop :  
   
        call loadEnemy  
       
        call enemyCollide

        
           
       ; score 
       mGotoxy 85, 10
       mWrite "Score:" 
            mov eax, score
            call WriteInt

            cmp numscore,0
            je Gameover
            ; 
             mGotoxy 85, 11
       mWrite "Lives:" 
            mov eax, life
            call WriteInt

           ; lives 0 means lost
            cmp life,0
            je exitGame
            ; enemy ;
       
            ; 
    ; input key 
        mov bl , inputchar   
        mov  eax,100          ; sleep, to allow OS to time slice
        call Delay           ; (otherwise, some key presses are lost)
        call ReadKey         ; look for keyboard input
        mov inputchar , al 
        cmp al , 1 
        jne retain 
        mov al , bl
        mov inputchar , bl
        retain : 

        call Randomize


 ; exit game if user types 'x':
    cmp inputChar, "x"
    je exitGame
    cmp inputChar, "p"
    jne con
    call pausepage
    mov pr,1
    call printMap
    mov pr,0
    call DrawPlayer
    con:
    ; move player based on input
    cmp inputChar, "w"
    je moveUp

    cmp inputChar, "s"
    je moveDown

    cmp inputChar, "a"
    je moveLeft

    cmp inputChar, "d"
    je moveRight

    jmp gameloop

    
moveUp:
    ; Check if yPos is greater than 0 to prevent moving off the top edge
    cmp yPos, 1
    jl gameLoop
    ; collision with walls 
   mov dl , xpos 
    mov dh , ypos 
    dec dh 
   invoke getarrayval , dh , dl  
  ; logic to increase score by 1 if 0 is eaten
  
   cmp ah , 2 
    jne moveupcont
    inc score 
    dec numscore
   

 moveupcont :
   
    cmp ah ,  1
    ; end for collision code
    je skipupmovement 
    call UpdatePlayer
    dec yPos
    call DrawPlayer
    skipupmovement : 
    jmp gameLoop

moveDown:
    ; Check if yPos is less than 29 to prevent moving off the bottom edge
    ; collison  
    mov dl , xpos 
    mov dh , ypos 
    inc dh  
    invoke getarrayval , dh , dl  
    
        cmp ah , 2 
    jne movedowncont
    inc score 
    dec numscore

 movedowncont :
    cmp ah , 1 
    je skipdownmovement 

    call UpdatePlayer
    inc yPos
    call DrawPlayer
    skipdownmovement : 
    jmp gameLoop

moveLeft:
    ; Check if xPos is greater than 0 to prevent moving off the left edge
     mov dl , xpos 
    mov dh , ypos 
    dec dl 

  
   invoke getarrayval , dh , dl
   
    cmp ah , 2 
    jne moveleftcont
    inc score 
    dec numscore

 moveleftcont :
    cmp ah ,  1
    je skipupmovement 
    call UpdatePlayer 
    dec xPos
    call DrawPlayer
     
    jmp gameLoop

moveRight:
    ; Check if xPos is less than 79 to prevent moving off the right edge
     mov dl , xpos 
    mov dh , ypos 
    inc dl 

  
    invoke getarrayval , dh , dl  

        cmp ah , 2 
    jne moverightcont
    inc score
    dec numscore

 moverightcont :
    cmp ah ,  1
    je skiprightmovement 
    call UpdatePlayer
    inc xPos
    skiprightmovement : 
    call DrawPlayer

        
    jmp gameLoop

	exitGame:
	exit

    noinput :
    



jmp gameloop
Gameover :
    call readChar
    ret
level1 ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; lvl 2 ;;;;;;;;;;;;;;;;;;;;;;;
level2 PROC
    
call drawplayer
gameLoop :  
   
        call loadEnemy2  
       
        call enemyCollide

        call loadEnemy3  
       
        call enemyCollide2

        
           
       ; score 
       mGotoxy 85, 10
       mWrite "Score:" 
            mov eax,score
            call WriteInt

            cmp numscore,0
            je Gameover
            ; 
       mGotoxy 85, 11
       mWrite "Lives:" 
            mov eax, life
            call WriteInt

           ; lives 0 means lost
            cmp life,0
            je exitGame
            ; enemy ;
       
            ; 
    ; input key 
        mov bl , inputchar   
        mov  eax,100          ; sleep, to allow OS to time slice
        call Delay           ; (otherwise, some key presses are lost)
        call ReadKey         ; look for keyboard input
        mov inputchar , al 
        cmp al , 1 
        jne retain 
        mov al , bl
        mov inputchar , bl
        retain : 

        call Randomize


 ; exit game if user types 'x':
    cmp inputChar, "x"
    je exitGame
    cmp inputChar, "p"
    jne con
    call pausepage
    mov pr,1
    call printMap2
    mov pr,0
    call DrawPlayer
    con:
    ; move player based on input
    cmp inputChar, "w"
    je moveUp

    cmp inputChar, "s"
    je moveDown

    cmp inputChar, "a"
    je moveLeft

    cmp inputChar, "d"
    je moveRight

    jmp gameloop

    
moveUp:
    ; Check if yPos is greater than 0 to prevent moving off the top edge
    cmp yPos, 1
    jl gameLoop
    ; collision with walls 
   mov dl , xpos 
    mov dh , ypos 
    dec dh 
   invoke getarrayval2 , dh , dl  
  ; logic to increase score by 1 if 0 is eaten
  cmp ah , 5
  jne cc2
  add score,2
  cc2:
   cmp ah , 2 
    jne moveupcont
    inc score
    dec numscore

 moveupcont :
   
    cmp ah ,  1
    ; end for collision code
    je skipupmovement 
    call UpdatePlayer
    dec yPos
    call DrawPlayer
    skipupmovement : 
    jmp gameLoop

moveDown:
    ; Check if yPos is less than 29 to prevent moving off the bottom edge
    ; collison  
    mov dl , xpos 
    mov dh , ypos 
    inc dh  
    invoke getarrayval2 , dh , dl  
    cmp ah , 5
  jne cc3
  add score,2
  cc3:
        cmp ah , 2 
    jne movedowncont
    inc score 
    dec numscore

 movedowncont :
    cmp ah , 1 
    je skipdownmovement 

    call UpdatePlayer
    inc yPos
    call DrawPlayer
    skipdownmovement : 
    jmp gameLoop

moveLeft:
    ; Check if xPos is greater than 0 to prevent moving off the left edge
     mov dl , xpos 
    mov dh , ypos 
    dec dl 

  
   invoke getarrayval2 , dh , dl  
   cmp ah , 5
  jne cc4
  add score,2
  cc4:
    cmp ah , 2 
    jne moveleftcont
    inc score
    dec numscore

 moveleftcont :
    cmp ah ,  1
    je skipupmovement 
    call UpdatePlayer 
    dec xPos
    call DrawPlayer
     
    jmp gameLoop

moveRight:
    ; Check if xPos is less than 79 to prevent moving off the right edge
     mov dl , xpos 
    mov dh , ypos 
    inc dl 

  
    invoke getarrayval2 , dh , dl  
    cmp ah , 5
  jne cc5
  add score,2
  cc5:
        cmp ah , 2 
    jne moverightcont
    inc score
    dec numscore

 moverightcont :
    cmp ah ,  1
    je skiprightmovement 
    call UpdatePlayer
    inc xPos
    skiprightmovement : 
    call DrawPlayer

        
    jmp gameLoop

	exitGame:
	exit

    noinput :
    



jmp gameloop
Gameover :
    call readChar
    ret
level2 ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; lvl 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
level3 PROC
    
 call DrawPlayer
gameLoop :  
   
            call loadl3Enemy1  
            call loadl3Enemy2  
            call loadl3Enemy3  
            call loadl3Enemy4
            
        call l3enemy1Collide
        call l3enemy2Collide
        call l3enemy3Collide
        call l3enemy4Collide

        
        
           
       ; score 
       mGotoxy 85, 10
       mWrite "Score:" 
            mov eax,score
            call WriteInt

            cmp numscore,0
            je Gameover
            ; 
             mGotoxy 85, 11
       mWrite "Lives:" 
            mov eax, life
            call WriteInt

           ; lives 0 means lost
            cmp life,0
            je exitGame
            ; enemy ;
       
            ; 
    ; input key 
        mov bl , inputchar   
        mov  eax,100          ; sleep, to allow OS to time slice
        call Delay           ; (otherwise, some key presses are lost)
        call ReadKey         ; look for keyboard input
        mov inputchar , al 
        cmp al , 1 
        jne retain 
        mov al , bl
        mov inputchar , bl
        retain : 

        call Randomize


 ; exit game if user types 'x':
    cmp inputChar, "x"
    je exitGame
    cmp inputChar, "p"
    jne con
    call pausepage
    mov pr,1
    call printMap3
    mov pr,0
    call DrawPlayer
    con:
    ; move player based on input
    cmp inputChar, "w"
    je moveUp

    cmp inputChar, "s"
    je moveDown

    cmp inputChar, "a"
    je moveLeft

    cmp inputChar, "d"
    je moveRight

    jmp gameloop

    
moveUp:
    ; Check if yPos is greater than 0 to prevent moving off the top edge
    cmp yPos, 1
    jl gameLoop
    ; collision with walls 
   mov dl , xpos 
    mov dh , ypos 
    dec dh 
   invoke getarrayval3 , dh , dl  
  ; logic to increase score by 1 if 0 is eaten
  cmp ah , 5
  jne cc2
  add score,2
  cc2:
   cmp ah , 2 
    jne moveupcont
    inc score
    dec numscore

 moveupcont :
   
    cmp ah ,  1
    ; end for collision code
    je skipupmovement 
    call UpdatePlayer
    dec yPos
    call DrawPlayer
    skipupmovement : 
    jmp gameLoop

moveDown:
    ; Check if yPos is less than 29 to prevent moving off the bottom edge
    ; collison  
    mov dl , xpos 
    mov dh , ypos 
    inc dh  
    invoke getarrayval3 , dh , dl  
    cmp ah , 5
  jne cc3
  add score,2
  cc3:
        cmp ah , 2 
    jne movedowncont
    inc score 
    dec numscore

 movedowncont :
    cmp ah , 1 
    je skipdownmovement 

    call UpdatePlayer
    inc yPos
    call DrawPlayer
    skipdownmovement : 
    jmp gameLoop

moveLeft:
    ; Check if xPos is greater than 0 to prevent moving off the left edge
     mov dl , xpos 
    mov dh , ypos 
    dec dl 

  
   invoke getarrayval3 , dh , dl  
   cmp ah , 5
  jne cc4
  add score,2
  cc4:
    cmp ah , 2 
    jne moveleftcont
    inc score
    dec numscore

 moveleftcont :
    cmp ah ,  1
    je skipupmovement 
    call UpdatePlayer 
    dec xPos
    call DrawPlayer
     
    jmp gameLoop

moveRight:
    ; Check if xPos is less than 79 to prevent moving off the right edge
     mov dl , xpos 
    mov dh , ypos 
    inc dl 

  
    invoke getarrayval3 , dh , dl  
    cmp ah , 5
  jne cc5
  add score,2
  cc5:
        cmp ah , 2 
    jne moverightcont
    inc score
    dec numscore

 moverightcont :
    cmp ah ,  1
    je skiprightmovement 
    call UpdatePlayer
    inc xPos
    skiprightmovement : 
    call DrawPlayer

        
    jmp gameLoop

	exitGame:
	exit

    noinput :
    



jmp gameloop
Gameover :
    call readChar
    ret
level3 ENDP


main PROC
 INVOKE PlaySound, OFFSET aye, NULL, 11h ;
call frontpage
call menu
     cmp exitflag , 1 
       jne label1 
       call clrscr
       ret
    label1:
    call clrscr
       ; lvl 1
    mov pr,1
    call printMap2
    mov pr,0
    call initenemy
    call level2

    call clrscr
    call lvlpassed
    ; lvl 2 ;
    mov life,3
    mov pr,1
    call printMap2
    mov pr,0
    call initenemy2
    call level2
    
    call clrscr
    call lvlpassed
    ; lvl 3 ;
    mov life,3
    mov pr,1
    call printMap3
    mov pr,0
    push eax 
    push ebx 
    push ecx
    push edx 

    call l3initenemy1
    pop edx
    pop ecx
    pop ebx
    pop eax

     push eax 
    push ebx 
    push ecx
    push edx 
    call l3initenemy2
     pop edx
    pop ecx
    pop ebx
    pop eax
    call l3initenemy3
      push eax 
    push ebx 
    push ecx
    push edx 
    call l3initenemy4
      pop edx
    pop ecx
    pop ebx
    pop eax

       push eax 
    push ebx 
    push ecx
    push edx 
    call level3
      pop edx
    pop ecx
    pop ebx
    pop eax
    
    call clrscr
    call endscreenn
    ;call addtoFile 
ret
main ENDP

frontpage PROC 
       mov dl , 50
       mov dh  , 5 
       call gotoxy
    mov edx , offset front 
        call writestring 
        
       mov  dl,50  ;column
      mov  dh,24  ;row
      call Gotoxy
        mov edx ,offset promptname 
        call writestring 
        mov edx, offset namee
        mov ecx, 255

    call readstring
        call clrscr

frontpage endp 



menu PROC 
menulabel :   
call clrscr
         mov edx , offset front 
        call writestring 
        mov dl ,  10 
        mov dh ,  15
        call gotoxy
        mov edx , offset promptmenu
        call writestring
            call readchar
        cmp al , 50
        je menu_inst
        cmp al , 51
        je menu_exit
           
  
       
        call clrscr
        ret

  menu_exit: 
            mov exitflag  , 1 
            ret

    menu_inst : 
        call clrscr
        mov edx  , offset instructions
        call writestring
        call readchar
        jmp menulabel
        




menu endp 


pausepage PROC 
call clrscr
       mov dl , 50
       mov dh  , 5 
       call gotoxy
    mov edx , offset ppause 
        call writestring 
        
       mov  dl,50  ;column
      mov  dh,24  ;row
      call Gotoxy
        mov edx ,offset promptpause
        call writestring 
        
        call readchar
        mov inputchar,"l"
        call clrscr

        ret
pausepage endp 

lvlpassed PROC 
call clrscr
       mov dl , 50
       mov dh  , 5 
       call gotoxy
    mov edx , offset levelpassed 
        call writestring 
        
       mov  dl,50  ;column
      mov  dh,24  ;row
      call Gotoxy
        mov edx ,offset promptpass
        call writestring 
        
        call readchar
        mov inputchar,"l"
        call clrscr

        ret
lvlpassed endp 

endscreenn PROC 
call clrscr
       mov dl , 50
       mov dh  , 5 
       call gotoxy
    mov edx , offset endscreen 
        call writestring 
        
       mov  dl,50  ;column
      mov  dh,24  ;row
      call Gotoxy
        mov edx ,offset promptend
        call writestring 
        
        mov  dl,50  ;column
      mov  dh,25  ;row
      call Gotoxy
        mov edx ,offset namee
        call writestring 
        mov  dl,50  ;column
      mov  dh,26  ;row
      call Gotoxy
        mov eax ,score
        call writeint

        call readchar
        mov inputchar,"l"
        call clrscr

ret
endscreenn endp 


     DirectonEnemy PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov eup, al

        mov al, down
        mov edown, al

        mov al, left
        mov eleft, al  

        
        mov al, right
        mov eright, al        
        ret
    DirectonEnemy ENDP 
    initEnemy PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax , 0
            jne l2 
                invoke DirectonEnemy, 0,0,1,0
                jmp l3 
            l2 : 
                invoke DirectonEnemy, 0,0,0,1
            l3 : 
            
            
        ret
    initEnemy ENDP

    DirectonEnemy2 PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov eup2, al

        mov al, down
        mov edown2, al

        mov al, left
        mov eleft2, al  

        
        mov al, right
        mov eright2, al        
        ret
    DirectonEnemy2 ENDP 
    initEnemy2 PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax , 0 
            jne l1 
            invoke DirectonEnemy2, 0,0,1,0
                jmp l2 
            l1 : 
             invoke DirectonEnemy2, 0,0,0,1

            l2 : 

            
        ret
    initEnemy2 ENDP

isHurdle PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah , 1
        jne hurdlelabel
      
        hurdlelabel : 
        ret
isHurdle ENDP 

isHurdle2 PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal2, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah , 1
        jne hurdlelabel
    
        hurdlelabel : 
        ret
isHurdle2 ENDP 



DrawPlayer PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"@"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC USES edx eax 
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

DrawEnemy PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,ecol
	mov dh,erow
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
DrawEnemy ENDP

DrawEnemy2 PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,ecol2
	mov dh,erow2
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
DrawEnemy2 ENDP


UpdateEnemy PROC USES edx eax 
	mov dl,ecol
	mov dh,erow
	call Gotoxy
	invoke getArrayVal, dh, dl
    cmp ah,5
    jne cont
    mov al,"*"
    call writechar
    ret
    cont:
    cmp ah,2
    jne cont2
    mov al,"o"
    call writechar
    ret
    cont2:
	mov al," "
	call WriteChar
	ret
UpdateEnemy ENDP

UpdateEnemy2 PROC USES edx eax 
	mov dl,ecol2
	mov dh,erow2
	call Gotoxy
	invoke getArrayVal2, dh, dl
    cmp ah,5
    jne cont
    mov al,"*"
    call writechar
    ret
    cont:
    cmp ah,2
    jne cont2
    mov al,"o"
    call writechar
    ret
    cont2:
	mov al," "
	call WriteChar
	ret
UpdateEnemy2 ENDP



loadEnemy PROC

   


    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdle, ecol , erow , 0, -1
        cmp ah , 1
        je update
        call UpdateEnemy
        dec erow
        call DrawEnemy
       ; mov eax, 100
       ; call Delay
        ret

    Down:
        invoke ishurdle, ecol , erow , 0, 1
        cmp ah ,  1 
        je update
        call UpdateEnemy
        inc erow
        call DrawEnemy
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdle, ecol , erow , -1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy
        sub ecol , 1 
        call DrawEnemy 
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdle, ecol , erow , 1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy
        add ecol , 1
        call DrawEnemy
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadEnemy Endp

loadEnemy2 PROC

   


    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdle2, ecol , erow , 0, -1
        cmp ah , 1
        je update
        call UpdateEnemy
        dec erow
        call DrawEnemy
        ;mov eax, 100
        ;call Delay
        ret

    Down:
        invoke ishurdle2, ecol , erow , 0, 1
        cmp ah ,  1 
        je update
        call UpdateEnemy
        inc erow
        call DrawEnemy
       ; mov eax, 100
       ; call Delay
        ret

    Left:
        invoke ishurdle2, ecol , erow , -1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy
        sub ecol , 1 
        call DrawEnemy 
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdle2, ecol , erow , 1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy
        add ecol , 1
        call DrawEnemy
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadEnemy2 Endp

loadEnemy3 PROC

   


    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdle2, ecol2 , erow2 , 0, -1
        cmp ah , 1
        je update
        call UpdateEnemy2
        dec erow2
        call DrawEnemy2
        ;mov eax, 100
       ; call Delay
        ret

    Down:
        invoke ishurdle2, ecol2 , erow2 , 0, 1
        cmp ah ,  1 
        je update
        call UpdateEnemy2
        inc erow2
        call DrawEnemy2
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdle2, ecol2 , erow2 , -1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy2
        sub ecol2 , 1 
        call DrawEnemy2
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdle2, ecol2 , erow2 , 1, 0
        cmp ah , 1 
        je update
        call UpdateEnemy2
        add ecol2 , 1
        call DrawEnemy2
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadEnemy3 Endp


 

  enemyCollide PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare ecol with al and erow with ah
    cmp ecol, al
    jne noCollision
    cmp erow, ah
    jne noCollision

    ; Collision occurred
    ; add score, 100
    ; dec life
    mov eax, score
    add eax, 100
    mov score, eax
    dec life

    ; Clear the character at (ecol, erow)
    mov al, ecol
    mov ah, erow
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov ecol, 20
    mov erow, 9
    invoke DirectonEnemy, 0, 0, 0, 1

    mov al, 0
    ret

    noCollision:
        mov al, 1
        ret

    mov al, 0
    ret
enemyCollide ENDP


   enemyCollide2 PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare ecol2 with al and erow2 with ah
    cmp ecol2, al
    jne noCollision
    cmp erow2, ah
    jne noCollision

    ; Collision occurred
    ; add score, 100
    ; dec life
   ; mov eax, score
    ;add eax, 100
   ; mov score, eax
    dec life

    ; Clear the character at (ecol2, erow2)
    mov al, ecol2
    mov ah, erow2
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov ecol2, 30
    mov erow2, 25
    invoke DirectonEnemy2, 0, 0, 0, 1

    mov al, 0
    ret

    noCollision:
        mov al, 1
        ret

    mov al, 0
    ret
enemyCollide2 ENDP






    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;  level 3 enemy ftns ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

l3DirectonEnemy1 PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov l3e1up, al

        mov al, down
        mov l3e1down, al

        mov al, left
        mov l3e1left, al  

        
        mov al, right
        mov l3e1right, al        
        ret
l3DirectonEnemy1 ENDP 
l3initEnemy1 PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax, 0 
            jne l1 
            invoke l3DirectonEnemy1, 0,0,1,0
            jmp l2 


            l1 : 
              invoke l3DirectonEnemy1, 0,0,0,1
            l2 :
            
            
        ret
l3initEnemy1 ENDP

l3enemy1Collide PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare l3e1col with al and l3e1row with ah
    cmp l3e1col, al
    jne noCollision
    cmp l3e1row, ah
    jne noCollision

    ; Collision occurred
    ; add score, 100
    ; dec life
    mov eax, score
    add eax, 100
    mov score, eax
    dec life

    ; Clear the character at (l3e1col, l3e1row)
    mov al, l3e1col
    mov ah, l3e1row
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov l3e1col, 20
    mov l3e1row, 9
    invoke l3DirectonEnemy1, 0, 0, 0, 1

    mov al, 0
    ret

    noCollision:
        mov al, 1
        ret

    mov al, 0
    ret
l3enemy1Collide ENDP


 Drawl3Enemy1 PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,l3e1col
	mov dh,l3e1row
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
Drawl3Enemy1 ENDP


Updatel3Enemy1 PROC USES edx eax 
	mov dl,l3e1col
	mov dh,l3e1row
	call Gotoxy
    invoke getArrayVal3, dh, dl
    cmp ah,5
    jne cont
    mov al,"*"
    call writechar
    ret
    cont:
    cmp ah,2
    jne cont2
    mov al,"o"
    call writechar
    ret
    cont2:
	mov al," "
	call WriteChar
	ret
Updatel3Enemy1 ENDP


isHurdlel3e1 PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal3, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah, 1
        jne hurdlelabel
     
        hurdlelabel : 
        ret
isHurdlel3e1 ENDP 

loadl3Enemy1 PROC

    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdlel3e1, l3e1col , l3e1row , 0, -1
        cmp ah , 1
        je update
        call Updatel3Enemy1
        dec l3e1row
        call Drawl3Enemy1
      
        ret

    Down:
        invoke ishurdlel3e1, l3e1col , l3e1row , 0, 1
        cmp ah ,  1 
        je update
        call Updatel3Enemy1
        inc l3e1row
        call Drawl3Enemy1
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdlel3e1, l3e1col , l3e1row , -1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy1
        sub l3e1col , 1 
        call Drawl3Enemy1
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdlel3e1, l3e1col , l3e1row , 1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy1
        add l3e1col , 1
        call Drawl3Enemy1
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadl3Enemy1 Endp

; ghost no. 2 ;


l3DirectonEnemy2 PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov l3e2up, al

        mov al, down
        mov l3e2down, al

        mov al, left
        mov l3e2left, al  

        
        mov al, right
        mov l3e2right, al        
        ret
l3DirectonEnemy2 ENDP 
l3initEnemy2 PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax , 0 
            jne l1 
               invoke l3DirectonEnemy2, 0,0,1,0
               jmp l2  


            l1 :
            invoke l3DirectonEnemy2, 0,0,0,1

            l2 :

          
            
        ret
l3initEnemy2 ENDP


l3enemy2Collide PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare l3e2col with al and l3e2row with ah
    cmp l3e2col, al
    jne noCollision
    cmp l3e2row, ah
    jne noCollision

    ; Collision occurred
    ; add score, 100
    ; dec life
    mov eax, score
    add eax, 100
    mov score, eax
    dec life

    ; Clear the character at (l3e2col, l3e2row)
    mov al, l3e2col
    mov ah, l3e2row
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov l3e2col, 30
    mov l3e2row, 25
    invoke l3DirectonEnemy1, 0, 0, 0, 1

    mov al, 0
    ret

    noCollision:
        mov al, 1
        ret

    mov al, 0
    ret
l3enemy2Collide ENDP



 Drawl3Enemy2 PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,l3e2col
	mov dh,l3e2row
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
Drawl3Enemy2 ENDP


Updatel3Enemy2 PROC USES edx eax 
	mov dl,l3e2col
	mov dh,l3e2row
	call Gotoxy
    invoke getArrayVal3, dh, dl
    cmp al,'*'
    jne cont2
    mov al,"*"
    call writechar
    jmp r
    cont:
    cmp al,'o'
    jne cont2
    mov al,"o"
    call writechar
    jmp r
    
    cont2:
	mov al," "
	call WriteChar
    

    r:
    ret 
Updatel3Enemy2 ENDP


isHurdlel3e2 PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal3, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah, 1
        jne hurdlelabel
    
        hurdlelabel : 
        ret
isHurdlel3e2 ENDP 

loadl3Enemy2 PROC

    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdlel3e2, l3e2col , l3e2row , 0, -1
        cmp ah , 1
        je update
        call Updatel3Enemy2
        dec l3e2row
        call Drawl3Enemy2
        ;mov eax, 100
       ; call Delay
        ret

    Down:
        invoke ishurdlel3e2, l3e2col , l3e2row , 0, 1
        cmp ah ,  1 
        je update
        call Updatel3Enemy2
        inc l3e2row
        call Drawl3Enemy2
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdlel3e2, l3e2col , l3e2row , -1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy2
        sub l3e2col , 1 
        call Drawl3Enemy2
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdlel3e2, l3e2col , l3e2row , 1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy2
        add l3e2col , 1
        call Drawl3Enemy2
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadl3Enemy2 Endp


; ghost no. 3 ;


l3DirectonEnemy3 PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov l3e3up, al

        mov al, down
        mov l3e3down, al

        mov al, left
        mov l3e3left, al  

        
        mov al, right
        mov l3e3right, al        
        ret
l3DirectonEnemy3 ENDP 
l3initEnemy3 PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax , 0 
            jne l1
              invoke l3DirectonEnemy3, 0,0,1,0
              jmp l2 

            l1: 
            invoke l3DirectonEnemy3, 0,0,0,1

            l2 :

          
            
        ret
l3initEnemy3 ENDP


l3enemy3Collide PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare l3e3col with al and l3e3row with ah
    cmp l3e3col, al
    jne noCollisionL3E3
    cmp l3e3row, ah
    jne noCollisionL3E3

    ; Collision occurred
    ; add score, 100
    ; dec life
    mov eax, score
    add eax, 100
    mov score, eax
    dec life

    ; Clear the character at (l3e3col, l3e3row)
    mov al, l3e3col
    mov ah, l3e3row
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov l3e3col, 3
    mov l3e3row, 5
    invoke l3DirectonEnemy3, 0, 0, 0, 1

    mov al, 0
    ret

noCollisionL3E3:
    mov al, 1
    ret

    mov al, 0
    ret
l3enemy3Collide ENDP


 Drawl3Enemy3 PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,l3e3col
	mov dh,l3e3row
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
Drawl3Enemy3 ENDP


Updatel3Enemy3 PROC USES edx eax 
	mov dl,l3e3col
	mov dh,l3e3row
	call Gotoxy
    invoke getArrayVal3, dh, dl
    cmp al,'*'
    jne cont
    mov al,"*"
    call writechar
    ret
    cont:
    cmp al,'o'
    jne cont2
    mov al,"o"
    call writechar
    ret
    cont2:
	mov al," "
	call WriteChar
	ret
Updatel3Enemy3 ENDP


isHurdlel3e3 PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal3, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah, 1
        jne hurdlelabel
       
        hurdlelabel : 
        ret
isHurdlel3e3 ENDP 

loadl3Enemy3 PROC

    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdlel3e3, l3e3col , l3e3row , 0, -1
        cmp ah , 1
        je update
        call Updatel3Enemy3
        dec l3e3row
        call Drawl3Enemy3
        ;mov eax, 100
       ; call Delay
        ret

    Down:
        invoke ishurdlel3e3, l3e3col , l3e3row , 0, 1
        cmp ah ,  1 
        je update
        call Updatel3Enemy3
        inc l3e3row
        call Drawl3Enemy3
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdlel3e3, l3e3col , l3e3row , -1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy3
        sub l3e3col , 1 
        call Drawl3Enemy3
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdlel3e3, l3e3col , l3e3row , 1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy3
        add l3e3col , 1
        call Drawl3Enemy3
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadl3Enemy3 Endp


; ghost no. 4 ;


l3DirectonEnemy4 PROC, up:BYTE,down:BYTE,left:BYTE,right:BYTE
        mov al, up
        mov l3e4up, al

        mov al, down
        mov l3e4down, al

        mov al, left
        mov l3e4left, al  

        
        mov al, right
        mov l3e4right, al        
        ret
l3DirectonEnemy4 ENDP 
l3initEnemy4 PROC 
            call Randomize
            mov  eax,2
            call RandomRange
            cmp eax , 0 

            jne l1 
                invoke l3DirectonEnemy4, 0,0,1,0
                jmp l2 

                l1: 
                  invoke l3DirectonEnemy4, 0,0,0,1
                l2 : 

         
            
        ret
l3initEnemy4 ENDP

l3enemy4Collide PROC
    mov ecx, 0
    mov edx, 0

    mov al, xpos
    mov ah, ypos

    ; Compare l3e4col with al and l3e4row with ah
    cmp l3e4col, al
    jne noCollisionL3E4
    cmp l3e4row, ah
    jne noCollisionL3E4

    ; Collision occurred
    ; add score, 100
    ; dec life
    mov eax, score
    add eax, 100
    mov score, eax
    dec life

    ; Clear the character at (l3e4col, l3e4row)
    mov al, l3e4col
    mov ah, l3e4row
    mGotoxy al, ah
    mov al, ' '
    call WriteChar

    ; Reset enemy position
    mov l3e4col, 35
    mov l3e4row, 1
    invoke l3DirectonEnemy4, 0, 0, 0, 1

    mov al, 0
    ret

noCollisionL3E4:
    mov al, 1
    ret

    mov al, 0
    ret
l3enemy4Collide ENDP


 Drawl3Enemy4 PROC USES edx eax 
	; draw player at (xPos,yPos):
	mov dl,l3e4col
	mov dh,l3e4row
	call Gotoxy
	mov al,"E"
	call WriteChar
	ret
Drawl3Enemy4 ENDP


Updatel3Enemy4 PROC USES edx eax 
	mov dl,l3e4col
	mov dh,l3e4row
	call Gotoxy
    invoke getArrayVal3, dh, dl
    cmp al,'*'
    jne cont
    mov al,"*"
    call writechar
    ret
    cont:
    cmp al,'o'
    jne cont2
    mov al,"o"
    call writechar
    ret
    cont2:
	mov al," "
	call WriteChar
	ret
Updatel3Enemy4 ENDP


isHurdlel3e4 PROC, co:BYTE, r:BYTE, colAdd:BYTE, rowAdd:BYTE
        mov dl, co
        mov dh, r
        
        add dl, colAdd
        add dh, rowAdd
        
        invoke getArrayVal3, dh, dl    ; return character in al and hurdle info in ah 
        cmp ah, 1
        jne hurdlelabel
  
        hurdlelabel : 
        ret
isHurdlel3e4 ENDP 

loadl3Enemy4 PROC

    mov eax , 5
    call RandomRange

    cmp al,1
    je Left

    cmp al,2
    je Right

    cmp al,3
    je Up

    cmp al,4
    je Down

    jne update

    Up:
        invoke ishurdlel3e4, l3e4col , l3e4row , 0, -1
        cmp ah , 1
        je update
        call Updatel3Enemy4
        dec l3e4row
        call Drawl3Enemy4
        ;mov eax, 100
       ; call Delay
        ret

    Down:
        invoke ishurdlel3e4, l3e4col , l3e4row , 0, 1
        cmp ah ,  1 
        je update
        call Updatel3Enemy4
        inc l3e4row
        call Drawl3Enemy4
        ;mov eax, 100
        ;call Delay
        ret

    Left:
        invoke ishurdlel3e4, l3e4col , l3e4row , -1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy4
        sub l3e4col , 1 
        call Drawl3Enemy4
        ;mov eax, 100
        ;call Delay
        ret

    Right:
        invoke ishurdlel3e4, l3e4col , l3e4row , 1, 0
        cmp ah , 1 
        je update
        call Updatel3Enemy4
        add l3e4col , 1
        call Drawl3Enemy4
        ;mov eax, 100
        ;call Delay
        ret

         update:
            mov eax , 5
            call RandomRange
            

        ret


loadl3Enemy4 Endp













END main


