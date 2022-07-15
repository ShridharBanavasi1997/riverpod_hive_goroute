import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/model/state_model.dart';
import 'package:riverpod_sample/modules/editicon/editicon_controller.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../../data/database/models/state_data.dart';
import '../../widget/circle_widget.dart';

class EditIcon extends ConsumerWidget {
  EditIcon({Key? key}) : super(key: key);

  final editController = EditIconController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    StateData state = ref.watch(editController.stateProvider);
    double zoomScale = state.size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Icons setter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200.0,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(zoomScale, zoomScale, zoomScale)),
              child: Icon(
                IconData(state.icon,fontFamily: 'MaterialIcons'),
                color: Color(state.color),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(15.0)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleButton(
                      onTap: () => {
                      ref.read(editController.stateProvider.notifier).changeColor(Colors.blue)
                      },
                      color: Colors.blue,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.brown)
                      },
                      color: Colors.brown,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.deepPurple)
                      },
                      color: Colors.deepPurple,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.green)
                      },
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.red)
                      },
                      color: Colors.red,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.pink)
                      },
                      color: Colors.pink,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.teal)
                      },
                      color: Colors.teal,
                    ),
                    CircleButton(
                      onTap: () => {
                        ref.read(editController.stateProvider.notifier).changeColor(Colors.indigoAccent)
                      },
                      color: Colors.indigoAccent,
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(15.0)),
          Slider(
            value: state.size,
            onChanged: (onChanged) => {
              ref.read(editController.stateProvider.notifier).setSize(onChanged)
            },
            min:5,
            max: 20,
            activeColor: Color(state.color),
            inactiveColor: Colors.grey,
            thumbColor: Color(state.color),
          )
        ],
      ),
    );
  }
}