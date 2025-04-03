#!/bin/bash

# Step 1: Create and Initialize a New Git Repository
mkdir E3_repository
cd E3_repository
git init

echo "Setting up the Git exercise..."

# Step 2: Create the CSV File (Boss's Data)
echo "5, 8, 13, 17, 21, 34, 55, 89, 144, 233, 377" > numbers.csv
git add numbers.csv
git commit -m "Add numbers.csv with provided list"

# Step 3: Create the 'PRIME' Branch and Implement Prime Functionality
git switch -c PRIME

cat > prime_number.py <<EOL
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def get_prime_numbers(numbers):
    return [num for num in numbers if is_prime(num)]
EOL

git add prime_number.py
git commit -m "Add prime number filtering function in PRIME branch"

# Step : Rename prime_number.py to primes.py (Colleague Mistake)
git mv prime_number.py code_encryptor.py
git commit -m "Code encryptor update"

# Step 4: Create the 'FIBO' Branch and Implement Fibonacci Functionality
git switch master  # Switch back to master first
git switch -c FIBO

cat > fibonacci_number.py <<EOL
def is_fibonacci(n):
    a, b = 0, 1
    while b < n:
        a, b = b, a + b
    return b == n

def get_fibonacci_numbers(numbers):
    return [num for num in numbers if is_fibonacci(num)]
EOL

git add fibonacci_number.py
git commit -m "Add Fibonacci number filtering function in FIBO branch"

# Step : Delete fibonacci_number.py (Colleague Mistake)
git rm fibonacci_number.py
git commit -m "Fibo update"

# Step 5: Create the 'main' Branch and Implement the Base Script
git switch master  # Switch back to main

cat > main.py <<EOL
import csv
from prime_number import prime
from fibonacci_number import fibonacci
# Read numbers from CSV
with open("numbers.csv", newline='') as csvfile:
    numbers = [int(num.strip()) for num in csvfile.read().split(",")]

print("Numbers from CSV:", numbers)

# Print primes found in numbers
primes = [num for num in numbers if is_prime(num)]
print("Primes:", primes)

# Print fibonacci numbers found in numbers
fibonacci = [num for num in numbers if is_fibonacci(num)]
print("Fibonacci numbers:", fibonacci)

EOL

git add main.py
git commit -m "Add base script to import numbers.csv in master branch"

# Step 6: Simulate Repository Confusion (Files Lost in master)
git checkout master

# Simulate renaming mistake (PRIME branch content missing in main)
echo "# Missing prime_number.py" > missing_primes.txt
git add missing_primes.txt
git commit -m "Log missing prime_number.py"

# Simulate deletion mistake (FIBO branch content missing in main)
echo "# Missing fibonacci_number.py" > missing_fibonacci.txt
git add missing_fibonacci.txt
git commit -m "Log missing fibonacci_number.py"

# Done! Output instructions for the student
echo "--------------------------------------------------"
echo "Git repository setup is complete!"
echo "You should now restore the missing files from the PRIME and FIBO branches."
echo "--------------------------------------------------"
