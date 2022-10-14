import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
class Genderwidgit extends StatefulWidget {
  final Function (int) onChange;
  const Genderwidgit({super.key,required this.onChange});

  @override
  State<Genderwidgit> createState() => _GenderwidgitState();
}

class _GenderwidgitState extends State<Genderwidgit> {
  int ggender=0;
 final ChoiceChip3DStyle selectedstyle=ChoiceChip3DStyle(
              topColor: Colors.grey[200]!,
              backColor: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            );

  final ChoiceChip3DStyle unselectedstyle=ChoiceChip3DStyle(
              topColor: Colors.white,
              backColor: Colors.grey[300]!,
              borderRadius: BorderRadius.circular(20),
            );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color:Colors.grey),
            style: ggender==1?selectedstyle:unselectedstyle,
            onSelected: (){
              setState(() {
                ggender=1;
               
              });
               widget.onChange(ggender);
            },
           onUnSelected: (){},
           selected: ggender==1,
            child: Column(
              children: [
                Image.asset("assets/images/man.png",width: 50,),
                 const SizedBox(
                  height: 5,
                ),
                const Text("male")
              ],
            )),
            const SizedBox(width: 20,),
             ChoiceChip3D(
            border: Border.all(color:Colors.grey),
            style: ggender==2?selectedstyle:unselectedstyle ,
            onSelected: (){
               setState(() {
                ggender=2;
              });
               widget.onChange(ggender);
            },
           onUnSelected: (){},
           selected: ggender==2,
            child: Column(
              children: [
                Image.asset("assets/images/woman.png",width: 50,),
                 const SizedBox(
                  height: 5,
                ),
                const Text("female")
              ],
            ))
        ],
      ),
    );
  }
}  