#!/bin/bash

# This script allows to compile a C program.
# It compiles the program into an executable and runs it.

version="v1.0.0"

# if there are no arguments, display a help message
if [ $# -eq 0 ]; then
  echo "Usage: $0 <compilation order> <source file>"
  echo "This script allows to compile a C program"
  echo "For help type: $0 -h"
# if there is 1 argument
elif [ $# -eq 1 ]; then
  # check if $1 is equal to -h or --help
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 <compilation order> <source file>"
    echo "Available commands:"
    echo "    -h, --help: displays help"
    echo "    -v, --version: displays the version"
    echo "    -c, --compile: compiles a program"
    echo "    -e, --exec: compiles and runs a program"
    echo "    -i, --install: installe un programme de compilation C (gcc)"
  # check if $1 is equal to -v or --version
  elif [ "$1" = "-v" ] || [ "$1" = "--version" ]; then
    echo "Version : $version"
  # check if $1 is equal to -c or --compile
  elif [ "$1" = "-c" ] || [ "$1" = "--compile" ]; then
    echo "Usage: $0 -c <source file>"
    echo "This script allows to compile a C program"
    echo "For help type: $0 -h"
  # check if $1 is equal to -e or --exec
  elif [ "$1" = "-e" ] || [ "$1" = "--exec" ]; then
    echo "Usage: $0 -e <source file>"
    echo "This script allows to compile and run a C program"
    echo "For help type: $0 -h"
  # check if $1 is equal to -i or --install
  elif [ "$1" = "-i" ] || [ "$1" = "--install" ]; then
    echo "Il faut être root pour installer gcc"
    echo "Les gcc est nécessaire pour compiler un programme en C"
    echo ""
    echo "Voulez-vous installer gcc ? (o/n)"
    # shellcheck disable=SC2162
    read reponse
    if [ "$reponse" = "o" ]; then
      echo "Installation des programmes de dépendances"
      sudo echo "Lancement de l'installation"

      # si sur une distribution basé sur debian
      if [ -f /etc/debian_version ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(dpkg-query -W -f='${Status}' gcc 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
          sudo apt-get install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur redhat
      elif [ -f /etc/redhat-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(rpm -qa | grep -c gcc) -eq 0 ]; then
          sudo yum install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur archlinux
      elif [ -f /etc/arch-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(pacman -Q | grep -c gcc) -eq 0 ]; then
          sudo pacman -S gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur gentoo
      elif [ -f /etc/gentoo-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(emerge --info | grep -c gcc) -eq 0 ]; then
          sudo emerge gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur slackware
      elif [ -f /etc/slackware-version ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        # shellcheck disable=SC2010
        if [ $(ls /var/log/packages | grep -c gcc) -eq 0 ]; then
          sudo slackpkg install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur suse
      elif [ -f /etc/SuSE-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(zypper search -i | grep -c gcc) -eq 0 ]; then
          sudo zypper install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur fedora
      elif [ -f /etc/fedora-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(rpm -qa | grep -c gcc) -eq 0 ]; then
          sudo yum install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur ubuntu
      elif [ -f /etc/lsb-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(dpkg-query -W -f='${Status}' gcc 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
          sudo apt-get install gcc -y
        else
          echo "gcc est déjà installé"
        fi

      # si sur une distribution basé sur mandriva
      elif [ -f /etc/mandriva-release ]; then
        # installation des programmes de dépendances
        # vérification de l'installation de gcc
        # shellcheck disable=SC2046
        if [ $(rpm -qa | grep -c gcc) -eq 0 ]; then
          sudo urpmi gcc -y
        else
          echo "gcc est déjà installé"
        fi

      else
        echo "Votre distribution n'est pas supporté par ce script"
      fi
    else
      echo "Installation annulée"
    fi
  else
    echo "Error: invalid argument"
  fi
# if there are 2 arguments
elif [ $# -eq 2 ]; then
  # check the first argument
  # check if $1 is equal to -c or --compile or -e or --execute
  if [ "$1" = "-c" ] || [ "$1" = "--compile" ] || [ "$1" = "-e" ] || [ "$1" = "--exec" ]; then
    # check if the file exists
    if [ -f "$2" ]; then
      # verify that the file is a C program
      if [ "${2: -2}" != ".c" ]; then
        echo "Error: The file is not a C program"
        exit 1
      fi

      # get the file name without the extension
      file_name=$(basename "$2" .c)
      # compile the program with or without OpenMP support
      if grep -q -e "#include <omp.h>" -e "#pragma omp" "$2"; then
        gcc -g -Wall -Wextra -Werror -fopenmp -o "$file_name" "$2"
      else
        gcc -g -Wall -Wextra -Werror -o "$file_name" "$2"
      fi
      # check if the compilation was successful
      # shellcheck disable=SC2181
      if [ $? -eq 0 ]; then
        echo "Compilation successful"
        echo ""
        # check if $1 is equal to -c or --compile
        if [ "$1" = "-c" ] || [ "$1" = "--compile" ]; then
          ls -alF "$file_name"
        # check if $1 is equal to -e or --exec
        elif [ "$1" = "-e" ] || [ "$1" = "--exec" ]; then
          # run the program
          ./"$file_name"
        fi
      else
        echo "Error: Compilation failed"
      fi
    else
      echo "Error: The file does not exist"
    fi
  else
    echo "Error: invalid argument"
  fi
else
  echo "Error: There are too many arguments"
fi
