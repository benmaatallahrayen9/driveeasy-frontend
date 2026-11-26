# DriveEasy Frontend

Interface Angular 22 pour l'application de location. Elle contacte l'API Gateway sur `http://localhost:8080/api`.

## Demarrage

Depuis le dossier DriveEasy, utiliser le profil VS Code `DriveEasy: Run & Debug` et appuyer sur **F5**. Le script telecharge Node.js 22.22.3 en version portable dans `.runtime/` au premier lancement, installe les dependances npm, puis lance Angular avec le backend.

Ouvrir `http://localhost:4200`. Le backend doit deja tourner. Aucun changement global dans Windows et aucune activation de script PowerShell ne sont necessaires.

Arret : utiliser la tache VS Code `DriveEasy: Stop stack`.

## Ecrans

- Tableau de bord : parc, locations, revenus et activite.
- Vehicules : recherche, ajout, modification et disponibilite.
- Clients : dossiers, categories et eligibilite.
- Locations : simulation, reservation, depart, retour, annulation et export CSV.

Compatibilite : [table officielle Angular](https://angular.dev/reference/versions).
