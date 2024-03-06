import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class CompleteCheckOut extends StatelessWidget {
  const CompleteCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helper.getScreenHeight(context) * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            Image.asset(
              Helper.getAssetName(
                "vector4.png",
                "virtual",
              ),
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'شكرا لاختياركم خدمتنا',
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('يتم تنفيذ طلبك الان الرجاء الانتظار خلال 90 دقيقة'),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("موافق"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              // child: TextButton(
              //   onPressed: () {
              //     // Navigator.of(context)
              //     //     .pushReplacementNamed(
              //     //         HomeScreen.routeName);
              //   },
              //   child: const Text(
              //     "",
              //     style: TextStyle(
              //       color: AppColor.primary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
