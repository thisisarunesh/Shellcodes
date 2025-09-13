## Usage
To compile:
```bash
gcc -nostdlib -static -m32 <source_name> -o <destination_name>
```
To extract the opcodes:
```bash
objdump -d <destination_name> | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-6 -d' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\x/g' | paste -d '' -s | sed 's/^/"/' | sed 's/$/"/g'
```