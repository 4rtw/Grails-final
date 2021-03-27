# Grails - Groupe 6
Ce projet a été réalisé par les étudiants du groupe 6  

05 - ANDRIAMIHARIMANANA Ando Lalaina  
11 - MANANDRAIBE Nelson Johnatan  
33 - RAMAROSON Andon’ny Aina Michael  
43 - RANDRIANIRINA Andy Nasandratra  
44 - à completer
## Lecoincoin
### 1) Aperçu
#### Login screen
![Alt text](Screenshots/Login_Screen.PNG?raw=true "Optional Title")
#### Home screen
![Alt text](Screenshots/Home_Screen.PNG?raw=true "Optional Title")
### 2) Réalisations
#### 2.1) - Besoins fonctionnels
##### a) Backend
######Sécurité
-[x] Couche de sécurité `spring-security-core`
-[x] 3 rôles `ADMIN` `MODERATOR` `CLIENT`
-[x] Seuls l'user avec le rôle '`ADMIN` et le `MODERATOR` peuvent accéder au backend
-[x] Login/Logout
######Fonctionnalités
-[x] Gestion des annonces et de leurs illustrations
-[x] Toutes les opérations `CRUD` sur les **utilisateurs**, les **annonces**, les **illustrations**
######Les Bonus (selon le cahier des charges)
-[ ] Sécurité `spring-security-rest`
-[x] Moteur de recherche pour filtrer les annonces sur leur titre
-[ ] Déployement sur Heroku
##### b) Frontend
-[ ] Aucune réalisation
##### c) API Rest
-[x] Disponible sur l'adresse [http://localhost:8081/projet/api](http://localhost:8081/projet/api)
-[x] Capable de renvoyer du `JSON`
-[X] GET/POST/PUT/PATCH/DELETE sur l'(es) **annonce(s)** et l'(es) **utilisateur(s)**
-[X] Collection POSTMAN: [Résultats des tests](postman/TestResult/ProjetMBDSGroupe6CollectionPM.postman_test_run.json) et [Documentation](postman/Collection/ProjetMBDSGroupe6CollectionPM.postman_collection.json)
#### 2.2) - Besoins non fonctionnels
-[x] Design - [Template Kiaalap](https://github.com/puikinsh/kiaalap)
### Ce qu'on aurait pu faire de plus
-[ ] Hebergement sur Heroku
-[ ] Gestion du mot de passe vide sur la fonctionnalité `Update user`
