import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final List<int> _prevPages = [];

  void _onPageChanged(int index, TabsRouter tabsRouter) {
    if (_selectedPage == index) return;
    setState(() {
      _prevPages.add(_selectedPage);
      _selectedPage = index;
      tabsRouter.setActiveIndex(index); // Update the TabsRouter index
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return PopScope(
          onPopInvoked: (didPop) async {
            if (_prevPages.isNotEmpty) {
              setState(() {
                _selectedPage = _prevPages.removeLast();
                tabsRouter.setActiveIndex(_selectedPage);
              });
            } else {
              await SystemNavigator.pop();
            }
          },
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: Text(['Chats', 'Stories', 'Maps'][tabsRouter.activeIndex]),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    getIt.get<DialogService>().showSettingsSheetDialog(context);
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (index) {
                _onPageChanged(index, tabsRouter);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo),
                  label: 'Stories',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
              ],
            ),
          ),
        );
      },
      routes: const [
        ChatsRoute(),
        StoriesRoute(),
        MapRoute(),
      ],
    );
  }
}
