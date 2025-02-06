import 'package:flutter/material.dart';

final data = [
  {
    'img':
        'https://media.istockphoto.com/id/1317323736/photo/a-view-up-into-the-trees-direction-sky.jpg?s=612x612&w=0&k=20&c=i4HYO7xhao7CkGy7Zc_8XSNX_iqG0vAwNsrH1ERmw2Q=',
    'text':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Nullam ac erat ante. Integer ac nisi nec dui vestibulum vestibulum. Sed sit amet sapien a libero feugiat tincidunt.',
    'title': 'A View Up Into The Trees',
    'subtitle': 'A beautiful view of the trees from below'
  },
  {
    'img':
        'https://u4d2z7k9.rocketcdn.me/wp-content/uploads/2021/10/rsz_sk_rahaman_hossain_1-min.jpg',
    'text':
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    'title': 'Beautiful Sunset',
    'subtitle': 'A mesmerizing sunset view'
  },
  {
    'img':
        'https://media.easemytrip.com/media/Blog/India/637870903728666071/637870903728666071B4iTsT.jpg',
    'text':
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'title': 'Serene Landscape',
    'subtitle': 'A peaceful and serene landscape'
  },
  {
    'img':
        'https://www.travelanddestinations.com/wp-content/uploads/2019/07/Mount-Bromo-natural-wonders.jpg',
    'text':
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
    'title': 'Mount Bromo',
    'subtitle': 'The majestic Mount Bromo'
  },
  {
    'img': 'https://storage.georgia.travel/images/nature-of-georgia.webp',
    'text':
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
    'title': 'Nature of Georgia',
    'subtitle': 'The stunning nature of Georgia'
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  void _goToNext() {
    setState(() {
      index < data.length - 1 ? index++ : index = 0;
    });
  }

  void _goToPrevious() {
    setState(() {
      index > 0 ? index-- : index = data.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _imageSection(index, next: _goToNext, previous: _goToPrevious),
            _headerSection(index),
            _navigationSection(),
            _bodySection(index),
          ],
        ),
      ),
    );
  }
}

Widget _imageSection(int index,
    {required VoidCallback next, required VoidCallback previous}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Image.network(
        data[index]['img'] ?? '',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
      Positioned.fill(
        child: Center(
          child: Text(data[index]['title'] ?? '',
              style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        top: 0,
        child: Center(
          child: IconButton(
              onPressed: next,
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 50,
                color: Colors.white,
              )),
        ),
      ),
      Positioned(
        left: 0,
        bottom: 0,
        top: 0,
        child: Center(
          child: IconButton(
              onPressed: previous,
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                size: 50,
                color: Colors.white,
              )),
        ),
      ),
      Positioned(
        right: 0,
        bottom: -35,
        left: 10,
        child: Center(
          child: IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.red,
              )),
        ),
      ),
    ],
  );
}

Widget _headerSection(int index) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data[index]['title'] ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              data[index]['subtitle'] ?? '',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
        Spacer(),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text(
          '9.5',
        )
      ],
    ),
  );
}

Widget _navigationSection() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'CALL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.near_me, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'ROUTE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.share, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'SHARE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _bodySection(int index) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      data[index]['text'] ?? '',
      style: TextStyle(fontSize: 16),
    ),
  );
}
