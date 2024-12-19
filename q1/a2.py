with open('words.txt', 'r') as file:
    lines = file.readlines()
count = 0
for line in lines:
    count= count + line.lower().count('twinkle')    
print(f'{count} twinkle')