import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  FlipCard({super.key, required this.frontText, required this.backText});
  @override
  _FlipCardState createState() => _FlipCardState();

  final String frontText;
  final String backText;
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _frontRotation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0, 0.5, curve: Curves.linear)),
    );
    _backRotation = Tween<double>(begin: -0.5, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1, curve: Curves.linear)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isFlipped = !_isFlipped;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final frontRotationValue = _frontRotation.value * 3.14159;
          final backRotationValue = _backRotation.value * 3.14159;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_isFlipped ? backRotationValue : frontRotationValue),
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _isFlipped ? _BackCardContent(text: widget.backText) : _FrontCardContent(text: widget.frontText),
            ),
          );
        },
      ),
    );
  }
}

class _FrontCardContent extends StatelessWidget {
  _FrontCardContent({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BackCardContent extends StatelessWidget {
  _BackCardContent({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
