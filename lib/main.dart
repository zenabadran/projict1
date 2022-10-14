import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/scscreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'ageandwieghtwidget.dart';
import 'genderwidgit.dart';
import 'hightwidgit.dart';
import 'scscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI calculater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gender=0;
  int hhight=150;
  int agge=30;
  int weightt=50;
  bool finish =false;
  double _bmiscore =0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
         child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
               elevation: 12,
               shape:const RoundedRectangleBorder(),
               child: Column(
                children: [
                  Genderwidgit(onChange: (gendervalue) {
                    gender=gendervalue;
                  },),
                  Hightwidgit(

                   onChange: (hightvalue) {
                    hhight=hightvalue;
                  },

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      agewithwieght(
                        onChange: (agevalue){
                          agge=agevalue;
                        }, 
                        title: "Age", 
                        initvalue: 30, min: 0, max: 100),

                        agewithwieght(
                        onChange: (wieghtvalue){
                          weightt=wieghtvalue;
                        }, 
                        title: "Wiegh (Kg)", 
                        initvalue: 50, min: 0, max: 200),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20 ,horizontal: 60),
                    child: SwipeableButtonView(
                      isFinished: finish,
                      onFinish:()async  {
                             await Navigator.push(context, PageTransition(child: scorescreen(bmiscore:_bmiscore,age:agge), type: PageTransitionType.fade));
                          setState(() {
                          finish=false;
                        });
                      },
                     onWaitingProcess: (){
                        clculatebmi ();


                      Future.delayed(Duration(seconds: 1),(){
                        setState(() {
                          finish=true;
                        });
                      }
                      
                      );
                     }, 
                     activeColor: Colors.blue,
                      buttonWidget:Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                       buttonText: "Calculate"),
                  )

                ],
               ),
          ),
         ),

      )  ,
      
    );
  }
void clculatebmi (){
  _bmiscore=weightt/pow(hhight/100, 2);

}


}
