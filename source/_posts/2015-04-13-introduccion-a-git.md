---
title: Introducción a Git
author: montealegreluis
tags:
    - git
categories:
    - Control de versiones
use:
    - posts_categories
    - posts_tags
---

Este es el primer post de una serie, donde te explicaré qué es Git
y cómo utilizarlo en tus proyectos. Primero debes instalar Git en
tu computadora. En [esta página][2] hay instrucciones para instalarlo
en Windows, Linux y Mac. Si ya lo tienes instalado ¡empecemos!

## ¿Cómo funciona Git?

Revisemos un ejemplo, supongamos que estás escribiendo un aplicación
Web. ¿Cómo guardarías tus modificaciones si no tuvieras una
herramienta para eso?. Lo más simple sería que crearas una copia en
otra carpeta para saber cual era el estado de tu proyecto en ese
momento.

```bash
$ cp -R app app.bak
```

Cuando creas copias de esta manera, revertir los cambios o revisar las
diferencias de una versión a otra, son tareas relativamente simples.
Si empiezan a ser demasiadas copias lo más probable es que tu siguiente
paso sea numerarlas o ponerles la fecha en la que creaste la copia.

```bash
$ cp -R app app.2015-05-01.bak
```

Con este esquema simple incluso podríamos compartir código con otros
desarrallodores. Lo que tendrías que hacer es subir un archivo `.zip`
con tu proyecto a un servidor Web, alguien más lo descarga y crea una
copia del proyecto, realiza sus cambios, y te los envía por correo
(en un archivo generado por el comando [diff][1] por ejemplo),
aplicas los cambios a tu proyecto original, vuelves a subir el
proyecto y repites el proceso.

```bash
$ wget http://example.com/app.2015-05-01.zip
$ unzip app.2015-05-01.zip
$ cp -R app.2015-05-01 app-copy
$ cd app-copy
$ # change something...
$ diff app-copy app.2015-05-01 > change.patch
$ # email change.patch
```

Este proceso es en escencia la forma en la que trabaja Git, cuando le
pides que guarde una *copia* de tu proyecto, crea un archivo con la
información necesaria para saber como se veían tus archivos en ese punto.

Git es entonces, **una herramienta para guardar, comparar y mezclar
copias o versiones de un proyecto**. A estas copias también se les conoce
como *snapshots* o instantáneas.

## ¿Cómo empiezo a usar Git?

Para empezar a trabajar con Git necesitas un *repositorio Git*, el cual
es una carpeta con los datos de las versiones que estás guardando.

### git init

La forma más simple de crear un repositorio es *inicializarlo* desde
una carpeta existente. Supongamos que tienes un proyecto PHP con un
archivo.

```bash
$ cd app
$ ls
hello-world.php
```

Para empezar a llevar el control de versiones con Git en este proyecto
debes ejecutar:

```bash
$ git init
Initialized empty Git repository in /home/luis/app/.git/
```

Esto creará una carpeta `.git` dónde se guardarán los datos de las
versiones que vayas guardando de tu proyecto.

### Manejo de versiones básico

Todos los repositorios de Git tienen 3 *áreas*, la primero es el *directorio
de trabajo*, donde están los archivos de tu proyecto, la segunda es el
`index`, también conocida como área de *staging*, que contiene los cambios
que quieres guardar, y a la última se le conoce como `HEAD` que apunta al
`index` que tiene los cambios más recientes.

<img src="/images/content/arboles-git.png" class="img-responsive img-rounded center-block" alt="Árboles Git">

### git add

En Git debes agregar tus archivos al área de *staging* antes de que puedas
guardarlos. Si el archivo es nuevo debes ejecutar `git add`. Si el archivo
ya forma parte de una versión anterior y solo contiene modificaciones,
también debes usar `git add` para llevar el registro de esos cambios.

Si volvemos a nuestro ejemplo, tenemos por lo menos un archivo nuevo
(en un estado *untracked*) al que queremos dar seguimiento (pasarlo al
estado *tracked*)

```bash
$ git add hello-world.php
```

### git status

El comando `git status` te permite ver cuál es el estado del área de
*staging* en comparación con el área de trabajo. Si usas la opción
`-s`, el comando producirá una salida corta. Por ejemplo, si hubieras
ejecutado este comando antes del `git add` la salida hubiera sido:

```bash
$ git status -s
?? hello-world.php
```

Los símbolos `??` significan que al archivo no se le está dando seguimiento
(está en un estado *untracked*) y por lo tanto los cambios a ese archivo no
serán guardados por Git. Ahora, si le das seguimiento al archivo con
`git add` y revisas su estado la salida sería la siguiente:

