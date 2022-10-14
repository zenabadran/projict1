import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Hightwidgit extends StatefulWidget {
   final Function(int) onChange;
  const Hightwidgit({super.key,required this.onChange});

  @override
  State<Hightwidgit> createState() => _HightwidgitState();
}

class _HightwidgitState extends State<Hightwidgit> {
  int hightt=150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
                 elevation: 12,
                 shape:const RoundedRectangleBorder(),
                 child: Column(
                   children: [
                  const  Text("Hight",style: TextStyle(fontSize: 25,color: Colors.grey),),
                  const SizedBox(height: 10,),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(hightt.toString(),style: const TextStyle(fontSize: 40),),
                       const SizedBox(height: 10,),
                     const Text("cm",style: TextStyle(fontSize: 20 ,color: Colors.grey),)
                    ],
                  ),
                 Slider(
                min: 0,
                max: 240,
                value:hightt.toDouble(),
                thumbColor: Color.fromARGB(255, 244, 54, 209),
                onChanged: (value) {
                  setState(() {
                    hightt = value.toInt();
                  });
                  widget.onChange(hightt);
                    },
                  )
                   ],

                 )),
    );
  }
}