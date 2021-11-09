@echo off
title GIT AUTOMATICO (add, commit, pull, push)...
echo.
echo ------------------------------------
echo -   HOLA, ejecutando comandos...   -
echo ------------------------------------

echo.
echo --------------------
echo -    git status    -
echo --------------------
git status
echo.
echo ----------------------------------------------------------------------------------
echo  -   Seguro desea agregar estos cambios??
echo  -   Presione cualquier tecla para agregar o cierre el programa para cancelar 
echo ----------------------------------------------------------------------------------
pause>nul

echo.
echo -------------------
echo -    git add .    -
echo -------------------
git add .

echo.
echo -------------------
echo -  git commit -m  - 
echo -------------------
echo.
git commit -m "Repositorio atualizado"

echo.
echo --------------------
echo -     git push     -
echo --------------------
echo.
git push

echo.
echo ----------------------------------------
echo - Proceso finalizado... revise errores -
echo ----------------------------------------
echo.
echo  Presione una tecla para continuar...
pause>nul