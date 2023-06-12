import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo("Busca la comida", "Lorem ipsum dolor sit amet consectetur adipiscing elit donec, tortor dis sem egestas maecenas malesuada semper, torquent faucibus ligula turpis nibh aenean placerat", "assets/widgets/1.png"),
  SlideInfo("Entrega rapida", "Bibendum viverra mollis duis sem ridiculus aptent habitant, nec vulputate netus nam dictum habitasse litora, facilisis sollicitudin pharetra aliquam purus maecenas.", "assets/widgets/2.png"),
  SlideInfo("Disfruta la comida", "Rutrum sapien tempus facilisi luctus eros posuere fermentum lacus ridiculus sociosqu auctor volutpat, sed ut tempor eleifend dictumst ligula cubilia diam neque faucibus.", "assets/widgets/3.png"),
];


class AppTutorialScreen extends StatefulWidget{
  static const String name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if(!endReached && page >= slides.length - 1.5){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("App Tutorial")),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl)).toList(),
          ),
          Positioned(right: 20, top: 40, child: TextButton(onPressed: () => context.pop(), child: const Text("Salir"))),
          if(endReached)
            Positioned(right: 20, bottom: 40, child: FadeInRight(child: FilledButton(onPressed: () => context.pop(), child: const Text("Comenzar"))))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget{
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({super.key, required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge ;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
