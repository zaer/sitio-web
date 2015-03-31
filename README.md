# Sitio Web

Repositorio del sitio Web del grupo de usuarios de PHP en Puebla
(www.comunidadphppuebla.com).

## Instalación

Para trabajar con el sitio Web debes tener instalado PHP 5.5 o
superior y [Composer][3]. Si ya los tienes instalados, el siguiente
comando descargará [Sculpin][1] y configurará el sitio:

```bash
$ make install
```

Después de instalar puedes previsualizar el sitio con el comando:

```bash
$ make run
```

Después simplemente revisa el sitio en [http://localhost:8000][2].

## Cómo participar

### Con una plática

Para proponer una plática debes hacer un Pull Request a este
repositorio. El archivo que debes modificar está en la carpeta
`source/_views/meetups`.

Por ejemplo, si quieres presentar una plática para la última
semana del mes de mayo de 2015, el archivo a modificar debe
llamarse `2015-05.html.twig`.

Puedes usar como guía el archivo
`source/_views/meetups/2015-04.html.twig`, tu propuesta de plática
debe incluir:

* Nombre
* Duración (15 min., 30 min. o 1 hora)
* Resumen y objetivos

### Con un artículo en el blog

Otra forma de contribuir es escribiendo un artículo en el blog.
Todos tus posts incluyen tu nombre, tus datos de redes sociales
y tu página Web para darte crédito y agradecer tu colaboración.

Para publicar un post debes crear un archivo [Markdown][4] en la
carpeta `source/_posts` con el formato
`año-mes-dia-titulo-del-post.md` y hacer un Pull Request para que
lo publiquemos.

Por ejemplo, si quieres hacer un post sobre cómo instalar PHP
usando Ansible, tu archivo podría llamarse
`2015-05-25-instalar-php-con-ansible.md`.

Para que tus datos de contacto aparezcan en el post debes
agregarlos en la carpeta `source/_views/team`. Puedes agregar los
links a las cuentas de redes sociales y sitios Web que desees, los
íconos son de Font Awesome y puedes revisar cuales están disponibles
[aquí][5]. Para el nombre del archivo puedes usar el nombre de
alguna de tus cuentas de redes sociales, yo por ejemplo uso
`montealegreluis`, así que el nombre del archivo con mis datos de
contacto es `montealegreluis.html.twig`, ese mismo nombre debes usar
en tu post para que tus datos se carguen bien.

```
---
title: Cómo instalar PHP usando Ansible
author: montealegreluis
```

Tus datos de contacto requieren de una foto tuya de 100px por 100px.
Puedes agregarla al repositorio en la carpeta `source/images/community`
de preferencia usando el mismo nombre que usas para los posts, en mi
caso el archivo se llama `montealegreluis.jpg`. Si estás usando un
servicio como Gravatar, no necesitas agregar fotografía al repositorio
y puedes indicar el tamaño agregando al final de la URL `?s=100`.

Por último y como una forma más de reconocer tu colaboración puedes
agregar tu perfil en la sección de **Autores** en la página que está en
`source/nosotros.html`, agregando el *include* con tu perfil, por ejemplo
`{% include 'team/montealegreluis.html.twig' %}`. Puedes tomar de guía
la sección de **Organizadores**.

### Compartiendo tus datos con la comunidad

Eres bienvenido si quieres agregar tus datos de contacto en la
página de nosotros. Para esto debes crear un archivo con extensión
`.html.twig` en la carpeta `source/views/team`. Un ejemplo de
nombre de archivo sería `awesomedev.html.twig`. Los detalles del perfil
son los mismo que explicamos para los autores de posts en la sección
anterior.

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
[3]: https://getcomposer.org/doc/00-intro.md
[4]: https://guides.github.com/features/mastering-markdown/
[5]: http://fortawesome.github.io/Font-Awesome/icons/#brand
