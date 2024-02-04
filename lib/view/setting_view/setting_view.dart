import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "Window Setting",
                ),
                Tab(
                  text: "Key Setting",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Text("!"),
                  Text("2"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
