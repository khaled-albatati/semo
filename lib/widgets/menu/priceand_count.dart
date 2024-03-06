import 'package:flutter/material.dart';
// import '../../core/constant/color.dart';

class PriceAndCountItems extends StatefulWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  // final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      // required this.price,
      required this.count})
      : super(key: key);

  @override
  State<PriceAndCountItems> createState() => _PriceAndCountItemsState();
}

class _PriceAndCountItemsState extends State<PriceAndCountItems> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
           IconButton(onPressed: widget.onRemove, icon: const Icon(Icons.remove,size: 16,),alignment:Alignment.centerLeft ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 0),
                width: 25,
                height: 25,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  widget.count,
                  style: const TextStyle(fontSize: 12, height: 1.1),
                )),
             IconButton(onPressed: widget.onAdd, icon: const Icon(Icons.add,size: 16,),alignment: Alignment.centerRight,),
          ],
        ),
        // const Spacer(),
        // Text(
        //   widget.price,
        //   style: const TextStyle(
        //       color: AppColor.primarycolor, fontSize: 12, height: 1.1),
        // )
      ],
    );
  }
}
