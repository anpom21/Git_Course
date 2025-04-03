#!/bin/bash

# Step 1: Create and Initialize a New Git Repository
mkdir E1_repository
cd E1_repository
git init

echo "Setting up the Git exercise..."

# Step 2: Create the CSV File (Boss's Data)
echo "5, 8, 13, 17, 21, 34, 55, 89, 144, 233, 377" > numbers.csv
git add numbers.csv
git commit -m "Add numbers.csv with provided list"

# Step 3: Create prime_number.py
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
git commit -m "Add prime number filtering function"

# Step 4: Create fibonacci_number.py
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
git commit -m "Add Fibonacci number filtering function"

# Step 5: Create main.py (Initial Version)
cat > main.py <<EOL
import csv
from prime_number import get_prime_numbers
from fibonacci_number import get_fibonacci_numbers

# Read numbers from CSV
with open("numbers.csv", newline='') as csvfile:
    numbers = [int(num.strip()) for num in csvfile.read().split(",")]

print(numbers)

EOL
git add main.py
git commit -m "Add script to import numbers.csv"

# Step 6: Rename prime_number.py to primes.py (Colleague Mistake)
git mv prime_number.py primes.py
git commit -m "Rename prime_number.py to primes.py"

# Step 7: Delete fibonacci_number.py (Colleague Mistake)
git rm fibonacci_number.py
git commit -m "fibonacci_number.py is probably not needed"

# Step 8: Modify main.py to reflect incorrect rename
cat > main.py <<EOL
import csv
from primes import get_prime_numbers  
from fibonacci_number import get_fibonacci_numbers  

# Read numbers from CSV
with open("numbers.csv", newline='') as csvfile:
    numbers = [int(num.strip()) for num in csvfile.read().split(",")]

primes = get_prime_numbers(numbers)

print("Prime Numbers:", primes)
EOL
git add main.py
git commit -m "Update main.py "

# Step 9: Delete primes.py (Another Colleague Mistake!)
git rm primes.py
git commit -m "Prime updated"

# Done! Output instructions for the student
echo "--------------------------------------------------"
echo "Git repository setup is complete!"
echo "Students should now clone the repository and restore the missing files."
echo "--------------------------------------------------"

# Instructions to push this repository to GitHub (Manual Step)
echo "To push this repository to GitHub, run:"
echo "git remote add origin <your-github-repo-url>"
echo "git push -u origin main"
