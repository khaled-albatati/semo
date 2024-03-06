import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/signup_controller.dart';
// import 'package:semo/screens/home_screen.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text_form_field.dart';

// var serverToken ="AAAAN8F55iY:APA91bHdwPDAk0VAGpPVDXI0BeWkVfSOlO_7ehCNczgF09N_wpQCyvDzB6rI2s9bK-uBqIvBxpkJ8dRclQsiepKXnNCFNpGzD6629SVs4RzAG139_mk985N9-3dz8S7sEQQvy76SnFSQ" ;
// sendNotify(String title , String body , String id) async{
//  await http.post(
// Uri.parse('https://fcm.googleapis.com/fcm/send'),
// headers:<String,String>{
//   'Content-Type':'application/json',
//   'Authorization':'key=$serverToken',
// },
// body:jsonEncode(
//   <String,dynamic>{
//     'notification':<String,dynamic>{
//       'body':body.toString(),
//       'title':title.toString()
//     },
//     'priority':'high',
//     'data':<String,dynamic>{
//       'click_action':'FLUTTER_NOTIFICATION_CLICK',
//       'id':id.toString()
//     },
//     'to':'/topics/all',
//   }
// ));}

class RegisterView extends GetView<SignUpControllerImp> {
  final _formKeys = GlobalKey<FormState>();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // SignUpControllerImp controller = Get.put(SignUpControllerImp());

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leading: GestureDetector(
        //     onTap: () {
        //       Get.off(const HomeScreen());
        //     },
        //     child: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKeys,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  myController: controller.phone,
                  text: 'Phone',
                  hint: '778844278',
                  onSave: (value) {
                    controller.phone = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      if (kDebugMode) {
                        print("ERROR");
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                // CustomTextFormField(
                //   text: 'Email',
                //   hint: 'iamdavid@gmail.com',
                //   onSave: (value) {
                //     controller.email = value;
                //   },
                //   validator: (value) {
                //     if (value == null) {
                //       if (kDebugMode) {
                //         print("ERROR");
                //       }
                //     }
                //   },
                // ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  myController: controller.password,
                  text: 'password',
                  hint: '*********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      if (kDebugMode) {
                        print("ERROR");
                      }
                    }
                    return null;
                  },
                ),
                // TextField(
                //   // text: 'Password',
                //   // hint: '**********',
                //   // onSave: (value) {
                //     controller:password ,
                //   // },
                //   // validator: (value) {
                //   //   if (value == null) {
                //   //     print('error');
                //   //   }
                //   // },
                // ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(onPress: () {
                  // await FirebaseMessaging.instance.subscribeToTopic('all');
                  // print(controller.email!); //  _formKeys.currentState?.save();
                  //   if (_formKeys.currentState!.validate()) {
                  //     controllercreateAccountWithEmailAndPassword();
                }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
