# Docker lancement de fichiers php

## Auteur

Florian IMPROVISATO

## Description

Ce projet fut réalisé dans le cadre d'un  cours de mise en production délivré à Polytech Nancy.

Le but de celui-ci est de lancer deux containers docker permettant d'un coté de créer un système de messagerie, le container rabbitmq, et l'autre permettant de faire appel à des fonctions php, le container video-php-app . Le but des fichiers php étant de convertir un fichier video .mp4 en .mov.

Nous utiliserons pour cela différents fichiers indispensables au bon fonctionnement de docker:

- `Dockerfile` : fichier de configuration utilisé pour créer une image Docker
- `docker-compose.yaml` : fichier contenant les configurations nécessaires pour l'exécution de plusieurs conteneurs
- `server.php` et `client.php`: fichiers php contenant les fonctions pour convertir et envoyer une vidéo


## Les prérequis
La liste des applications qui doivent être installées sur la machine :
1. Docker
2. Git


## Comment build les deux containers ?
1. Ouvrir l'application Docker
2. Cloner le repertoire git dans un terminal

```sh
$ git clone https://github.com/flo1207/php-app.git
```

3. Se rendre dans le dossier `php-app`
4. Lancer la commande 

```sh
$ docker-compose up --build
```

5. Une fois que les deux conteneurs sont builds, on lance la commande dans deux terminaux:

```sh
$ docker run -it php-app-phpapp bash
```

6. Dans le premier terminal, on lance la commande:

```sh
$ php server.php
```

7. Dans le second terminal, on lance la commande:

```sh
$ php client.php
```

8. On peut verifier que les deux containers sont bien entrain de run en utilisant la commande hors container:

```sh
$ docker ps
```

9. Pour `arrêter` les processus, on utilise la commande:

```sh
$ docker-compose down
```

## Comment build un container avec  le `Dockerfile` ?
1. Ouvrir l'application Docker
2. Cloner le repertoire git dans un terminal

```sh
$ git clone https://github.com/flo1207/php-app.git
```

3. Se rendre dans le dossier `php-app`
4. Lancer la commande de build

```sh
$ docker build -t video-php-app .
```
5. Executer la commande pour lancer le container

```sh
$ docker run -d -p 8080:80 --name video-php-container video-php-app
```