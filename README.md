## **Jana Khaled**    *2023032357*
---
# **Demo 🎞**

[UI](https://github.com/user-attachments/assets/4039048f-74e1-4638-a5ee-b3f2f0e3ae05)

---



Use `git status` to list all new or modified files that haven't yet been committed.

Some basic Flutter commands are:

```bash
flutter clean
flutter pub get
flutter run
```

---

## **Welcome to Mobile App!** 🌟

A creative and eco-conscious Flutter mobile application designed to showcase crafts, profile management, and educational resources.

---

## 📁 Project Structure

```
lib/
├── firstScreen.dart
├── home/
│   └── home_screen/
│       └── home_page.dart
│       └── home_widget/
│           └── home_widget.dart
├── profile/
│   └── profile_page/
│       └── profile_page.dart
└── my_season.dart
```

---

## 📱 Features

### Home Page (`home_page.dart`)

* Displays a main image (from gallery or default tree).
* Shows title and description.
* Includes favorite and share buttons.
* Displays seasonal thumbnails or uploaded gallery images.
* Floating action button navigates to the first screen.

### Profile Page (`profile_page.dart`)

* Upload image via camera or gallery.
* Edit and delete profile picture.
* Circular avatar with camera icon overlay.

### First Screen (`firstScreen.dart`)

* Initial welcome or setup screen.

### `my_season.dart`

A reusable widget that displays a seasonal image with a text label overlay at the bottom center.

#### 🌤️ Example: MySeason Widget

```dart
MySeason(url: "assets/imagetree2.jpg", text: "Fall")
```

#### 💡 Purpose:

* Uses a `Stack` to place text on top of an image.
* Great for showing seasonal categories or themed content.
* Image is clipped to 100x100 and fitted using `BoxFit.cover`.

---

## 🚀 Getting Started

1. Clone the repository:

```bash
git clone <your-repo-url>
cd <your-repo>
```

2. Get dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

---

## 🙋‍♀️ Author

**Jana**

Feel free to contribute or raise issues if you find bugs or want to suggest improvements!

give me the way to write it on my readme file on github
