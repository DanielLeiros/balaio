import 'package:balaio/app/pages/auth_page.dart';
import 'package:balaio/app/pages/home_page.dart';
import 'package:balaio/app/pages/profile_page.dart';
import 'package:balaio/app/pages/menu.dart';
import 'package:balaio/app/pages/welcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => WelcomePage()),
    ChildRoute('/auth', child: (_, __) => AuthPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
    ChildRoute('/menu',
        child: (_, __) => Menu(), transition: TransitionType.upToDown),
    ChildRoute('/mural', child: (_, __) => Menu()),
    ChildRoute('/perfil', child: (_, __) => ProfilePage()),
    ChildRoute('/config', child: (_, __) => Menu()),
    ChildRoute('/faq', child: (_, __) => Menu()),
  ];
}
