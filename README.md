
# 🧪 Exercise 0 – Git it Online!

## 🗒️ Objective
Create a brand-new Git repository from scratch, add a simple file or edit a README, commit your changes, and **push it to your own GitHub profile**. This is your first full Git cycle!

---

## 🛠️ Step-by-Step Instructions

### 1. Create a New Project Folder
Open a terminal and run:
```bash
mkdir Git_Exercise
cd Git_Exercise
```

---

### 2. Initialize a Git Repository
```bash
git init
```

---

### 3. Add a File

Create a simple Python file:
```bash
echo 'print("Hello, Git!")' > hello.py
```



---

### 4. Stage and Commit Your Work
```bash
git add .
git commit -m "Initial commit with hello world"
```

---

### 5. Create a Repository on GitHub
- Go to [GitHub](https://github.com)
- Click **"New repository"**
- Name it something like `Git_Exercise`
- **Do NOT** initialize it with a README

---

### 6. Connect Local Repo to GitHub
```bash
git remote add origin https://github.com/<your-username>/Git_Exercise.git
```
> Replace `<your-username>` with your GitHub handle

---

### 7. Push Your Code to GitHub
```bash
git push -u origin main
```

> ⚠️ If you get an error about `main` not existing, rename your branch first:
```bash
git branch -M main
git push -u origin main
```

---

## ✅ Success Criteria
- Your repository is visible on your GitHub profile
- It contains either `hello.py` or a `README.md`
- The commit history shows your initial commit

---

## 🎯 Bonus (Optional)
- Clone your own repo into a new folder and run the file
- Add a second file and practice making a second commit

---

Happy first push! 🚀
