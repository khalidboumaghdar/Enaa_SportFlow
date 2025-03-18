# SportFlow - Plateforme de Gestion des Clubs et Entraîneurs

**SportFlow** est une plateforme web conçue pour gérer les clubs, les entraîneurs et les séances d'entraînement. Elle offre un suivi structuré et automatisé de la gestion des plannings d'entraînement, des membres et des entraîneurs, tout en respectant l'architecture **MVC** pour une séparation claire des préoccupations.

## Technologies Utilisées
- **Backend** : Java EE (Servlets, Filtres, JSP, JDBC), Maven
- **Base de données** : MySQL
- **Frontend** : HTML, CSS, Bootstrap, JavaScript
- **Serveur d'application** : Apache Tomcat
- **Outils de développement** : IntelliJ

## Fonctionnalités
- **Opérations CRUD** pour les Membres, Entraîneurs et Séances.
- **Authentification** et gestion des rôles pour les Entraîneurs et les Membres.
- **Gestion des sessions** pour les plannings d'entraînement.
- **Interface utilisateur responsive** avec Bootstrap.

## Architecture
L'application suit l'architecture **MVC** :
- **Modèle** : Représente la logique métier et les entités de la base de données telles que `Membre`, `Entraîneur`, et `Séance`.
- **Vue** : Les pages JSP représentant l'interface utilisateur.
- **Contrôleur** : Les servlets Java qui gèrent les requêtes utilisateur et la logique métier.

## Diagrammes UML

Voici les diagrammes UML illustrant la structure et les interactions du système :

### 1. Diagramme de Classes
Ce diagramme montre les relations entre les principales entités du système telles que `Membre`, `Entraîneur` et `Séance`.

<img width="368" alt="image" src="https://github.com/user-attachments/assets/225db1d6-1c1c-44d2-8dd0-8a025fcf9a59" />


### 2. Diagramme de Cas d'Utilisation
Le diagramme de cas d'utilisation montre les interactions entre les acteurs (Membres, Entraîneurs, Administrateurs) et les fonctionnalités principales du système.

<img width="545" alt="image" src="https://github.com/user-attachments/assets/657757b0-5387-4ae6-bc21-d1e2aa5128cc" />

### 3. Diagramme de Séquence
Le diagramme de séquence montre les processus clés comme l'inscription d'un membre et la planification d'une séance.

<img width="481" alt="image" src="https://github.com/user-attachments/assets/6a3beef6-43c2-4a08-9980-6f7ccdd0cb7e" />

## Instructions d'Installation

### 1. Cloner le Dépôt
```bash
git clone https://github.com/khalidboumaghdar/Enaa_SportFlow.git
