import 'package:flutter/material.dart';

class AnimatedBottomNav extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onPrevious;
  final VoidCallback onEditor;
  final VoidCallback onNext;

  const AnimatedBottomNav({
    super.key,
    required this.isVisible,
    required this.onPrevious,
    required this.onEditor,
    required this.onNext,
  });

  @override
  State<AnimatedBottomNav> createState() => _AnimatedBottomNavState();
}

class _AnimatedBottomNavState extends State<AnimatedBottomNav> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      offset: widget.isVisible ? Offset.zero : const Offset(0, 1),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 450),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: widget.onPrevious,
                    child: const Text("Previous"),
                  ),
                  TextButton(
                    onPressed: widget.onEditor,
                    child: const Text("Editor"),
                  ),
                  TextButton(
                    onPressed: widget.onNext,
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
