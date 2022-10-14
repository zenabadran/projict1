
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
class scorescreen extends StatefulWidget {
  final double bmiscore;
 final  int age;

 String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor; 

   scorescreen({super.key,required this.bmiscore,required this.age});

  @override
  State<scorescreen> createState() => _scorescreenState();
}

class _scorescreenState extends State<scorescreen> {
  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
         appBar:AppBar(
          centerTitle: true,
          title: Text("BMI Score"),
         ) ,
         body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
               elevation: 12,
               shape:const RoundedRectangleBorder(),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("Your score",style: TextStyle(fontSize: 30,color: Colors.blue),),
                 const SizedBox(height: 10,),
                 PrettyGauge(
                  gaugeSize: 300,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment("UnderWeight", 18.5, Colors.red),
                    GaugeSegment("Normal", 6.4, Colors.green),
                    GaugeSegment("OverWeight", 5, Colors.orange),
                    GaugeSegment("Obese", 10.1, Colors.pink),

                  ],
                  valueWidget: Text(widget.bmiscore.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 40),
                  
                  ),

                    currentValue: widget.bmiscore.toDouble(),
                    needleColor: Colors.blue,
                 ),
                 const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.bmiStatus!,
                      style: TextStyle(fontSize: 20, color:widget. bmiStatusColor!),
                    ),
                         const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),

                         ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${widget.bmiscore.toStringAsFixed(1)} at age $widget.age");
                            },
                            child: const Text("Share")),
                   ],)
                ]))),

    );
  }

  void setBmiInterpretation() {
    if (widget.bmiscore > 30) {
      widget.bmiStatus = "Obese";
     widget. bmiInterpretation = "Please work to reduce obesity";
      widget.bmiStatusColor = Colors.pink;
    } else if (widget.bmiscore >= 25) {
      widget.bmiStatus = "Overweight";
     widget. bmiInterpretation = "Do regular exercise & reduce the weight";
      widget.bmiStatusColor = Colors.orange;
    } else if (widget.bmiscore >= 18.5) {
     widget. bmiStatus = "Normal";
      widget.bmiInterpretation = "Enjoy, You are fit";
      widget.bmiStatusColor = Colors.green;
    } else if (widget.bmiscore < 18.5) {
     widget. bmiStatus = "Underweight";
     widget. bmiInterpretation = "Try to increase the weight";
      widget.bmiStatusColor = Colors.red;
    }
  }


}