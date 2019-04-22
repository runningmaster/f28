import 'package:flutter/material.dart';
import 'dart:math';

String randomIntToString(int i) {
  var rng = new Random();
  var x = rng.nextInt(i);
  if (x == 0) {
    x = 1;
  }
  return x.toString();
}

class _Item {
  final String name;
  final String form;
  _Item({this.name, this.form});
}

List<_Item> makeList() {
  return [
    _Item(name: 'NAME 01', form: 'form form'),
    _Item(name: 'NAME 02', form: 'form form'),
    _Item(
        name:
            'NAME Foooooooooooooooooooooo Baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaar 03',
        form: 'form form'),
    _Item(
        name: 'NAME 04',
        form: 'form form + form form + form form + form form + form form'),
    _Item(name: 'Name 05', form: 'form form'),
    _Item(
        name:
            'NAME Buuuuuuuuuuuuuuuuuuuuuuuuuz Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar Foo Bar 06',
        form: 'form form'),
    _Item(name: 'Name 07', form: 'form form'),
    _Item(
        name: 'NAME 08',
        form:
            'form form + form form + form form form form + form form form form'),
    _Item(name: 'NAME', form: 'form + form + form + form form form + form'),
    _Item(name: 'NAME', form: 'таблетки'),
    _Item(name: 'NAME 1000', form: 'таблетки п/о'),
    _Item(name: 'NAME 500', form: 'таблетки п/о'),
  ];
}

List<Widget> _listToWdgt(List<_Item> l, BuildContext context) {
  return l
      .map((_Item e) => ListTile(
            title: InkWell(
              child: Text(
                e.name,
                style: TextStyle(color: Color(0xff1a0dab)),
              ),
              onTap: () => print("print onTap"),
            ),
            subtitle: RichText(
              text: TextSpan(
                  text: 'form one',
                  style: TextStyle(color: Color(0xff333333)),
                  children: [
                    TextSpan(
                      text: ' + ',
                    ),
                    TextSpan(
                      text: 'form two',
                      style: TextStyle(color: Color(0xff1a0dab)),
                      // recognizer: GestureRecognizer()..onTap = () => print('Tap Here onTap'),
                    ),
                    TextSpan(
                      text: ' + ',
                    ),
                    TextSpan(
                      text: 'form three',
                      style: TextStyle(color: Color(0xff1a0dab)),
                    ),
                  ]),
            ),
          ))
      .toList();
}

class TestList extends StatelessWidget {
  TestList({this.list});
  final List<_Item> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: _listToWdgt(list, context),
      ).toList(),
    );
  }
}

class TestTNF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name and forms'),
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
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('NAME 1'),
              subtitle: Text('form1 + form2 + form3'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestOne('NAME 1'))),
            ),
            ListTile(
              title: Text('NAME 2'),
              subtitle: Text('form1'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestOne('NAME 2'))),
            ),
            ListTile(
              title: Text('NAME 3'),
              subtitle: Text('form1 + form2'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestOne('NAME 3'))),
            ),
            ListTile(
              title: Text('NAME 4'),
              subtitle: Text('form1 + form3'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestOne('NAME 4'))),
            ),
            ListTile(
              title: Text('NAME 5'),
              subtitle: Text('form1 + form2 + form3'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestOne('NAME 5'))),
            ),
          ],
        ).toList(),
      ),
    );
  }
}

class TestOne extends StatelessWidget {
  final String name;
  TestOne(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: name != "SEARCH"
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TestOne('SEARCH'))),
                ),
              ]
            : null,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TestOne('NAME ' + randomIntToString(100)))),
              child: const Text('NAME X'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TestOne('Ingredient ' + randomIntToString(100)))),
              child: const Text('Ingredient Y'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TestATC())),
              child: const Text('ATC Code Z'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active ingredients'),
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
      body: ListView(
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
          ],
        ).toList(),
      ),
    );
  }
}

class TestATC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATC Classification'),
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
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('A Node'),
              onTap: () {},
            ),
            ListTile(
              title: Text('B Node'),
              onTap: () {},
            ),
            ListTile(
              title: Text('C Node'),
              onTap: () {},
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TestOne('NAME ' + randomIntToString(100)))),
              child: const Text('NAME X'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TestOne('Ingredient ' + randomIntToString(100)))),
              child: const Text('Ingredient Y'),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
