import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  ImagePicker imagePicker=ImagePicker();

 List <File> ? selectedImage =[];

  Future <void> imageSelector() async{
  List  <XFile>?images = await imagePicker.pickMultiImage( );
    if (images != null && mounted){

      setState(() {

        selectedImage!.addAll(images.map((toElement)=>File(toElement!.path)).toList());


      });

    }
  }


  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,

      appBar: AppBar(
       backgroundColor: Colors.transparent,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage("assets/background.jpg")
          )
        ),
        child: ListView(
          children: [
            SizedBox(height: 30,),
selectedImage!.isEmpty ?

Container(
  color: Colors.white38,
  height: 150, width: MediaQuery.sizeOf(context).width-20,

  child:  IconButton(onPressed: (){
imageSelector();


  }, icon: Icon(Icons.camera_alt)),)
    :Row(
      children: [


        Container(
          color: Colors.white38,
          height: 100, width:100 ,

          child:  IconButton(onPressed: (){
            imageSelector();


          }, icon: Icon(Icons.camera_alt)),),


        SizedBox(height: 100,
          width:  MediaQuery.sizeOf(context).width-120,
          child: ListView(
            scrollDirection: Axis.horizontal, //3lshan el swr tt3rd bshkl horizontally
            children:selectedImage!.map((toElement)=>Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.file(toElement,height: 100, width: 100,fit: BoxFit.cover,),
                ),

        IconButton(onPressed: (){

        setState(() {
          selectedImage!.removeAt(selectedImage!.indexOf(toElement));
        });

        }, icon: Icon(Icons.cancel))





              ],
            )).toList(),),
        ),
      ],
    )
,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: body,
                minLines: 3,
                maxLines: 7,

                decoration: InputDecoration(
                hintText: "body",
                border: OutlineInputBorder(),
              ),
              ),
            ),
          ],
        ),
      ),
// 3lshan lma a3ml click 3la icon el save ywdeni ll homePage
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),

        onPressed: () {
          //push replacement bdl push bt5li el el shm eli fe el shmal ytshal
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(
            title: title .text,
            body: body .text,
            image:selectedImage,

          )));

        },
      ),
    );
  }
}













//task3
//
// import 'package:flutter/material.dart';
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});
//
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   final TextEditingController title = TextEditingController();
//   final TextEditingController body = TextEditingController();
//
//   @override
//   void dispose() {
//     title.dispose();
//     body.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 150),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: title,
//                 decoration: InputDecoration(
//                   hintText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: body,
//                 minLines: 3,
//                 maxLines: 7,
//                 decoration: InputDecoration(
//                   hintText: "Description",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Image.asset("assets/Me.jpg"),
//           ],
//         ),
//       ),
//     );
//   }
// }
