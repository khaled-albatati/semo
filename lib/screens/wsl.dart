import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/address/addressto_controller.dart';
import 'package:semo/data/model/from_to.dart';
import 'package:semo/widgets/from_to/screen.dart';
import '../const/colors.dart';
import '../core/class/handling_dataview.dart';
import '../widgets/checkout/button.dart';

class Wsl extends StatefulWidget {
  const Wsl({Key? key}) : super(key: key);

  @override
  State<Wsl> createState() => _WslState();
}

class _WslState extends State<Wsl> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before showing the screen
    Future.delayed(const Duration(seconds: 2), () {
      // Use Get.off instead of Get.to to replace the current screen with the Cart screen
      // Get.off(() => Cart());
    });
  }

  AddressToAddressController address = Get.put(AddressToAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مرسال"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AddressToAddressController>(builder: (controller) {
          final Set<String> uniqueSources = {};
          final Set<String> uniqueDestinations = {};
          final List<String> sourceList = [];
          final List<String> destinationList = [];

          for (AddressToAddress addressToAddress in controller.address) {
            if (!uniqueSources
                .contains(addressToAddress.addressToAddressSource)) {
              uniqueSources.add(addressToAddress.addressToAddressSource!);
              sourceList.add(addressToAddress.addressToAddressSource!);
            }

            if (!uniqueDestinations
                .contains(addressToAddress.addressToAddressDestination)) {
              uniqueDestinations
                  .add(addressToAddress.addressToAddressDestination!);
              destinationList
                  .add(addressToAddress.addressToAddressDestination!);
            }
          }

          return HandlingDataView(
            statusRequiest: controller.statusRequiest,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Image.asset(
                    'assets/images/semo.png',
                    width: double.infinity,
                    height: 200,
                    // fit: BoxFit.cover,
                  ),
                ),
                // const CustomTitle(title: 'اكمال الطلب'),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<AddressToAddressController>(
                  builder: (x) => HandlingDataView(
                    statusRequiest: x.statusRequiest,
                    widget: Column(
                      children: [
                        FromToScreen(
                          location: 'منطقة الارسال',
                          widget: DropdownButton<String>(
                            hint: const Text('اختر موقع'),
                            value: address.selectedLocation,
                            items: sourceList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                address.selectedLocation = newValue;
                                final selectedLocationData =
                                    address.address.firstWhere(
                                  (location) =>
                                      location.addressToAddressSource ==
                                      newValue,
                                );
                                // if (selectedLocationData != null) {
                                address.addressToAddress = selectedLocationData;
                                address.fetchPrice();
                                // }
                              });
                            },
                          ),
                        ),
                        //destination
                        FromToScreen(
                          location: 'منطقة الاستلام',
                          widget: DropdownButton<String>(
                            hint: const Text('اختر موقع'),
                            value: address.selectedLocation1,
                            items: destinationList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                address.selectedLocation1 = newValue;
                                final selectedLocationData =
                                    address.address.firstWhere(
                                  (location) =>
                                      location.addressToAddressDestination ==
                                      newValue,
                                );
                                // if (selectedLocationData != null) {
                                address.addressToAddress = selectedLocationData;
                                address.fetchPrice();
                                address.update();
                                // }
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor
                                  .orange, // Specify your desired border color here
                              // Specify your desired border color here
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextField(
                            controller: address.details,
                            decoration: const InputDecoration(
                              hintText: 'ادخل تفاصيل النقل',
                              border: InputBorder
                                  .none, // Remove the default TextField border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('سعر التوصيل : ${address.price}'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                ButtonCheckOut(
                    onPressed: () => address.sendLocations(address.price.toString()),
                    text: 'اتمام الطلب'),
              ],
            ),
          );
        }),
      ),
    );
  }
}
