.MODEL SMALL
.STACK 100H
.DATA
HEADING DB 10,13,10,13,'                  Welcome To SSUET Medical Store      $',10,13     ; starting string 
PROMPT_CHOICE DB 10,13,10,13,'Enter your Choice:  $'           ; Choice for user input               

; Medicines list with prices
MED1 DB 10,13,'                   1.Panadol                  10/-                     $'   ; 1st string declared for medicine name
MED2 DB 10,13,'                   2.Naproxen                 20/-                     $'   ; 2nd string declared for medicine name
MED3 DB 10,13,'                   3.T-Day                    30/-                     $'   ; 3rd string declared for medicine name
MED4 DB 10,13,'                   4.Dispirin                 40/-                     $'   ; 4th string declared for medicine name
MED5 DB 10,13,'                   5.Folic Acid               50/-                     $'   ; 5th string declared for medicine name
MED6 DB 10,13,'                   6.Flagyl                   90/-                     $'   ; 6th string declared for medicine name


; Messages
INVALID_OPTION DB 10,13,10,13,'  Invalid option selected $'      ; Message for invalid option selection
AGAIN DB 10,13,'  Enter Again $'                                 ; Prompt to enter again
PROMT_ORDER DB 10,13,10,13,'Enter medicine number for order: $'  ; Prompt to enter medicine number
QUANTITY DB 10,13,'Quantity: $'                                  ; Prompt for quantity of the medicine
TOTAL_PRICE DB 10,13,'Total Price: $'                            ; Prompt to display the total price
BACK_MENU DB 10,13,10,13,'1.Go Back to Main Menu$'               ; Option to go back to main menu
EXIT_PRG DB 10,13,'2.EXIT$'                                      ; Option to exit the program
END_MSG DB 10,13,10,13,'                  Thank you for shopping...!      $'  ; Exit message
STRING_PKR DB ' PKR $'                                             ; Currency symbol (PKR)

CRLF DB 10,13,10,13,' $'                                           ; Line break for formatting in output

.CODE

; Macro to display messages
DISPLAY MACRO MSG
    LEA DX, MSG              ; Load address of message
    MOV AH, 9                ; interrupt to display string
    INT 21H                  ; Display the message
ENDM

; Function to calculate price
CALCULATE PROC
    MOV AH, 1                ; Read quantity from user input
    INT 21H                  ; interrupt to read input
    AND AL, 0Fh              ; Convert the hex numbers into integer
    MUL BL                   ; Multiply price (stored in BL) with quantity (stored in AL)
    AAM                      ; Adjust AX for two-digit decimal i.e 45 in AX will be shown as AH=04, AL=05
    MOV CX, AX               ; Store the result in CX for later use
    RET
CALCULATE ENDP               ; End of calculation function

; Function to print total price
PRINT_TOTAL PROC
    OR CX, 3030h             ; Convert integer number into hex number
    DISPLAY TOTAL_PRICE      ; Display string "Total Price:"
    MOV AH, 2                ; interrupt to print a character
    MOV DL, CH               ; Print the high byte (tens digit)
    INT 21H                  ; Print the character
    MOV DL, CL               ; Print the low byte (ones digit)
    INT 21H                  ; Print the character
    MOV DL, '0'              ; Append a '0' to the output
    INT 21H                  ; Print the '0'
    MOV DL, 00               ; Print space after price
    INT 21H
    MOV DL, '/'              ; Print '/'
    INT 21H
    MOV DL, '-'              ; Print '-'
    INT 21H
    DISPLAY STRING_PKR       ; Display "PKR"
    RET
PRINT_TOTAL ENDP             ; End of total price printing function

