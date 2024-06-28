# Description

The `Calculator.asm` file is an assembly language program for a simple calculator that can perform addition, subtraction, multiplication, and division. The program continuously prompts the user for input until the user decides to exit by entering a specific termination value (-666). Here’s a breakdown of the file:

#### Sections:
1. **section .text**: Contains the main code of the program.
2. **section .data**: Contains static data used in the program.
3. **section .bss**: Defines variables that are uninitialized but will be used in the program.

#### Main Components:

1. **_start**:
   - Entry point of the program.
   - Initializes a counter to keep track of the number of operations performed.

2. **loop**:
   - Main loop of the program.
   - Displays a welcome message and prompts the user to enter two numbers.
   - Reads and validates the input. If the user enters -666, the program exits.

3. **Operation Selection**:
   - Prompts the user to choose an operation (addition, subtraction, multiplication, or division).
   - Depending on the user's choice, the corresponding operation is performed.

4. **Addition**:
   - Increments the operation counter.
   - Adds the two numbers and displays the result.

5. **Subtraction**:
   - Increments the operation counter.
   - Subtracts the second number from the first and displays the result.

6. **Multiplication**:
   - Increments the operation counter.
   - Multiplies the two numbers and displays the result.

7. **Division**:
   - Checks if the divisor is zero and handles the error.
   - Increments the operation counter.
   - Divides the first number by the second, displaying both the quotient and remainder.

8. **Error Handling**:
   - Handles invalid input and displays appropriate error messages.
   - Prompts the user to re-enter valid input.

9. **Exit**:
   - Displays an exit message and the total number of operations performed.
   - Terminates the program.

#### Data Section (`section .data`):
- Contains predefined messages used throughout the program for prompts and results.

#### BSS Section (`section .bss`):
- Defines uninitialized variables for storing user input, the remainder of division, and the operation counter.

This program demonstrates the use of basic assembly language constructs such as loops, conditional statements, function calls, and handling user input/output. It also includes error handling and ensures the user cannot perform invalid operations like division by zero.
