import 'package:go_router/go_router.dart';
import 'package:jobee_app/pages/home_page/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: HomePage.path,
    routes: [
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => const HomePage(),
        
      ),
    ],
  );
}
