## Architecture Technique

Test technique pour Lydia Solutions. 
[ios-lydia-technical-test.pdf](https://github.com/user-attachments/files/20845404/ios-lydia-technical-test.pdf)

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

4. **ViewModel Layer**
   - Logique de présentation
   - Communication View-Model

### Technologies Utilisées

- Swift 5+
- Xcode 15+
- Architecture MVVM
- Clean Architecture
- Dependency Injection
- Unit Testing

## Prérequis

- Xcode 15+ (ou version compatible)
- iOS 15+ (ou version compatible)
- Swift 5+
