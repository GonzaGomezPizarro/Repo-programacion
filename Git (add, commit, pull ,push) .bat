@echo off
title GIT AUTOMATICO (add, commit, pull, push)...
echo.
echo -----------------------------------
echo -             HOLA                -
echo -----------------------------------

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
echo  - Ejecutando comandos...

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
echo -     git pull     -
echo --------------------
echo.
git pull

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
echo  Presione una tecla para terminar...
pause>nul