@echo off
title GIT AUTOMATICO (add, commit, pull, push)...
echo.
echo  HOLA, ejecutando comandos... 
echo.

git add .
git commit -m "Repositorio atualizado"
git pull
git push

echo.
echo Proceso finalizado... revise errores
echo.
echo  Presione una tecla para continuar...
pause>nul