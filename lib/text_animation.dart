import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animationController
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => TextShimmer(
                      key: ValueKey('$index'),
                      animationController: _animationController,
                      length: 6,
                      char: 'Anutio'[index],
                      index: index + 1,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TextShimmer extends StatefulWidget {
  const TextShimmer({
    required this.animationController,
    required this.length,
    required this.char,
    required this.index,
    super.key,
  });
  final AnimationController animationController;
  final int length;
  final String char;
  final int index;

  @override
  State<TextShimmer> createState() => _TextShimmerState();
}

class _TextShimmerState extends State<TextShimmer> {
  late Animation<double> _scaleAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    final startValue = (widget.index / widget.length) * 0.5;
    final endValue = math.min(startValue + 0.2, 1);

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.toDouble(), end: 1.25)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.25, end: 1.toDouble())
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(startValue, endValue.toDouble()),
      ),
    );

    colorAnimation = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(
          begin: const Color.fromARGB(255, 61, 74, 124),
          end: Colors.white,
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: const Color.fromARGB(255, 49, 56, 82),
          end: Colors.white,
        ),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(startValue, endValue.toDouble()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Text(
        widget.char,
        style: theme.textTheme.displayLarge!.copyWith(
          color: colorAnimation.value,
          fontSize: 56,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
