import 'package:flutter/material.dart';

import 'fake_datas.dart';

class DaangnScreen extends StatefulWidget {
  @override
  State<DaangnScreen> createState() => DaangnScreenState();
}

class DaangnScreenState extends State<DaangnScreen> {
  var scrollController = ScrollController();

  DaangnScreenState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels + 100 > scrollController.position.maxScrollExtent) {
        setState(() {
          fakeDaangnItems.add({
            'title': '새로운 판매글',
            'price': '10000원',
            'location': '서울',
            'time': '0',
            'imageUrl': 'https://picsum.photos/250?image=9',
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
        color: Colors.black12,
        child: ListView(
          controller: scrollController,
          children: fakeDaangnItems
              .map((title) => _buildListViewItem(title))
              .toList(),
        ));
  }

  Map<int, int> likes = {};

  Widget _buildListViewItem(Map<String, String> items) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          children: [
            _buildListViewItemImage(items['imageUrl']!),
            _buildListViewItemContents(items),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewItemImage(String imageUrl) {
    var isImageLoaded = false;
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.network(imageUrl,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null) {
          isImageLoaded = true;
        }
        return child;
      }, loadingBuilder: (context, child, loadingProgress) {
        if (isImageLoaded) {
          return child;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Expanded _buildListViewItemContents(Map<String, String> items) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(items['title']!),
            Row(
              children: [
                Text(items['price']!),
                Text(" - "),
                Text(items['location']!),
              ],
            ),
            Text("${items['time']!}시간 s전"),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          likes[items.hashCode] =
                              (likes[items.hashCode] ?? 0) + 1;
                        });
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                    Text((likes[items.hashCode] ?? 0).toString())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
