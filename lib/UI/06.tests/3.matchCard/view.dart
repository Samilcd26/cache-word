import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid View Örneği'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 5 / 4,
            ),
            children: [
              DraggableWidget("hello"),
              DraggableWidget("world"),
            ],
          ),
        ));
  }
}

class DraggableWidget extends StatefulWidget {
  final String name;

  DraggableWidget(this.name);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: widget.name,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(child: Text(widget.name)),
      ),
      feedback: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Center(child: Text(widget.name)),
      ),
      childWhenDragging: Container(),
    );
  }
}

class DroppableContainer extends StatefulWidget {
  @override
  _DroppableContainerState createState() => _DroppableContainerState();
}

class _DroppableContainerState extends State<DroppableContainer> {
  String text = 'Merhaba';

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (data) {
        if (data == 'Merhaba') {
          setState(() {
            text = 'Merhaba';
          });
        } else {
          setState(() {
            text = 'Kelime';
          });
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          color: Colors.grey,
          child: Text(text),
        );
      },
    );
  }
}
