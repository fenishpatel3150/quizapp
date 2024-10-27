import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/Auth_services.dart';

class LiderBordScreen extends StatelessWidget {
  const LiderBordScreen({super.key});

  Stream<QuerySnapshot<Object?>> getUser() {
    // Replace with your updated getUser method
    return FirebaseFirestore.instance
        .collection('Users')
        .orderBy('Quizscore', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6a5ae0),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LeaderBoard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 400.h,
              decoration: BoxDecoration(
                color: Color(0xffe8e5fa),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("No users found"));
                    }
                    // Build a list of users
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var userDoc = snapshot.data!.docs[index];
                        var username = userDoc['username'] ?? 'Unknown';
                        var quizScore = userDoc['Quizscore'] ?? 0;
                        var photoUrl = userDoc['photoUrl'];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70.h,
                            width: 300.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: photoUrl != null
                                          ? NetworkImage(photoUrl)
                                          : AssetImage('assets/image/Avatar/0.png')
                                      as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  username,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  quizScore.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class LiderBordScreen extends StatelessWidget {
//   const LiderBordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:  Color(0xff6a5ae0),
//       body: Column(
//         children: [
//           Padding(
//             padding:  EdgeInsets.only(top: 40.h,bottom: 10.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('LeaderBoard',style: TextStyle(color: Colors.white,fontSize: 25.h,fontWeight: FontWeight.bold),)
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               // height: 650.h,
//               width: 400.h,
//               decoration: BoxDecoration(
//                   color: Color(0xffe8e5fa),
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(20.r),
//                       topLeft: Radius.circular(20.r))),
//               child:
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 70.h,
//                         width: 300.h,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.h),
//                         ),
//                         child:
//                         Center(
//                           child: ListTile(
//                             leading: Container(
//                               height: 50.h,
//                               width: 50.h,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(image: AssetImage('assets/image/Avatar/0.png'))
//                               ),
//                             ),
//                             title: Text('Davis Curtis',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//                             subtitle: Text('5600',style: TextStyle(color: Colors.black),),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ), ),
//           ),
//         ],
//       ),
//     );
//   }
// }