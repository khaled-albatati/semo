import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class HomeSubtitle extends StatelessWidget {
  final String title;
  const HomeSubtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  color: AppColor.orange,
                                ),
                              ], borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    title,
                                    style: Helper.getTheme(context)
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            );
  }
}