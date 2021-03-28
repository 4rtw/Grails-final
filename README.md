# Grails - Groupe 6
Ce projet a été réalisé par les étudiants du groupe 6  

05 - ANDRIAMIHARIMANANA Ando Lalaina  
11 - MANANDRAIBE Nelson Johnatan  
33 - RAMAROSON Andon’ny Aina Michael  
43 - RANDRIANIRINA Andy Nasandratra  
44 - RANDRIANJAFY Stephane Michel
## Lecoincoin [https://lecoincoin-grp-6.herokuapp.com/projet](https://lecoincoin-grp-6.herokuapp.com/projet)
### 1) Aperçu
#### Login screen
![Login](Screenshots/Login_Screen.PNG?raw=true "Login")
#### Home screen
![Home](Screenshots/Home_screen.PNG?raw=true "Home")
### 2) Réalisations
#### 2.1) - Besoins fonctionnels
##### a) Backend
###### Sécurité  

- [x] Couche de sécurité `spring-security-core`  
- [x] 3 rôles disponibles`ADMIN` `MODERATOR` `CUSTOMER`  
- [x] Seuls l'user avec le rôle `ADMIN` ou `MODERATOR` peut accéder au backend  
- [x] `Login` et `Logout` fonctionnels  
###### Fonctionnalités  
- [x] Gestion des annonces avec leurs illustrations  
- [x] Toutes les opérations `CRUD` sur les **utilisateurs**, les **annonces**, les **illustrations**  
###### Les Bonus (selon le cahier des charges)
- [x] Recherche et filtre simple sur les annonces  
- [x] Déployement sur Heroku  
###### Autres
- [x] Stockage des fichiers sur `Amazon S3`
- [x] Persistance `MySQL` hébergé sur [AlwaysData](https://www.alwaysdata.com/fr/)
##### b) Frontend
- [ ] Aucune réalisation
##### c) API Rest
###### Sécurité
Pour s'authentier sur l'API, il faut utiliser la methode `POST` sur http://lecoincoin-grp-6.herokuapp.com/projet/api/login avec en body  
`{
    "username": "admin",
    "password": "password"
}`
- [x] Sécurité `spring-security-rest`  
###### Fonctionnalités
- [x] Disponible sur l'adresse [http://lecoincoin-grp-6.herokuapp.com/projet/api](http://lecoincoin-grp-6.herokuapp.com/projet/api)
- [x] Capable de renvoyer du `JSON` et du `XML`
- [X] GET/POST/PUT/PATCH/DELETE sur l'(es) **annonce(s)** et l'(es) **utilisateur(s)**
- [X] Collection POSTMAN: [Documentation](postman/Collection/ProjetMBDSGroupe6CollectionPM.postman_collection.json)
#### 2.2) - Besoins non fonctionnels
- [x] Design - [Template Kiaalap](https://github.com/puikinsh/kiaalap)
### Ce qu'on aurait pu faire de plus
- [ ] Gestion du mot de passe vide sur la fonctionnalité `Update user`
- [ ] Filtre dans le sens inverse (ordre décroissant sur les filtres)