```bash
$ git add hello-world.php
$ git status -s
A  hello-world.php
```

La `A` indica que el archivo está en el área de *staging* (en un estado
*tracked*) y que sus cambios serán registrados por Git. Supongamos que el
contenido del archivo `hello-world.php` es el siguiente:

```php
<?php
echo 'Hello world!';
```

Y que decides modificarlo de la siguiente manera:

```php
<?php
print 'Hello world!';
```

Si ejecutas `git status -s` verás la siguiente salida:

```bash
AM hello-world.php
```

La primera columna se refiere al área de *staging* y la segunda es del
directorio de trabajo, esto sígnifica que el archivo fue agregado al
área de staging (`A`) pero que contiene modificaciones en el área de
trabajo (`M`). Por lo tanto, en este momento, Git guardaría el archivo
con el `echo` porque es lo que se guardó en el área de *staging*, si
quisieras guardar el archivo con el `print`,  lo tienes que volver a
agregar para dejarlo de nuevo en el área de *staging*.

```bash
git add hello-world.php
git status -s
A hello-world.php
```

La nueva salida indica que tanto el área de *staging* como nuestra copia
de trabajo son iguales, y que todos los cambios serán guardados por Git.

### git diff

El comando `git diff` sirve, entre otras cosas, para mostrar la diferencia
entre lo que está en el área de *staging* y lo que está modificado pero
no se le está dando seguimiento (*unstaged*).

Cuando ejecutas el comando `git diff` sin argumentos, te mostrará qué
código ha cambiado en tu proyecto que no se ha agregado al área de
*staging*.

Por ejemplo si hubieras ejecutado un `git diff` antes del segundo `git add`
la salida hubiera sido la siguiente:

```bash
$ git diff
diff --git a/hello-world.php b/hello-world.php
index 9d68457..a64b94c 100644
--- a/hello-world.php
+++ b/hello-world.php
@@ -1,2 +1,2 @@
 <?php
-echo 'Hello world!';
+print 'Hello world!';
```

Las últimas dos líneas muestran la diferencia en el contenido del archivo
`hello-world.php` entre el área de *staging* (la línea que inicia con un
`-`) y el área de trabajo (la línea que inicia con un `+`).

Este comando también te permite saber que contenido moviste al área de
*staging* si usas la opción `--cached`. Por ejemplo, si ejecutas el
comando después de agregar el cambio del `print` por el `echo`, la salida
sería la siguiente:

```bash
$ git diff --cached
diff --git a/hello-world.php b/hello-world.php
new file mode 100644
index 0000000..a64b94c
--- /dev/null
+++ b/hello-world.php
@@ -0,0 +1,2 @@
+<?php
+print 'Hello world!';
```

### git commit

Una vez que agregas el contenido que quieres guardar en el área de
*staging*, debes ejecutar `git commit` para guardar los cambios.

Git guarda tu nombre y correo por cada cambio (commit). Así que
primero debes decirle a Git tus datos:

```bash
$ git config --global user.name 'Thomas Anderson'
$ git config --global user.email neo@thematrix.com
```

Además de tus datos Git necesita un mensaje que resuma los cambios que
incluye tu *commit*, el mensaje lo puedes pasar usando la opción `-m`.

```bash
$ git commit -m "Add 'Hello world' example."
```

Este primer *commit* se convierte en el índice `HEAD` de tu repositorio.
Ahora que hemos guardado nuestra primera versión. Si ejecutamos `git status`
verás que tienes un directorio de trabajo *limpio*, lo que significa que no
hemos hecho cambios desde el último commit.

```bash
$ git status
# On branch master
nothing to commit (working directory clean)
```

En la siguiente imagen puedes revisar la secuencia de comandos de este
tutorial.

<img src="/images/content/comandos-git.gif" class="img-responsive img-rounded center-block" alt="Comandos Git">

Hasta aquí llegamos con el primer post de la serie, en el siguiente post
veremos como revisar el historial de commits en un repositorio, como deshacer
cambios en el área de staging, y que pasa con otras operaciones a archivos
como copiar o eliminar.

Si tienes alguna duda o comentario, te puedes poner en contacto conmigo,
mis datos están al inicio de este post del lado derecho. O me puedes dejar
un comentario, cualquier duda, crítica o reclamación es bienvenida.

[1]: http://www.computerhope.com/unix/udiff.htm
[2]: http://git-scm.com/book/es/v1/Empezando-Instalando-Git
