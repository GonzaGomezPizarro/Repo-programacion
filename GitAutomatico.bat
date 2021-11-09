@echo off
title GIT AUTOMATICO (add, commit, pull, push)...
echo.
echo ------------------------------------
echo -   HOLA, ejecutando comandos...   -
echo ------------------------------------

echo.
echo -------------------
echo -    GIT ADD .    -
echo -------------------
git add .

echo.
echo -------------------
echo -  GIT COMMIT -M  - 
echo -------------------
echo.
git commit -m "Repositorio atualizado"

echo.
echo --------------------
echo -     GIT PULL     -
echo --------------------
echo.
git pull

echo.
echo --------------------
echo -     GIT PUSH     -
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