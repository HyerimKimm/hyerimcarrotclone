import 'package:flutter/material.dart';
import 'package:hyerimcarrotclone/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), ()=>'100'),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          print('error occur while loading.');
          return Text('Error occur');
        }else if(snapshot.hasData){
          return AbocadoApp();
        }else{
          return SplashScreen();
        }
      }
    );
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
