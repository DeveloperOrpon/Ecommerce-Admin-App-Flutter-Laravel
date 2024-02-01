import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Profile'),
          actions: [
            // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
          ],
        ),
      ],
    );
  }
}
