# 100 Days of SwiftUI

[![Swift](https://img.shields.io/badge/Language-Swift-orange.svg?style=flat&logo=swift)](https://www.swift.org/)
[![SwiftUI](https://img.shields.io/badge/Framework-SwiftUI-blue.svg)](https://developer.apple.com/xcode/swiftui/)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![IDE](https://img.shields.io/badge/IDE-Xcode-147EFB.svg?logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)

This repository documents my progress through Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. It contains the course projects, milestone challenges, and my solutions while learning to build iOS applications with **Swift**, **SwiftUI**, and **Xcode**.

The repository will continue to grow as I progress through the curriculum and add new projects, challenge solutions, improvements, and screenshots.

## Learning Objectives

Through these projects, I am developing practical experience in:

- Swift fundamentals and protocol-oriented programming
- Declarative user-interface development with SwiftUI
- State management, data binding, and observable data
- Navigation, forms, lists, alerts, sheets, and animations
- Data modelling with `Codable`, generics, and JSON
- Local data persistence with `UserDefaults` and SwiftData/Core Data
- Networking with `URLSession` and asynchronous Swift
- Core ML, MapKit, Core Image, and biometric authentication
- Accessibility, localization, and adaptive layouts
- App architecture, debugging, testing, and performance

## Course Projects

### Starting SwiftUI

#### Project 1 — WeSplit

A bill-splitting application that calculates the total amount and each person's share, including a selectable tip.

**Key concepts:** `Form`, `Section`, `NavigationStack`, `@State`, `TextField`, `Picker`, `ForEach`, and currency formatting.

#### Challenge — Unit Converter

A unit-conversion application for converting user-entered values between measurement units.

**Key concepts:** input handling, segmented pickers, computed properties, and unit conversion.

#### Project 2 — Guess the Flag

A quiz game in which users identify a country's flag and receive immediate feedback and a score.

**Key concepts:** stacks, images, buttons, gradients, alerts, asset management, and basic game logic.

#### Project 3 — Views and Modifiers

A focused exploration of how SwiftUI constructs interfaces using views, modifiers, composition, and reusable components.

**Key concepts:** custom views, custom modifiers, view composition, environment modifiers, and modifier order.

#### Milestone — Rock, Paper, Scissors

A game that asks the player to choose the correct move based on whether they must win or lose each round.

**Key concepts:** conditional logic, randomized state, scoring, and interface composition.

### Expanding SwiftUI Skills

#### Project 4 — BetterRest

A sleep-planning application that uses machine learning to recommend an appropriate bedtime based on wake-up time, desired sleep, and coffee intake.

**Key concepts:** Core ML, Create ML, `DatePicker`, `DateComponents`, steppers, and model predictions.

#### Project 5 — Word Scramble

A word game that challenges users to create valid words from a randomly selected root word.

**Key concepts:** lists, text input, string processing, bundle resources, validation, and `UITextChecker`.

#### Project 6 — Animation

A collection of interactive examples demonstrating implicit, explicit, gesture-driven, and transition-based animations.

**Key concepts:** `animation()`, `withAnimation`, transitions, gestures, bindings, and custom animation behaviour.

#### Milestone — Edutainment

An educational multiplication game with configurable tables, question counts, scoring, and replay functionality.

**Key concepts:** dynamic question generation, settings screens, state-driven navigation, scoring, and animations.

### Scaling Up to Larger Apps

#### Project 7 — iExpense

A personal and business expense tracker that lets users add, categorize, display, and delete expenses.

**Key concepts:** observable data, sheets, `Codable`, `UserDefaults`, list deletion, and data sharing between views.

#### Project 8 — Moonshot

An informational application presenting NASA Apollo missions and astronaut profiles from bundled JSON data.

**Key concepts:** `Codable`, generics, JSON decoding, scroll views, lazy grids, navigation, and merging related datasets.

#### Project 9 — Drawing

A series of custom drawings and visual effects created using SwiftUI's graphics system.

**Key concepts:** paths, shapes, strokes, transforms, `InsettableShape`, `CGAffineTransform`, blending, and `drawingGroup()`.

#### Milestone — Habit Tracker

An application for creating activities and tracking how often each activity is completed.

**Key concepts:** custom data models, observable state, persistence, navigation, and reusable views.

### Working with Data

#### Project 10 — Cupcake Corner

A multi-screen cupcake-ordering application that collects order details and sends them to a remote server.

**Key concepts:** `Codable`, `URLSession`, async/await, form validation, navigation, and network requests.

#### Project 11 — Bookworm

A book-review application for recording books, ratings, genres, and personal reviews.

**Key concepts:** SwiftData/Core Data, model relationships, custom components, bindings, sorting, and deletion.

#### Project 12 — Core Data Project

A technical project exploring advanced persistent-data operations and reusable fetch requests.

**Key concepts:** dynamic queries, relationships, predicates, sorting, constraints, and data-model design.

#### Milestone — FriendFace

An application that downloads a network of users and friendships, stores the data locally, and displays relationships between users.

**Key concepts:** networking, `Codable`, SwiftData/Core Data, relationships, caching, and offline access.

### Images, Maps, and System Frameworks

#### Project 13 — Instafilter

An image-editing application that imports photos, applies Core Image filters, previews the result, and saves edited images.

**Key concepts:** Core Image, PhotosUI, UIKit integration, custom bindings, image processing, and share/save workflows.

#### Project 14 — Bucket List

A private map-based application where users can add locations and notes, then protect their saved data using biometric authentication.

**Key concepts:** MapKit, map annotations, `LocalAuthentication`, secure file storage, `Comparable`, and location editing.

#### Project 15 — Accessibility

A focused project examining how to make SwiftUI interfaces more usable with VoiceOver and other accessibility technologies.

**Key concepts:** accessibility labels, values, hints, traits, grouped elements, and accessible controls.

#### Milestone — Photo Name Rememberer

An application that imports photos of people, records their names, and displays where each photo was added.

**Key concepts:** photo import, persistence, MapKit, location data, custom models, and accessibility-aware design.

### Advanced SwiftUI

#### Project 16 — Hot Prospects

A conference networking application for exchanging attendee details with QR codes and tracking prospective contacts.

**Key concepts:** tab views, QR-code generation and scanning, environment data, filtering, context menus, packages, and local notifications.

#### Project 17 — Flashzilla

A gesture-driven flashcard application with editable cards, timed practice sessions, and accessibility support.

**Key concepts:** gestures, custom transitions, timers, haptics, hit testing, scene phase, and accessibility.

#### Project 18 — Layout and Geometry

A technical exploration of SwiftUI's layout system and how views determine their size and position.

**Key concepts:** alignment, coordinate spaces, `GeometryReader`, custom layout behaviour, visual effects, and scrolling geometry.

#### Milestone — Dice Roller

A dice-rolling application that supports different dice configurations and stores previous results.

**Key concepts:** reusable components, haptics, persistence, animation, and result history.

### Final Project

#### Project 19 — SnowSeeker

A multi-screen ski-resort browser that helps users explore, filter, sort, and save favourite resorts using an adaptive interface.

**Key concepts:** split-view navigation, adaptive layouts, search, sorting, favourites, size classes, and reusable views.

## Repository Structure

Each project is stored in its own directory and may include:

```text
Project_Name/
├── Project_Name.xcodeproj
├── Project_Name/
│   ├── App entry point
│   ├── SwiftUI views
│   ├── Data models
│   ├── Assets
│   └── Supporting files
└── Screenshots (where available)
```

## Running a Project

1. Clone this repository:

   ```bash
   git clone https://github.com/rahul-raoniar/100-Days-of-SwiftUI-Projects.git
   ```

2. Open the required project's `.xcodeproj` file in Xcode.
3. Select an iOS simulator or a connected device.
4. Press **Run** or use `Command + R`.

Requirements may vary between projects depending on the SwiftUI and iOS APIs used.

## About the Course

[100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui), created by [Paul Hudson](https://www.hackingwithswift.com/about), is a free project-based course for learning Swift and SwiftUI through daily lessons, practical applications, reviews, and milestone challenges.

## Acknowledgements

- [Paul Hudson](https://www.hackingwithswift.com/about) for creating the course and learning resources.
- [Apple Developer Documentation](https://developer.apple.com/documentation/) for Swift, SwiftUI, and iOS framework references.

## Author

**Rahul Raoniar**

- GitHub: [@rahul-raoniar](https://github.com/rahul-raoniar)

## Disclaimer

This repository is maintained for learning and portfolio purposes. The implementations may include my own challenge solutions, interface changes, experiments, and improvements in addition to concepts taught in the course.
