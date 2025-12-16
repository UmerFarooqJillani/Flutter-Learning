import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/dashboard.dart';

void main() {
  runApp(NavStc());
}

/*
--> What is the Navigation Stack?
    Flutter uses a stack data structure for navigation. When you navigate to a new screen, 
    it’s pushed onto the stack. When you go back, it’s popped off the stack.
    --> Stack Behavior:
        - push() → Go to a new screen
        - pop() → Go back to the previous screen

--> Internal Navigation	
    - Switching between app pages/screens

--> Navigator Class in Flutter
    The Navigator is the built-in widget that manages your app’s route stack.
    --> Common Navigator Methods:
        --> Navigator.push()	
            Push a new screen (route) onto the stack

        --> Navigator.pop()	
            Pop (go back to) the previous screen
            e.g:
              Navigator.pop(context); 

        --> Navigator.pushNamed()	
            - Push named route defined in MaterialApp.
            - Navigate to a named route defined in your route table inside MaterialApp.
            - Use When:
              - You have multiple screens and want centralized routing
              - Clean URL management
              - Easily testable & maintainable
            e.g:
              Navigator.pushNamed(context, '/login');

        --> Navigator.popUntil()	
            - Pop back until a specific condition
            - Go back until first screen
            e.g:
              Navigator.popUntil(context, ModalRoute.withName('/'));

        --> Navigator.pushReplacement()	
            - Replace current with a new screen
            - Replace screen (no going back)
            e.g:
              Navigator.pushReplacementNamed(context, '/dashboard');

    -->  Custom Route (Advanced):
         e.g:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CustomScreen())
            );
--> 

*/
class NavStc extends StatelessWidget {
  const NavStc({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}

// Routes Details
//----------------------The first one — “Static routes map” (Basic)-------------------------------
class AppRoutes1 {
  static final myRoutes = {
    // "/": (context) => LoginScreen(),
    // "/login": (context) => LoginScreen(),
  };
}

// - Good for beginners, because:
//     - It’s short
//     - You can quickly map routes to pages.
//     - Works fine if your app has just 2–3 screens.
//----------------------The second one — “onGenerateRoute” (Professional)------------------------
class AppRoutes {
  static const initial = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';

  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case initial:
  //     return MaterialPageRoute(builder: (_) => const SplashOrLoginPage());
  //     case login:
  //     return MaterialPageRoute(builder: (_) => const LoginPage());
  //     case dashboard:
  //     return MaterialPageRoute(builder: (_) => const DashboardPage());
  //     default:
  //     return MaterialPageRoute(builder: (_) => const NotFoundPage());
  //   }
  // }
}
//-----------------------------------------------------