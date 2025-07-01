import '../features/home/home_screen.dart';
import '../features/songs/song_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {  
  // static const String initialRoute = '/login';
  static final routes = {
    '/': (context) => SplashScreen(),
    '/home': (context) => HomePage(), 
    '/song': (context) => SongPage(),
  };
}
