import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageContent extends StatelessWidget {
  const ManageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Manage'),
          actions: [
            // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
          ],
        ),
      ],
    );
  }
}
