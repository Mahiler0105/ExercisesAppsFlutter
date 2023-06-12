import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = "infinite_scroll_screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final imageIds = <int>[1, 2, 3, 4, 5];
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addNewImages() {
    var lastId = imageIds.last;
    var newIds = Iterable.generate(5, (generator) => lastId + generator);
    imageIds.addAll(newIds);
  }

  Future loadNextImage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addNewImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future onRefreshImages() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));

    if(!isMounted) return;

    isLoading = false;
    var lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addNewImages();

    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextImage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: onRefreshImages,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imageIds.length,
              // physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInImage(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage("assets/widgets/jar-loading.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/id/${imageIds[index]}/500/300"));
              }),
        ),
      ),
    );
  }
}
