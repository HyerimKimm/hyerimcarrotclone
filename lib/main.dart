import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hyerimcarrotclone/router/locations.dart';
import 'package:hyerimcarrotclone/screens/auth_screen.dart';
import 'package:hyerimcarrotclone/screens/splash_screen.dart';
import 'package:hyerimcarrotclone/utils/logger.dart';

final _routerDelegate = BeamerDelegate(
  guards: [BeamGuard(pathBlueprints: ['/'], check: (context, location){
    return false;
  },showPage: BeamPage(child: AuthScreen()))],
    locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

void main(){
  logger.d('My First Log by logger!');
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 500), ()=>'100'),
      builder: (context, snapshot) {
        return AnimatedSwitcher(duration: Duration(milliseconds: 500), child: _splashLoadingWidget(snapshot));
      }
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError){
      print('error occur while loading.');
      return Text('Error occur');
    }else if(snapshot.hasData){
      return AbocadoApp();
    }else{
      return SplashScreen();
    }
  }
}

class AbocadoApp extends StatelessWidget {
  const AbocadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Dohyeon',
        textTheme: TextTheme(
            headline3: TextStyle(fontFamily: 'Dohyeon'),
            button: TextStyle(color: Colors.white)
        )
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
