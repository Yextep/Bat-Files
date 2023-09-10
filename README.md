
 # Colección .bat útiles para automatización de tareas y procesos.
 
**'Bat'** es la abreviatura de **'batch file'** o **'archivo de lotes'**, y básicamente consiste en un archivo de texto que ejecuta secuencias de comandos, con el objetivo, habitualmente, de **Automatizar Tareas** que requieran un largo número de instrucciones (desde renombrado masivo de archivos a la instalación de un programa); así, al recurrir a un ***.bat**, bastará con escribirlo una vez y podremos ahorrar tiempo y **Evitar errores tipográficos.** 

Efectivamente, su utilidad apenas difiere de la de un **Script de PowerShell** o de Bash (en el caso de que uses WSL/Linux), sólo que en el caso de los **BAT** el encargado de ejecutarlo será **CMD.EXE**, también conocido como el **'Símbolo del Sistema'**.[Leer Más](https://es.wikipedia.org/wiki/Archivo_batch) 

<img align="center" height="480" width="1000" alt="GIF" src="https://github.com/ArisGuimera/ArisGuimera/assets/114537444/3ef8d293-9c0a-477e-a1e1-42a45c5cb4f8"/>

## 💡 Cómo crear un batch?
La respuesta es muy sencilla, creamos un **Documento de texto** plano. Como el documento de texto es una hoja en blanco donde ni siquiera se le 
puede dar **formato** (formato = forma) mas que a la **fuente** (fuente = letra), no es como el Word con todos esos botones y colores. Una vez que creamos el “documento de texto” con una **Secuencia de comandos** adentro, cambiamos la extensión del archivo a **.bat**.

## ¿Cómo cambiar la extensión del archivo?

Muy fácil, si el documento de texto se llama **“nuevo documento de texto.txt”,** apretamos sobre el Botón derecho a propiedades a donde dice **“nuevodocumentodetexto.txt”** lo cambiamos por **“nuevo documento de texto.bat”**, el truco es cambiar el archivo **“xxxxx.txt”** a **“xxxxx.bat”**, cuando lo hagas una ventanita te va a preguntar si estas seguro, como seguro no hay nada en la vida clickea **“si”**, vas a ver como cambia el icono de una hoja a una **ventanita**.

## Scripts .Bat

En este repositorio encontrarás varios **Scripts** para que pruebes el poder de la **Secuencia de comandos** generada por un simple bloc de notas, solo elije uno de tu preferencia, y empieza a practicar como quieras, en caso de que no encuentres uno en específico puedes buscarlo en internet o también puedes crearlos para **automatizar** las **tareas** que necesites

<img align="center" height="524" width="1000" alt="GIF" src="https://github.com/ArisGuimera/ArisGuimera/assets/114537444/edf22f69-d7c0-404b-86e9-55eb71cf4741"/>

## 📚 Ejemplo

En este ejemplo, el archivo **.Bat** Abre la página principal de este **Sitio Web** u otro que se especifique en el **Navegador predeterminado.**

```bash
@echo off
START https://google.com/
```
