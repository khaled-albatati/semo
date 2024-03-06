import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(33, 17, 0, 255),
          title: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.navbar);
            },
            icon: const Icon(
              Icons.home,
              size: 50,
            ),
            color: const Color.fromARGB(255, 255, 191, 0),
          ),
          centerTitle: true),
      backgroundColor: const Color.fromRGBO(33, 17, 0, 255),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 180, 24, 0),
              ),

              Image.asset(
                'assets/images/2.png',
                width: MediaQuery.sizeOf(context).width,
                height: 240,
                fit: BoxFit.cover,
              ),

              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Container(
              //         width: MediaQuery.sizeOf(context).width * 0.4,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.green,
              //           boxShadow: const [
              //             BoxShadow(
              //               blurRadius: 4,
              //               color: Color(0x37000000),
              //               offset: Offset(0, 1),
              //             )
              //           ],
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: InkWell(
              //           splashColor: Colors.transparent,
              //           focusColor: Colors.transparent,
              //           hoverColor: Colors.transparent,
              //           highlightColor: Colors.transparent,
              //           onTap: () async {},
              //           child: const Column(
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              //                 child: Icon(
              //                   Icons.bolt,
              //                   color: Colors.blue,
              //                   size: 44,
              //                 ),
              //               ),
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              //                 child: Text(
              //                   'Start t',
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                     fontFamily: 'Outfit',
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Padding(
              //                   padding:
              //                       EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
              //                   child: Text(
              //                     'Tap here to start your car.',
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                       color: Color(0xB3FFFFFF),
              //                       fontSize: 12,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: MediaQuery.sizeOf(context).width * 0.4,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.amber,
              //           boxShadow: const [
              //             BoxShadow(
              //               blurRadius: 3,
              //               color: Color(0x39000000),
              //               offset: Offset(0, 1),
              //             )
              //           ],
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: const Column(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Padding(
              //               padding:
              //                   EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              //               child: Icon(
              //                 Icons.electric_car,
              //                 color: AppColor.cyan,
              //                 size: 44,
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              //               child: Text(
              //                 'Car Charging',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontFamily: 'Outfit',
              //                     color: AppColor.backgroundColor),
              //               ),
              //             ),
              //             Expanded(
              //               child: Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
              //                 child: Text(
              //                   'Current Status\n30m until full',
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                     color: Color(0xB3FFFFFF),
              //                     fontSize: 12,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
