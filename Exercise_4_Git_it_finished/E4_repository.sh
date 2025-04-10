#!/bin/bash

# Step 1: Create and Initialize a New Git Repository
mkdir E4_repository
cd E4_repository
git init

echo "Setting up the Git exercise..."

git switch -c master
# Create readme
cat > README.md << 'EOF'
# Git Big Data Exercise
EOF

git add README.md
git commit -m "Initial commit"

git switch -c BOSS_FILE
git switch -c READ_LOREM_IPSUM
# ----------------------------------- boss ----------------------------------- #
git switch BOSS_FILE


# Step 2: Create the CSV File (Boss's Data)
lorem_text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sollicitudin turpis ut augue lacinia at ullamcorper dolor condimentum. Nunc elementum suscipit laoreet. Phasellus vel sem justo, a vulputate arcu. Sed rutrum elit nec elit lobortis ultrices. Quisque elit nulla, rutrum et varius sit amet, pulvinar eget purus. Aliquam erat volutpat. Fusce turpis lectus, vestibulum sed ornare sed, facilisis sit amet lacus. Nunc lobortis posuere ultricies. Phasellus aliquet cursus gravida. Curabitur eu erat ac augue rutrum mattis. Suspendisse sit amet urna nec velit commodo feugiat. Maecenas vulputate dictum diam, eu tempor erat volutpat in. Donec id nulla tortor, nec iaculis nibh. Pellentesque scelerisque nisl sit amet ligula dictum commodo. Donec porta mi in lorem porttitor id suscipit lacus auctor."
repeat=250000
output_file="Lorem ipsum.txt"

# Clear or create the output file
: > "$output_file"

echo "Creating the text file '$output_file'..."
# Append the text to the file repeat times, without newlines
for ((i=1; i<=$repeat; i++))
do

  printf "%s" "$lorem_text" >> "$output_file"
  # Print progress
    if ((i % 2500 == 0))
    then
        # Calculate the percentage of completion
        percentage=$((i * 100 / repeat))
        echo -ne "Creating file: $percentage%\r"

        
    fi
done

echo "Text file '$output_file' created."

git add "$output_file"
git commit -m "Add the boss's data file"

git rm "$output_file"
git add .
git commit -m "Update woops"

# Step 3: Switch to a New Branch
git switch READ_LOREM_IPSUM

# Step 4: Make a lorem ipsum reading script output
cat > read_lorem.py << 'EOF'
from collections import Counter
import re


def analyze_text(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        text = f.read()

    # 1. Character count
    char_count = len(text)
    print(f"Character Count: {char_count}")

    # 2. Word list (split on non-alphabetic characters, ignoring case)
    words = re.findall(r'\b\w+\b', text.lower())
    word_count = len(words)
    print(f"Word Count: {word_count}")

    # 3. Unique word count
    unique_word_count = len(set(words))
    print(f"Unique Word Count: {unique_word_count}")

    # 4. Most common words
    word_freq = Counter(words)
    most_common_words = word_freq.most_common(5)  # top 5
    print(f"Most Common Words: {most_common_words}")

    # 5. Sentence count (very rough approximation)
    sentences = re.split(r'[.!?]+', text)
    # remove empty entries
    sentence_count = len([s for s in sentences if s.strip()])
    print(f"Sentence Count (approx): {sentence_count}")

    # 6. Average words per sentence
    avg_words_per_sentence = word_count / sentence_count if sentence_count else 0
    print(f"Avg Words per Sentence: {avg_words_per_sentence:.2f}")

    # 7. Average word length
    total_word_length = sum(len(word) for word in words)
    avg_word_length = total_word_length / word_count if word_count else 0
    print(f"Avg Word Length: {avg_word_length:.2f}")

    # 8. Lexical diversity
    lexical_diversity = unique_word_count / word_count if word_count else 0
    print(f"Lexical Diversity: {lexical_diversity:.2f}")

    # 9. Reading time (rough estimate, 250 wpm -> words/250)
    reading_time_minutes = word_count / 250
    print(f"Estimated Reading Time: {reading_time_minutes:.2f} minute(s)")


if __name__ == "__main__":
    analyze_text("Lorem ipsum.txt")

EOF

echo "Python script 'read_lorem.py' created."


# Step 5: Add the Files to the Staging Area
git add read_lorem.py
git commit -m "Add the lorem ipsum reading script"

# Step 6: Switch to the Boss's File Branch
git switch master

# Step 7: Locate the Boss's File and the python script to analyze it

