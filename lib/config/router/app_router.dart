import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration para ir entre pantallas
final approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  );


