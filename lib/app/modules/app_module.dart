import 'package:balaio/app/pages/auth_page.dart';
import 'package:balaio/app/pages/home_page.dart';
import 'package:balaio/app/pages/mural_page.dart';
import 'package:balaio/app/pages/config_page.dart';
import 'package:balaio/app/pages/notification_page.dart';
import 'package:balaio/app/pages/profile_page.dart';
import 'package:balaio/app/pages/start_page.dart';
import 'package:balaio/app/pages/welcome_page.dart';
import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/service/balaio_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind((i) => BalaioController()),
    Bind((i) => BalaioStore()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => StartPage()),
    ChildRoute('/welcome', child: (_, __) => WelcomePage()),
    ChildRoute('/auth', child: (_, __) => AuthPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
    ChildRoute('/mural', child: (_, __) => MuralPage()),
    ChildRoute('/perfil', child: (_, __) => ProfilePage()),
    ChildRoute('/config', child: (_, __) => ConfigPage()),
    ChildRoute('/notificacoes', child: (_, __) => NotificationPage()),
  ];
}
