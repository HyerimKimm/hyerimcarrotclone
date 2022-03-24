import 'package:flutter/material.dart';
import 'package:hyerimcarrotclone/splash_screen.dart';
import 'package:hyerimcarrotclone/logger.dart';

void main(){
  logger.d('My First Log by logger!');
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1), ()=>'100'),
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
    return Container(
      color: Colors.amber,
    );
  }
}
