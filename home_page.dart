
import 'dart:io';

import 'package:flutter/material.dart';

import '../../firstScreen.dart';
import '../../profile/profile_page/profile_page.dart';
import '../home_widget/home_widget.dart'; //عملنا فايل حطينا فيه الحاجه اللي هحتاج اعملها import علشان الدنيا متبقاش زحمه
class MyHomePage extends StatelessWidget {
  final String ? title;
  final String ?  body;

  final List <File> ? image;
  const MyHomePage({ this.image,this.title, this.body,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed:(){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));



        }, icon: Icon(Icons.account_box))],
        title: Text("The ${title ??" Tree"}"), //lw kan b null hndef klmt tree
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [// lw mb3tsh sora hy3rd el tree lw b3t mgmo3a mn el swr bh3rdh msln awl swra b index 0
            image==null || image!.isEmpty?     Image.asset("assets/tree.jpg") :Image.file(image![0],height: 300,fit: BoxFit.cover,width: double.infinity,),
            Row(
              // 3lshan yzhr ymen
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget (),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  textAlign: TextAlign.justify,
                  body ?? "A tree is a tall plant with a woody trunk, branches, and leaves. It gives oxygen, provides shade, and supports wildlife."
              ),
            ),
           image==null || image!.isEmpty? Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                MySeason(url:"assets/imagetree2.jpg",text:"Fall"),
                MySeason(url:"assets/imagetree.jpg",text:"Spring")

              ],
            ):
               SizedBox(
                 height: 500,
                 child: GridView.builder(
                     itemCount: image!.length,
                     //item builder dh eli by3rd el shakl
                     itemBuilder:(context,index)=>Image.file(image![index],height: 200,width: 200,fit:BoxFit.cover,) ,

                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount:2,mainAxisSpacing: 10,crossAxisSpacing: 10)),
               )

          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed:(){
        Navigator.push(
          context,MaterialPageRoute(builder: (context)=>FirstScreen()));

      },child: Icon(Icons.next_plan),),
    );
  }
}
