import 'package:auto_route/annotations.dart';
import 'package:blizz_chat/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List<int> prevPages = [];

  void onPageChanged(int index) {
    if (selectedPage == index) return;
    setState(() {
      prevPages.add(selectedPage);
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (prevPages.isNotEmpty) {
          setState(() {
            selectedPage = prevPages.removeLast();
          });
        }
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(['Chats', 'Stories', 'Map'][selectedPage]),
          automaticallyImplyLeading: false,
          actions: [],
        ),
        body: [
          const Center(
            child: Text('Chats'),
          ),
          const Center(
            child: Text('Stories'),
          ),
          const Center(
            child: Text('Map'),
          ),
        ][selectedPage],
        bottomNavigationBar: Navigation(
          selectedIndex: selectedPage,
          onChanged: onPageChanged,
        ),
      ),
    );
  }
}
