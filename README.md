# Radio Life 

## Getting Started

This project uses [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) concepts thinking in productivity and easy maintenance.

#### Using

1. Clean Architecture

2. [Get_It](https://pub.dev/packages/get_it) for dependency injection

3. [GetX](https://pub.dev/packages/get) to state management

4. HTTP requests using [GraphQL](https://pub.dev/packages/graphql) + [Artemis](https://pub.dev/packages/artemis)

5. Internatinalization with [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl)

### Introduction
The main focus of the architecture is separation of concerns and scalability. It consists of four main modules: `App`, `Domain`, `Data`, and `Device`.

<img src="https://gitlab.com/snowman-labs/flutter-devs/project_sample_base/-/raw/master/img/flutter_clean_architecture.png" alt="Flutter Clean Architecture Flow" width="400"/>

<img src="https://gitlab.com/snowman-labs/flutter-devs/project_sample_base/-/raw/master/img/flutter_clean_architecture_layers.png" alt="Flutter Clean Architecture Layers" width="400"/>

### Layers

#### Domain
The `Domain` module defines the business logic of the application. It is a module that is independent from the development platform i.e. it is written purely in the programming language and does not contain any elements from the platform. In the case of `Flutter`, `Domain` would be written purely in `Dart` without any `Flutter` elements. The reason for that is that `Domain` should only be concerned with the business logic of the application, not with the implementation details. This also allows for easy migration between platforms, should any issues arise.

`Domain` represents the inner-most layer. Therefore, it the most abstract layer in the architecture.

#### App
`App` is the layer outside `Domain`. `App` crosses the boundaries of the layers to communicate with `Domain`. However, the **Dependency Rule** is never violated. Using `polymorphism`, `App` communicates with `Domain` using inherited class: classes that implement or extend the `Repositories` present in the `Domain` layer. Since `polymorphism` is used, the `Repositories` passed to `Domain` still adhere to the **Dependency Rule** since as far as `Domain` is concerned, they are abstract. The implementation is hidden behind the `polymorphism`.

#### Data
Represents the data-layer of the application. The `Data` module, which is a part of the outermost layer, is responsible for data retrieval. This can be in the form of API calls to a server, a local database, or even both.

#### Device
Part of the outermost layer, `Device` communicates directly with the platform i.e. Android and iOS. `Device` is responsible for Native functionality such as `GPS` and other functionality present within the platform itself like the filesystem. `Device` calls all Native APIs.

### Folder structure

```
lib/
    app/                          <--- application layer
        pages/                        <-- pages or screens
          login/                        <-- some page in the app
            login_controller.dart         <-- GetX controller
            login_page.dart               <-- login_page widget
        widgets/                      <-- custom widgets
        utils/                        <-- utility functions/classes/constants
    data/                         <--- data layer
        repositories/                 <-- repositories (retrieve data, heavy processing etc..)
          data_auth_repo_impl.dart    <-- example repo: handles all authentication
        helpers/                      <-- any helpers e.g. http helper
        mappers/                      <-- entities extensions it contains methods like toJson/fromJson
        constants/                  <-- constants such as API keys, routes, urls, etc..
        sources/                    <-- remote and local data sources
        utils/                        <--- any utility classes/functions
    domain/                       <--- domain layer (business and enterprise) PURE DART
        entities/                   <--- enterprise entities (core classes of the app)
          user.dart                   <-- example entity
          manager.dart                <-- example entity
        usecases/                   <--- business processes e.g. Login, Logout, GetUser, etc..
          base/                       <-- base classes `BaseFutureUseCase` and `BaseStreamUseCase` extends BaseUseCase
          login_usecase.dart          <-- example usecase extends `BaseFutureUseCase` or `BaseStreamUseCase`
        repositories/               <--- abstract classes that define functionality for data and device layers
    main.dart                     <--- entry point

```

#### Setup

Clone repository

```
git clone git@github.com:radiolife-labs/Radio-Life-Flutter.git
```

Get packages
```
flutter packages get
```

Run build_runner
```
flutter pub run build_runner build
```

#### CI/CD

This project use Github Actions + Fastlane to build and deploy artifacts of Android (Firebase App Distribution) and iOS (TestFlight) apps.

#### Triggers:
 - Android: push into `beta-android` branch
 - iOS: push into `beta-ios` branch
