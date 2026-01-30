import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semo/const/colors.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import 'package:semo/core/constant/zero.dart';
import 'package:semo/core/functions/validation.dart';
import 'package:semo/utils/helper.dart';

class EditPage extends GetView<ProfileControllerImp> {
  const EditPage({super.key});

  // static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    String email = myServices.sharedPreferences.getString('email').toString();
    String username =
        myServices.sharedPreferences.getString('username').toString();
    String userphone =
        myServices.sharedPreferences.getString('userphone').toString();
    String userwhats =
        myServices.sharedPreferences.getString('userwhats').toString();
    Get.put(ProfileControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("المعلومات الشخصية"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Helper.getAssetName("splashIcon.png", "virtual"),
                  ))),
          child: Stack(
            children: [
              SafeArea(
                child: SizedBox(
                  width: Helper.getScreenWidth(context),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Helper.getAssetName(
                                      "edit_filled.png", "virtual"),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "تعديل الحساب",
                                  style: TextStyle(color: AppColor.orange),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "مرحبا بك : ${controller.myServices.sharedPreferences.getString('username')}",
                              style: Helper.getTheme(context)
                                  .headlineMedium
                                  ?.copyWith(
                                    color: AppColor.primary,
                                  ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ]),
                          TextFormField(
                              textAlign: TextAlign.center,
                              controller: controller.username,
                              decoration: InputDecoration(
                                labelText: 'الاسم',
                                hintText: username,
                              ),
                              validator: (val) {
                                return validInput(val!, 3, 25, "username");
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller.email,
                            decoration: InputDecoration(
                                labelText: 'البريد الالكتروني',
                                hintText: email),
                            validator: (val) {
                              return validInput(val!, 5, 50, "email");
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller.phone,
                            decoration: InputDecoration(
                                labelText: 'رقم الجوال', hintText: userphone),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (val) {
                              return validInput(
                                val!,
                                9,
                                9,
                                "phone",
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller.whatsapp,
                            decoration: InputDecoration(
                                labelText: 'الواتس اب', hintText: userwhats),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (val) {
                              return validInput(
                                val!,
                                9,
                                9,
                                "phone",
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () => controller.updateProfile(),
                              child: const Text("حفظ"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            // width: double.infinity,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("تسجيل خروج"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // ),
            ],
          ),
        ));
  }
}
