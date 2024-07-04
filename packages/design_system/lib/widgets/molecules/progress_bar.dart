import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final Color color;
  final List<AnimatedProgressBarItem> progressBarItems;

  const ProgressBar({
    required this.progressBarItems,
    required this.color,
    super.key,
  });

  @override
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  double get containerHeight => 16;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width;
    final List<Positioned> children = [];
    widget.progressBarItems.asMap().forEach((index, item) {
      double left = index == 0 ? 0 : (containerWidth / 3.8) * index;

      children.add(
        Positioned(
          left: left,
          child: item,
        ),
      );
    });

    return SizedBox(
      height: 16,
      child: Stack(
        alignment: Alignment.center,
        children: children.reversed.toList(),
      ),
    );
  }
}

class AnimatedProgressBarItem extends StatefulWidget {
  final bool? isFirstItem;
  final Duration duration;
  final Duration? delay;
  final Color color;

  const AnimatedProgressBarItem({
    required this.color,
    required this.duration,
    this.isFirstItem,
    this.delay,
    super.key,
  });

  @override
  State<AnimatedProgressBarItem> createState() =>
      _AnimatedProgressBarItemState();
}

class _AnimatedProgressBarItemState extends State<AnimatedProgressBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final decoration = BoxDecoration(
      color: widget.color,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        width: 2,
        color: Colors.white,
      ),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width / 3.5),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                height: 16,
                width: width * _animation.value,
                decoration: decoration.copyWith(color: Colors.grey),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: width * _animation.value,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