; Main procedure
MAIN PROC
    MOV AX, @DATA            ; Initialize the data segment
    MOV DS, AX
    
    ; Display welcome message and menu
    DISPLAY HEADING          ; Display "Welcome to SSUET Medical Store"
    DISPLAY CRLF             ; Display a line break
    DISPLAY MED1             ; Display the first medicine option
    DISPLAY MED2             ; Display the second medicine option
    DISPLAY MED3             ; Display the third medicine option
    DISPLAY MED4             ; Display the fourth medicine option
    DISPLAY MED5             ; Display the fifth medicine option
    DISPLAY MED6             ; Display the sixth medicine option
    
    DISPLAY PROMT_ORDER      ; Prompt for entering the medicine order/number
    MOV AH, 1                ; Read input from user
    INT 21H                  ; interrupt to get user input
    MOV BL, AL               ; Store the input in BL
    AND BL, 0Fh              ; Convert the ASCII input to integer
    
    ; Handle different medicine prices based on user input
    CMP BL, 1                ; Compare if input is 1 (Panadol)
    JE MED_10                ; Jump to Panadol price calculation if equal
    
    CMP BL, 2                ; Compare if input is 2 (Naproxen)
    JE MED_20                ; Jump to Naproxen price calculation if equal
    
    CMP BL, 3                ; Compare if input is 3 (T-Day)
    JE MED_30                ; Jump to T-Day price calculation if equal
    
    CMP BL, 4                ; Compare if input is 4 (Dispirin)
    JE MED_40                ; Jump to Dispirin price calculation if equal
    
    CMP BL, 5                ; Compare if input is 5 (Folic Acid)
    JE MED_50                ; Jump to Folic Acid price calculation if equal
    
    CMP BL, 6                ; Compare if input is 6 (Flagyl)
    JE MED_90                ; Jump to Flagyl price calculation if equal

    JMP INVALID_MEDICINE     ; Jump to handle invalid medicine selection

; Price calculations for each medicine
MED_10:
    MOV BL, 1                ; Set price of Panadol 
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu

MED_20:
    MOV BL, 2                ; Set price of Naproxen
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu

MED_30:
    MOV BL, 3                ; Set price of T-Day 
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu

MED_40:
    MOV BL, 4                ; Set price of Dispirin 
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu

MED_50:
    MOV BL, 5                ; Set price of Folic Acid 
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu

MED_90:
    MOV BL, 9                ; Set price of Flagyl 
    DISPLAY QUANTITY         ; Prompt for quantity
    CALL CALCULATE           ; Call the calculation function
    CALL PRINT_TOTAL         ; Call PRINT_TOTAL function to print the total price
    JMP BACK                 ; Jump to the back menu


; Handle invalid input , if user selects an invalid medicine number
INVALID_MEDICINE:
    DISPLAY INVALID_OPTION    ; Display "Invalid option selected"
    DISPLAY AGAIN             ; Prompt "Enter Again"
    JMP MAIN                  ; Jump back to the main menu

; Back to main menu
BACK:
    DISPLAY BACK_MENU         ; Display the option to go back to the main menu
    DISPLAY EXIT_PRG          ; Display the option to exit the program
    DISPLAY PROMPT_CHOICE     ; Display prompt for user to choose
    
    MOV AH, 1                 ; Read user input
    INT 21H                   ; interrupt to get input from the user
    AND AL, 0Fh               ; Convert the ASCII input to integer
    
    CMP AL, 1                 ; Compare if user selected option 1 (Go back to main menu)
    JE MAIN                   ; Jump to the main menu if equal
    
    CMP AL, 2                 ; Compare if user selected option 2 (Exit program)
    JE EXIT                   ; Jump to exit procedure if equal
    
    JMP INVALID_MENU          ; If invalid input, go to invalid menu handling

INVALID_MENU:
    DISPLAY INVALID_OPTION    ; Display "Invalid option selected"
    DISPLAY AGAIN             ; Prompt "Enter Again"
    JMP BACK                  ; Jump back to the menu

; Exit program
EXIT:
    DISPLAY END_MSG           ; Display thank you message
    MOV AH, 4CH               ; DOS interrupt to exit the program
    INT 21H                   ; Terminate the program

MAIN ENDP
END MAIN
