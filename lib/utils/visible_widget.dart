// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class VisibleWidget extends StatelessWidget {
  Widget child;
  bool visible;
  VisibleWidget({
    Key? key,
    required this.child,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible ? child : const SizedBox();
  }
}
