import 'package:d_media_query_splash_screen_other_ui_widgets_theme/features/games/games_screen.dart';
import 'package:d_media_query_splash_screen_other_ui_widgets_theme/features/profile/profile_screen.dart';
import '../features/home/home_screen.dart';
import '../features/songs/song_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {  
  // static const String initialRoute = '/login';
  static final routes = {
    '/': (context) => SplashScreen(),
    '/home': (context) => HomePage(), 
    '/song': (context) => SongPage(),
    '/game': (context) => GamesPage(),
    '/profile': (context) => ProfilePage(),
  };
}
