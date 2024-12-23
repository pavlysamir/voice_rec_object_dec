# pyramakers_task

Voice Command and Real-Time Object Detection in Flutter
Welcome to the Voice Command and Real-Time Object Detection project! This repository showcases a Flutter application with two core features: speech recognition for voice commands and real-time object detection using machine learning. These features are designed to enhance interactivity and user experience in mobile applications.


## Features
1. Speech Recognition
Real-Time Voice Capture: Captures and processes voice commands in real time.
Text Conversion: Converts recognized speech into text displayed on the app.
Multilingual Support: Supports multiple languages, including English and Arabic.
Error Handling:
Manages unclear commands and background noise effectively.
Displays fallback messages for unrecognized or unclear input.
2. Object Detection
Real-Time Detection: Identifies and labels objects in the camera feed.
Bounding Boxes: Highlights detected objects with bounding boxes for better visualization.
Support for Multiple Objects: Detects and labels multiple objects simultaneously.
Error Handling:
Displays fallback messages for unidentifiable objects or unclear views.

## Technologies Used
Flutter: For building cross-platform mobile applications.
TensorFlow Lite: For on-device machine learning and real-time object detection.
Speech Recognition Plugins: For capturing and processing voice commands.

├── lib/
│   ├── features/
│   │   ├── speech_recognition/
│   │   │   ├── ui/           # UI components for speech recognition
│   │   │   ├── data/         # Data models and services
│   │   │   ├── logic/        # Business logic (e.g., state management)
│   │   ├── object_detection/
│   │   │   ├── ui/           # UI components for object detection
│   │   │   ├── data/         # Data models and services
│   │   │   ├── logic/        # Business logic (e.g., state management)
│   ├── core/
│   │   ├── utils/            # Shared utility functions
│   │   ├── widgets/          # Reusable widgets across features
│   │   ├── constants.dart    # App-wide constants
│   ├── main.dart             # App entry point
├── assets/                   # Model files and assets
│   ├── models/               # TensorFlow Lite models
├── android/                  # Android-specific files
└── ios/                      # iOS-specific files



#   v o i c e _ r e c _ o b j e c t _ d e c 
 
 
