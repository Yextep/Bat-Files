@echo off

@REM Selecciona el color rojo para la visualizacion del texto en la consola.
color 04


@REM Menu de opciones para en usuario.
:menu
echo Eliminar Archivos temporales:
echo ---------------------------------
echo Elija una opcion:
echo 1) temp.
echo 2) temp2.
echo 3) prefetch.
echo 4) Todos los anteriores.
echo 5) Cerrar.

@REM Creo una variable que pide que el usuario digite una opcion
SET /p opcion=

@REM Condicionales que validan si el usuario digito una de las opciones. Goto lo dirige a una de las opciones creadas con la etiquerta :opcionn
if %opcion%==1 goto opcion1
if %opcion%==2 goto opcion2
if %opcion%==3 goto opcion3
if %opcion%==4 goto opcion4
if %opcion%==5 goto opcion5

@REM Condicional que valida si la opcion digitada por el usuario es valida o no.
if %opcion% NEQ 5 goto error

@REM Codigo de las opciones que el usuario puede elegir, elimina los archivos que se encuentran dentro de la  carpeta seleccionada.
:opcion1
cls
del c:\Windows\Temp /f /s /q
rd c:\Windows\Temp /s /q
goto menu2

:opcion2
cls
del C:\Users\%username%\AppData\Local\Temp /f /s /q
rd C:\Users\%username%\AppData\Local\Temp /s /q
goto menu2

:opcion3
cls
del C:\Windows\Prefetch /f /s /q
rd C:\Windows\Prefetch /s /q
goto menu2

:opcion4
cls
del c:\Windows\Temp /f /s /q
del C:\Users\%username%\AppData\Local\Temp /f /s /q
del C:\Windows\Prefetch /f /s /q

rd c:\Windows\Temp /s /q
rd C:\Users\%username%\AppData\Local\Temp /s /q
rd C:\Windows\Prefetch /s /q
goto menu2

:opcion5
exit

@REM Opcion en caso de error al diginar un dato no valido.
:error
echo --------------------------------
echo ERROR! Elija una opcion valida entre 1 y 5:
goto menu

@REM Menu para saber si el uduario desea continuar
:menu2
echo Desea continuar? (S/N)

@REM Variable para pedir y almacenar un string para definir si el usuario desea o no continuar
SET /p opcionxx=

@REM Condicionales para validar si el usuario desea o no continuar y asi cerrar el programa o redirigirlo al programa nuevamente
if %opcionxx%==S goto menu
if %opcionxx%==s goto menu
if %opcionxx%==N exit
if %opcionxx%==n exit

