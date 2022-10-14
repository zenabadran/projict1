import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class agewithwieght extends StatefulWidget {
     final Function(int) onChange;
     final String title;
     final  int initvalue;
     final int min;
     final int max;


  const agewithwieght({super.key,required this.onChange,required this.title,required this.initvalue, required this.min,required this.max});

  @override
  State<agewithwieght> createState() => _agewithwieghtState();
}

class _agewithwieghtState extends State<agewithwieght> {
  int count =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count =widget.initvalue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
                 elevation: 12,
                 shape:const RoundedRectangleBorder(),
                 child: Column(
                   children: [
                     Text(widget.title, style: const TextStyle(
                      fontSize: 20 ,color: Colors.grey
                    ),),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                            InkWell(
                              child:const  CircleAvatar(
                          radius: 12,
                          backgroundColor:Colors.blue,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ) ,
                        onTap: () {
                          setState(() {
                            if(count> widget.min){
                              count--;
                            }
                          });

                          widget.onChange(count);
                        },
                            ),
                             const SizedBox(width: 15,),
                             Text(count.toString(), textAlign: TextAlign.center,
                             style:const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500
                             ),
                             ),
                                const SizedBox(width: 15,),

                            InkWell(
                              child:const  CircleAvatar(
                          radius: 12,
                          backgroundColor:Colors.blue,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ) ,
                        onTap: () {
                          setState(() {
                            if(count< widget.max){
                              count++;
                            }
                          });

                          widget.onChange(count);
                        },
                            )

                       
                      ],),
                    )

                   ])));
  }
}