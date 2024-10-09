import 'package:semo/controller/address/view_controller.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/handling_dataview.dart';
import '../../const/colors.dart';
import '../../data/model/addressmodel.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.navbar);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text('163'.tr),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.orange,
            onPressed: () {
              Get.toNamed(AppRoutes.addressadddetails);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
            statusRequiest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return CardAddress(
                  addressModel: controller.data[i],
                  onDelete: () {
                    controller.deleteAddress(controller.data[i].addressId!);
                  },
                );
              },
            ),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet}"),
            trailing: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                color: Color.fromARGB(255, 0, 94, 189),
              ),
            )),
      ),
    );
  }
}
