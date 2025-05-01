import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage  extends StatefulWidget {
   const ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker=ImagePicker();

  File ? selectedImage;

  Future <void> imageSelector(ImageSource source) async{
   XFile?image = await imagePicker.pickImage(source:source);
   if (image !=null && mounted){

setState(() {
  selectedImage= File(image.path);
});


     selectedImage = File(image.path);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


appBar: AppBar(title: Text("Profile"),),
      body: Column(children: [
        Center(child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(backgroundColor: Colors.grey.shade500,radius: 110,
              child:
              selectedImage==null?
              Icon(Icons.person,size: 200,color: Colors.white38,):
           ClipOval(child:Image.file(
             height: 200,
               width: 200,
               fit: BoxFit.cover,

               selectedImage!))
            ),
            CircleAvatar(backgroundColor: Colors.black,radius: 25,child: IconButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context)=>SizedBox(
                height:150 ,

                child:Column(children: [Text("Profile",style: TextStyle(fontSize: 25),),
                Divider(),// by3ml el kht eli t7t elklma
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                    children: [

                      Options(
                        onPressed: (){

                          imageSelector(ImageSource.camera);

                        },

                        title: "Camera",icon:Icons.camera_alt,),
                      Options(onPressed: (){
                        imageSelector(ImageSource.gallery);
                        Navigator.pop(context);
                      },title: "Gallery",icon:Icons.image,),

                     if(selectedImage!=null)
                       Options(
                       selectedImage:selectedImage,
                       onPressed: (){
                         if (mounted) {//y3ni lsa mwgoda 3ndi
                           setState(() {
                             selectedImage=null;
                           });
                         }
                         Navigator.pop(context);
                       },title: "delete",icon:Icons.delete,),

                   ],


                    )




                ],) ,

              ));

            }, icon: Icon(Icons.camera_alt,size: 35,color: Colors.grey,)))


          ],
        ))
      ],),








    );
  }
}
class Options extends StatelessWidget {

 final String title;
 final IconData icon;
Colors ? color;
File? selectedImage;
VoidCallback onPressed;

  Options({required this.onPressed,this.selectedImage,this.color,required this.title,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      IconButton(
        color: selectedImage==null? Colors.grey.shade800: Colors.red,
          icon:Icon(icon),

          onPressed:onPressed,
      ) ,
      Text(title,style: TextStyle(color: selectedImage==null?Colors.grey.shade800:Colors.red),)



    ],);
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart'; // For kIsWeb
// import 'package:image_picker/image_picker.dart';
// import 'package:cross_file/cross_file.dart'; // For XFile cross-platform support
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? selectedImage; // Changed from File to XFile
//   Uint8List? imageBytes; // For storing image bytes
//
//   Future<void> imageSelector(ImageSource source) async {
//     final XFile? image = await imagePicker.pickImage(source: source);
//     if (image != null && mounted) {
//       final bytes = await image.readAsBytes();
//       setState(() {
//         selectedImage = image;
//         imageBytes = bytes;
//       });
//     }
//   }
//
//   Widget _buildProfileImage() {
//     if (imageBytes != null) {
//       return ClipOval(
//         child: Image.memory(
//           imageBytes!,
//           height: 200,
//           width: 200,
//           fit: BoxFit.cover,
//         ),
//       );
//     }
//     return const Icon(Icons.person, size: 200, color: Colors.white38);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile")),
//       body: Column(
//         children: [
//           Center(
//             child: Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.grey.shade500,
//                   radius: 110,
//                   child: _buildProfileImage(),
//                 ),
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colors.black,
//                   child: IconButton(
//                     onPressed: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) => SizedBox(
//                           height: 150,
//                           child: Column(
//                             children: [
//                               const Text("Profile", style: TextStyle(fontSize: 25)),
//                               const Divider(),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Options(
//                                     onPressed: () {
//                                       imageSelector(ImageSource.camera);
//                                       Navigator.pop(context);
//                                     },
//                                     title: "Camera",
//                                     icon: Icons.camera_alt,
//                                   ),
//                                   Options(
//                                     onPressed: () {
//                                       imageSelector(ImageSource.gallery);
//                                       Navigator.pop(context);
//                                     },
//                                     title: "Gallery",
//                                     icon: Icons.image,
//                                   ),
//                                   if (imageBytes != null)
//                                     Options(
//                                       onPressed: () {
//                                         if (mounted) {
//                                           setState(() {
//                                             selectedImage = null;
//                                             imageBytes = null;
//                                           });
//                                         }
//                                         Navigator.pop(context);
//                                       },
//                                       title: "Delete",
//                                       icon: Icons.delete,
//                                       isDelete: true,
//                                     ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     icon: const Icon(Icons.camera_alt, size: 20, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Options extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onPressed;
//   final bool isDelete;
//
//   const Options({
//     required this.onPressed,
//     required this.title,
//     required this.icon,
//     this.isDelete = false,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           color: isDelete ? Colors.red : Colors.grey.shade800,
//           icon: Icon(icon),
//           onPressed: onPressed,
//         ),
//         Text(
//           title,
//           style: TextStyle(color: isDelete ? Colors.red : Colors.grey.shade800),
//         ),
//       ],
//     );
//   }
// }



