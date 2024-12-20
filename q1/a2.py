#讀取file
with open('words.txt', 'r') as file:
    lines = file.readlines()
count = 0
#將所有字母轉成小寫後進行配對
for line in lines:
    count= count + line.lower().count('twinkle')    
print(f'{count} twinkle')