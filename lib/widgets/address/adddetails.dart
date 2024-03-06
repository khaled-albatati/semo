import 'package:semo/controller/address/adddetails_controller.dart';
import 'package:semo/data/model/addressmodel_price.dart';
import 'package:semo/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/handling_dataview.dart';
import '../auth/customtextformauth.dart';
import '../from_to/screen.dart';

class AddressAddDetails extends StatefulWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  State<AddressAddDetails> createState() => _AddressAddDetailsState();
}

class _AddressAddDetailsState extends State<AddressAddDetails> {
  String? selectedLocation;
  AddAddressDetailsController controller =
      Get.put(AddAddressDetailsController());
  @override
  Widget build(BuildContext context) {
    final data = controller.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة عنوان'),
      ),
      body: GetBuilder<AddAddressDetailsController>(
    
        builder: (controller) =>HandlingDataView(statusRequiest: controller.statusRequest, widget:  Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(children: [
            FromToScreen(
              location: 'المنطقة',
              widget: DropdownButton<String>(
                hint: const Text('اختر موقع'),
                value: controller.selectedLocation,
                items: data.map<DropdownMenuItem<String>>(
                  (AddressModelPrice value) =>
                     DropdownMenuItem<String>(
                      value: value.addresspriceAddressname,
                      child: Text(
                        '${value.addresspriceAddressname}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  
                ).toList(),
                onChanged: (String? newValue) {
                  setState(
                    () {
                      controller.selectedLocation = newValue;
                      // print(controller.selectedLocation);
                    },
                  );
                },
              ),
            ),
            CustomTextFormAuth(
                hinttext: 'اسم الحي',
                labeltext: 'اسم الحي',
                iconData: Icons.location_city,
                mycontroller: controller.lat,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            CustomTextFormAuth(
                hinttext: 'الشارع',
                labeltext: 'الشارع',
                iconData: Icons.drive_eta,
                mycontroller: controller.street,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            CustomTextFormAuth(
                hinttext: 'التفاصيل',
                labeltext: 'التفاصيل',
                iconData: Icons.notes,
                mycontroller: controller.long,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            CustomButton(
              text: '167'.tr,
              onPressed: () {
                controller.addAddress();
              },
            )
          ]),
        ),
      ),))
      // )),
    );
  }
}
