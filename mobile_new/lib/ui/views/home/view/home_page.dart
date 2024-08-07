import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
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
      child: AutoTabsScaffold(
        routes: const [
          ChatsRoute(),
          StoriesRoute(),
          MapRoute(),
        ],
        appBarBuilder: (_, tabsRouter) {
          return AppBar(
            title: Text(['Chats', 'Stories', 'Map'][tabsRouter.activeIndex]),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  getIt.get<DialogService>().showSettingsSheetDialog(context);
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          );
        },
        bottomNavigationBuilder: (_, tabsRouter) {
          // return Navigation(
          //   selectedIndex: selectedPage,
          //   onChanged: onPageChanged,
          // );
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              onPageChanged(index);
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                label: 'Stories',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
            ],
          );
        },
      ),
    );
  }
}
