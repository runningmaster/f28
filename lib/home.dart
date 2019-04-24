import 'package:flutter/material.dart';

import 'package:f28/wdgt.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabbedPage(), //_MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TestOne('SEARCH'))),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestTNF())),
              child: const Text('Names and forms'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestAPI())),
              child: const Text('Active ingredients'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestATC())),
              child: const Text('ATC Classification'),
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: Icon(Icons.add),
      //),
    );
  }
}

/*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),*/

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '1'),
    Tab(text: '2'),
    Tab(text: '3'),
    Tab(text: '4'),
    Tab(text: '5'),
    Tab(text: '6'),
    Tab(text: '7'),
    Tab(text: '8'),
    Tab(text: '9'),
    Tab(text: '10'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return TabBarViewItem(tab.text, _tabController);
        }).toList(),
      ),
    );
  }
}

class TabBarViewItem extends StatelessWidget {
  final String _text;
  final TabController _tabController;

  TabBarViewItem(this._text, this._tabController);

  @override
  Widget build(BuildContext context) {
    //if (_tabController.indexIsChanging) {
    print(_tabController.index);
    //}
    return Center(child: Text(_text));
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: '1'),
                Tab(text: '2'),
                Tab(text: '3'),
                Tab(text: '4'),
                Tab(text: '5'),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              TabBarViewItem1(),
              TabBarViewItem2(),
              TabBarViewItem3(),
              TabBarViewItem4(),
              TabBarViewItem5(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarViewItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TabBarViewItem1");
    //return Icon(Icons.directions_car);
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Ingredient 1'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 1'))),
          ),
          ListTile(
            title: Text('Ingredient 2'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 2'))),
          ),
          ListTile(
            title: Text('Ingredient 3'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 3'))),
          ),
          ListTile(
            title: Text('Ingredient 4'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 4'))),
          ),
          ListTile(
            title: Text('Ingredient 5'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 5'))),
          ),
          ListTile(
            title: Text('Ingredient 6'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 6'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 7'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 9'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
          ListTile(
            title: Text('Ingredient 10'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestOne('Ingredient 7'))),
          ),
        ],
      ).toList(),
    );
  }
}

class TabBarViewItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TabBarViewItem2");
    return Icon(Icons.directions_transit);
  }
}

class TabBarViewItem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TabBarViewItem3");
    return Icon(Icons.directions_bike);
  }
}

class TabBarViewItem4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TabBarViewItem4");
    return Icon(Icons.directions_boat);
  }
}

class TabBarViewItem5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TabBarViewItem5");
    return Icon(Icons.directions_railway);
  }
}
