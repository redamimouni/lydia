# Lydia

Une application iOS moderne développée avec Swift/Xcode.

## Architecture Technique

Lydia est une application iOS qui suit l'architecture MVVM (Model-View-ViewModel) avec une séparation claire des responsabilités.

### Structure du Projet

```
Lydia/
├── Data/          # Couche de données (API, persistence)
├── Domain/        # Logique métier et entités
├── View/          # UI Components et Views
├── ViewModel/     # Logique de présentation
├── APICaller/     # Gestion des appels API
└── Tests/        # Tests unitaires et UI tests
```

### Composants Principaux

1. **Data Layer**
   - Gestion des appels API via `APICaller`
   - Persistance des données
   - Mapping des données

2. **Domain Layer**
   - Modèles de données
   - Use Cases
   - Business Logic

3. **View Layer**
   - UI Components
   - Navigation
   - Design System

4. **ViewModel Layer**
   - Logique de présentation
   - Communication View-Model
   - Gestion des états

### Technologies Utilisées

- Swift 5+
- Xcode 15+
- Architecture MVVM
- Clean Architecture
- Dependency Injection
- Unit Testing
- UI Testing

## Prérequis

- Xcode 15+ (ou version compatible)
- iOS 15+ (ou version compatible)
- Swift 5+

## Installation

1. Clonez le dépôt
2. Ouvrez `Lydia.xcodeproj` dans Xcode
3. Build et exécutez l'application sur un simulateur ou un appareil iOS

## Tests

Les tests unitaires sont disponibles dans le dossier `LydiaTests`. Vous pouvez les exécuter depuis Xcode en utilisant la commande `Cmd + U`.

## Contribuer

1. Fork le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Pousser la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## License

[Spécifiez la licence ici]

## Contact

- Reda Mimouni
- [Ajoutez votre email]
- [Ajoutez votre site web]

## Remerciements

- [Ajoutez toute bibliothèque ou framework tiers utilisé]
- [Ajoutez toute autre ressource ou personne qui a aidé dans le développement]

## Prérequis

- Xcode 15+ (ou version compatible)
- iOS 15+ (ou version compatible)
- Swift 5+

## Installation

1. Clonez le dépôt
2. Ouvrez `Lydia.xcodeproj` dans Xcode
3. Build et exécutez l'application sur un simulateur ou un appareil iOS

## Tests

Les tests unitaires sont disponibles dans le dossier `LydiaTests`. Vous pouvez les exécuter depuis Xcode en utilisant la commande `Cmd + U`.

## Contribuer

1. Fork le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Pousser la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## License

[Spécifiez la licence ici]

## Contact

- Reda Mimouni
- [Ajoutez votre email]
- [Ajoutez votre site web]

## Remerciements

- [Ajoutez toute bibliothèque ou framework tiers utilisé]
- [Ajoutez toute autre ressource ou personne qui a aidé dans le développement]