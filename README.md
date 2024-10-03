# Linux C-Compiler

---

![License](https://img.shields.io/github/license/Redstoneur/Linux_C-Compiler)
![Top Language](https://img.shields.io/github/languages/top/Redstoneur/Linux_C-Compiler)
![Size](https://img.shields.io/github/repo-size/Redstoneur/Linux_C-Compiler)
![Contributors](https://img.shields.io/github/contributors/Redstoneur/Linux_C-Compiler)
![Last Commit](https://img.shields.io/github/last-commit/Redstoneur/Linux_C-Compiler)
![Issues](https://img.shields.io/github/issues/Redstoneur/Linux_C-Compiler)
![Pull Requests](https://img.shields.io/github/issues-pr/Redstoneur/Linux_C-Compiler)

---

![Forks](https://img.shields.io/github/forks/Redstoneur/Linux_C-Compiler)
![Stars](https://img.shields.io/github/stars/Redstoneur/Linux_C-Compiler)
![Watchers](https://img.shields.io/github/watchers/Redstoneur/Linux_C-Compiler)

---

![Latest Release](https://img.shields.io/github/v/release/Redstoneur/Linux_C-Compiler)
![Release Date](https://img.shields.io/github/release-date/Redstoneur/Linux_C-Compiler)

---

This project provides a bash script for compiling and running C programs on Linux.

## Features

- Compile a C program
- Run a compiled C program
- Display help information
- Display version information
- Install gcc compiler if not already installed
- Support for OpenMP
- Additional test files

## Usage

```bash
./Compiler.bash <compilation order> <source file>
```

### Available commands:

- `-h, --help`: displays help
- `-v, --version`: displays the version
- `-c, --compile`: compiles a program
- `-e, --exec`: compiles and runs a program
- `-i, --install`: installs the gcc compiler

## Installation

1. Clone the repository

    ```bash
    git clone https://github.com/Redstoneur/Linux_C-Compiler.git Linux_C-Compiler
    cd Linux_C-Compiler
    ```

2. Make the script executable

    ```bash
    chmod +x Compiler.bash
    ```

3. Make the script available globally

    ```bash
    sudo cp Compiler.bash /usr/local/bin/Compiler
    ```

4. Run the script

    ```bash
    Compiler --help
    ```

5. Uninstall the script

    ```bash
    sudo rm /usr/local/bin/Compiler
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

