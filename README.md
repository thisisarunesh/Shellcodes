## About
Shellcode is a sequence of bytes that represent a payload in the context of exploiting vulnerabilities in software. It is crafted specifically to be loaded into memory and executed directly by the processor.
## Usage
To compile:
```bash
gcc -nostdlib -static -m32 <source_name> -o <destination_name>
```
To extract the opcodes:
```bash
objdump -d <destination_name> | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-6 -d' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\x/g' | paste -d '' -s | sed 's/^/"/' | sed 's/$/"/g'
```

## Disclaimer
Unauthorized use of this code in real-world scenarios can be illegal and unethical. Always ensure you have explicit permission before testing security vulnerabilities. Use this information responsibly and only in controlled environments for educational or research purposes.