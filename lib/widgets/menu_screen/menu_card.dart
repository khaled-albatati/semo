import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required String name,
    required CustomClipper<Path> clipper,
    required String image,
    required String path,
    required String count,
    // required Widget imageShape,
  })  : _name = name,
        _count = count,
        _clipper = clipper,
        _image = image,
        _path = path,
        // _imageShape = imageShape,
        super(key: key);

  final String _name;
  final CustomClipper<Path> _clipper;
  final String _image;
  final String _path;
  final String _count;
  // final Widget _imageShape;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.placeholder,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: Helper.getTheme(context).headlineMedium?.copyWith(
                      color: AppColor.primary,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("$_count items")
            ],
          ),
        ),
        SizedBox(
          height: 85,
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                // _imageShape
                ClipPath(
              clipper: _clipper,
              child: SizedBox(
                height: 85,
                width: 85,
                child: Image.asset(
                  Helper.getAssetName(_image, _path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: AppColor.placeholder,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    )
                  ]),
              child: const Icon(Icons.arrow_forward_ios,color: Colors.orange),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    // ignore: unnecessary_new
    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1000000, size.height * 0.4400000);
    path.quadraticBezierTo(size.width * 0.0243800, size.height * 0.5247000,
        size.width * 0.1000000, size.height * 0.6000000);
    path.quadraticBezierTo(size.width * 0.3550000, size.height * 0.8250000,
        size.width * 0.4400000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.5140600, size.height * 0.9574800,
        size.width * 0.5800000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.8200000, size.height * 0.6450000,
        size.width * 0.9000000, size.height * 0.5600000);
    path.quadraticBezierTo(size.width * 0.9500400, size.height * 0.5009400,
        size.width * 0.9000000, size.height * 0.4200000);
    path.quadraticBezierTo(size.width * 0.6450000, size.height * 0.1800000,
        size.width * 0.5600000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.5029400, size.height * 0.0446800,
        size.width * 0.4200000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.3400000, size.height * 0.1850000,
        size.width * 0.1000000, size.height * 0.4400000);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
