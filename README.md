📰 Articlely  App

📚 Project Overview

Articlely App is a modern Flutter application that allows users to:

Browse the latest news articles

View detailed news content

Search for specific articles

Filter news by category

Manage user authentication and profile

Enjoy a responsive and smooth user experience

This application is built with Clean Architecture, Bloc for State Management, and follows SOLID principles to ensure testability, scalability, and maintainability.

🛠️ Built With

Flutter – Cross-platform UI toolkit

Bloc – State management

Firebase Auth – User authentication

Clean Architecture – Project organization

Dio – API communication

Dependency Injection – Decoupled, testable code

Shimmer – Loading animations


🗂️ Project Structure


lib
├── core
│   ├── app_routing           # App route management
│   ├── constants             # App-wide constants
│   ├── di                    # Dependency injection
│   ├── dio                   # API client config
│   ├── error                 # Custom exceptions and error handling
│   ├── extensions            # Dart/Flutter extensions
│   ├── helpers               # Utility functions
│   ├── models                # Core models
│   ├── navBar                # Bottom navigation bar
│   ├── theme                 # Theme and styling
│   ├── userAuth              # Core user auth logic
│   └── widgets               # Reusable widgets
├── features
│   ├── news                  # News list, categories & detail logic
│   ├── profile               # User profile feature
│   ├── sign_in               # Sign-in screen and logic
│   ├── sign_up               # Sign-up screen and logic
│   └── Splash                # Splash screen feature
├── firebase_options.dart     # Firebase configuration
└── main.dart                 # Entry point
🔑 Key Features

View all available news articles

View full article content

Search for articles by keyword

Browse articles by category (e.g., sports, tech, business)

User sign-in and sign-up with Firebase Auth

Clean and maintainable architecture

Global error handling

Smooth shimmer loading indicators

Dependency injection for flexible, scalable development

🚀 Getting Started

Clone the repo:

Using Terminal 

git clone https://github.com/your-username/news_app.git

Install packages:

Using Terminal 

flutter pub get
Run the app:

Using Terminal Or From Android Studio Or VS CODE 

flutter run

🧩 Architecture Overview

Presentation Layer: Screens, Widgets, Bloc

Domain Layer: Entities, Use Cases, Repository Interfaces

Data Layer: Network services, Repository Implementations

Core Layer: Common app utilities and resources

✍️ Author 
Huda kamal https://www.linkedin.com/in/huda-kamal-9084ab275?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app | https://github.com/Hudakamal6
