
# 🚀 Student’s Mission

### 1. Create the repository from the script
```bash
chmod +x E3_repository.sh
./E3_repository.sh
```

### 2. Investigate the branch structure:
```bash
git branch -a
```

### 3. Find where the missing files are:

```bash
git checkout PRIME
ls  # prime_number.py should be here
```

```bash
git checkout FIBO
ls  # fibonacci_number.py should be here
```
HINT: If the file is not in the current commit maybe it was deleted in a previous commit. Look through the history and look for supicious changes.
### 4. Merge the missing files into main:
No hints for this one go figure this one out yourself :)

### 5. Fix `main.py` to integrate both files:
Open `main.py` and modify it to include both functions:
```python
import csv
from prime_number import get_prime_numbers
from fibonacci_number import get_fibonacci_numbers

# Read numbers from CSV
with open("numbers.csv", newline='') as csvfile:
    numbers = [int(num.strip()) for num in csvfile.read().split(",")]

primes = get_prime_numbers(numbers)
fibonacci = get_fibonacci_numbers(numbers)

print("Prime Numbers:", primes)
print("Fibonacci Numbers:", fibonacci)
```

### 6. Commit and push the final solution:
You can do this yourself :)

---

# 💡 What Students Learn

✅ Branch navigation (`git checkout`, `git branch -a`)  
✅ Finding missing files in Git branches  
✅ Merging branches properly (`git merge`)  
✅ Integrating functions from different branches into a working `main.py`  
✅ Real-world Git teamwork problem solving  

