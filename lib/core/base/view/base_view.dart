import 'package:flutter/material.dart';

class BaseView<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model)? onModelReady;

  const BaseView({
    Key? key,
    required this.viewModel,
    this.onModelReady,
    required this.onPageBuilder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (onModelReady != null) onModelReady!(viewModel);
    return onPageBuilder(context, viewModel);
  }
}
