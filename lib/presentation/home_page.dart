import 'package:birthday/presentation/components/my_material_bitton.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlipCardController _controller;
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = (opacityLevel == 0) ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Style",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 5),
              curve: Curves.bounceIn,
              child: SizedBox(
                width: 300,
                height: 300,
                child: FlipCard(
                  controller: _controller,
                  direction: FlipDirection.HORIZONTAL,
                  speed: 2000,
                  onFlipDone: (status) {
                    print(status);
                  },
                  front: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('I have',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                        Text('something for you...',
                            style: TextStyle(fontSize: 28, color: Colors.white)),
                      ],
                    ),
                  ),
                  back: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Happy Birthday",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5,),
                          ],
                        ),
                        Text(
                          "My Dear!",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyMaterialButton(
              onTap: _changeOpacity,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
