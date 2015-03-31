# Sitio Web

Repositorio del sitio Web del grupo de usuarios de PHP en Puebla
(www.comunidadphppuebla.com).

## Instalación

Primero descarga el archivo `.phar` de [Sculpin][1]

```bash
$ curl -O https://download.sculpin.io/sculpin.phar
```

Después copia el archivo a la carpeta `/bin` del proyecto y
dale permisos de ejecución:

```bash
$ mv sculpin.phar bin/sculpin
$ chmod u+x bin/sculpin
```

Una vez que tienes el ejecutable listo, lo que sigue es instalar el
sitio:

```bash
$ php bin/sculpin install
```

Puedes previsualizar el sitio en [http://localhost:8000/][2] usando
el siguiente comando:

```bash
$ php bin/sculpin generate --watch --server
```

## Pláticas

Para proponer una plática debes hacer un Pull Request a este
repositorio e incluir:

* Nombre
* Duración (15 min., 30 min. o 1 hora)
* Resumen y objetivos

El archivo que debes modificar está en la carpeta
`source/_views/meetups`. Por ejemplo, si quieres presentar
una plática para la última semana del mes de mayo de 2015, el
archivo a modificar debe llamarse `2015-05.html.twig`.


## Artículos

Otra forma de contribuir es escribiendo un artículo en el blog.
Todos tus posts incluyen tu nombre, tus datos de redes sociales
y tu página Web para darte crédito y agradecer tu colaboración

Para publicar un post debes crear un archivo Markdown en la carpeta
`source/_posts` con el formato `año-mes-dia-titulo-del-post.md`
y hacer un Pull Request para que quede publicado.

## Comunidad

Eres bienvenido si quieres agregar tus datos de contacto en la
página de nosotros. Para esto debes crear un archivo con extensión
`.html.twig` en la carpeta `source/views/team`. Un ejemplo de
nombre de archivo sería `awesomedev.html.twig`.

Una vez que tienes tu archivo con tus datos de contacto debes
agregarlo al archivo `source/nosotros.html`. Son tres perfiles por
`row`.

```twig
<div class="row">
    {% include 'team/dev1.html.twig' %}
    {% include 'team/dev2.html.twig' %}
    {% include 'team/your_awesome_profile.html.twig' %}
</div>
```

Puedes ubicarlo en la sección de la página que corresponda:

* En *Organizadores* si quieres ayudarnos con las actividades del grupo.
* En *Ponentes* si vas a presentar una plática.
* En *Autores* si vas a publicar un post.
* En *Comunidad* si quieres compartir tu información con el grupo.

[1]: https://sculpin.io
[2]: http://localhost:8000/
