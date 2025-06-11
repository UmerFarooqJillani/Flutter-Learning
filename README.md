# <p align="center"> Flutter </p>

Flutter is an open source UI software development kit (SDK) created by **Google**. It allows developers to build natively compiled applications for mobile (iOS, Android), web, desktop (Windows, macOS, Linux), and embedded devices all from a single codebase.


## Why Use Flutter?
- Write once (Single Codebase), run anywhere, saves time and effort
- Fast Development and Hot Reload & declarative UI enables quick iteration
- Compiles to native ARM (Advanced RISC (Reduced Instruction Set Computing) Machine) machine code (not interpreted)
- Open Source & Strong Community	Constant improvements, support, and plugin ecosystem
- Fully customizable UI at any pixel level 

## How to Use Flutter?
- **Language Used:** Flutter uses [Dart language](https://github.com/UmerFarooqJillani/Dart-Learning)

**Main Components:**
- **Widgets**: The building blocks of UI.
- MaterialApp, Scaffold, Container, etc.

**Development Cycle:**
- Write Dart code → Use widgets to build UI → Run in emulator/device → Debug using tools like DevTools.

## Complete Flutter Setup Development Environment
To set up a development environment for Flutter, you need to install the following software:
- **Flutter SDK:** Download and install the latest version of the Flutter SDK from the official website.
- **Integrated Development Environment (IDE):** You can use Android Studio, Visual Studio Code (Recommeded), IntelliJ IDEA or any other IDE of your choice.
- **Emulator or a physical device:** You can use an emulator or a physical device to run and test your Flutter apps. You can use the Android emulator provided by Android Studio or use a physical Android or iOS device.
- **Git:** Git is used for version control and is recommended for Flutter development. You can download and install Git.
- **Dart SDK:** Dart is the programming language used by Flutter, and the Dart SDK is required to develop Flutter apps. The Dart SDK is included in the Flutter SDK.

Once you have installed all the required software, you can create a new Flutter project using the Flutter CLI or your IDE, and start building your app.

## What is the flutter Command-Line Tool?
Flutter CLI (Command Line Interface) is a command-line tool that is used to develop, build, and run Flutter applications. It provides a set of commands and tools that developers can use to create, test, and deploy Flutter apps from the terminal. Flutter CLI include: 
- Creating a new Flutter project
- Running Flutter app on a connected device or emulator
- Building and deploying Flutter app to app stores
- Updating the Flutter framework and packages
- Analyzing the performance of Flutter apps

IDEs like VS Code or Android Studio internally run these commands behind the scenes when you click buttons like "Run" or "Analyze".
### Commonly Used Flutter CLI Commands
```
$ flutter create my_app
$ cd my_app
$ flutter analyze
$ flutter test
$ flutter run lib/main.dart

```
For more commands [click here](#) 

## Setup Visual Studio Code (VS Code)
VS Code is a code editor to build and debug apps. With the Flutter extension installed, you can compile, deploy, and debug Flutter apps.

**Install the Flutter extension:**
- Start VS Code.
- Open a browser and go to the Flutter extension page on the Visual Studio Marketplace.
- Installing the Flutter extension also installs the Dart extension.

### Validate your VS Code setup
1. Go to View > Command Palette....<br>
<span>&nbsp; You can also press Ctrl / Cmd + Shift + P.</span>

2. Type **doctor**.
3. Select Flutter: Run Flutter Doctor.<br>
Once you select this command, VS Code does the following:<br>
<span>&nbsp; &nbsp; Opens the Output panel.</span><br>
<span>&nbsp; &nbsp; Displays flutter (flutter) in the dropdown on the upper right of this panel.</span><br>
<span>&nbsp; &nbsp;  the output of flutter doctor command.</span>

## Creating projects
To create a new Flutter project from the Flutter starter app template:
1. Go to View > Command Palette....<br>
You can also press Ctrl / Cmd + Shift + P.
2. Type flutter.
3. Select the Flutter: New Project.
4. Press Enter.
5. Select Application.
6. Press Enter.
7. Select a Project location.
8. Enter your desired Project name.

Opening a project from existing source code

---

**Author:** [Umer Farooq Jillani](https://github.com/UmerFarooqJillani/)

