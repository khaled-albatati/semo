// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/configuration_controller.dart';

// class ConfigurationPage extends StatelessWidget {

//    ConfigurationPage({super.key});

//   final ConfigurationController controller = Get.put(ConfigurationController());

//   Future<void> _selectTime(BuildContext context, String type) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (picked != null) {
//       controller.setTime(picked, type);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Configuration")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SwitchListTile(
//               title: const Text("Subscribe to Topic"),
//               value: controller.isSubscribed,
//               onChanged: (value) {
//                 controller.toggleSubscription();
//               },
//             ),
//             SwitchListTile(
//               title: const Text("Send Status"),
//               value: controller.isSending,
//               onChanged: (value) {
//                 controller.sendData();
//               },
//             ),
//             ListTile(
//               title: Text("Open Day: ${controller.openDay.format(context)}"),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => _selectTime(context, 'openDay'),
//             ),
//             ListTile(
//               title: Text("Close Day: ${controller.closeDay.format(context)}"),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => _selectTime(context, 'closeDay'),
//             ),
//             ListTile(
//               title: Text("Open Night: ${controller.openNight.format(context)}"),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => _selectTime(context, 'openNight'),
//             ),
//             ListTile(
//               title: Text("Close Night: ${controller.closeNight.format(context)}"),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => _selectTime(context, 'closeNight'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }