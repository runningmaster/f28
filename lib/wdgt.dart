import 'package:flutter/material.dart';

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
        title: Text("Name and forms"),
      ),
      body: Text("List of names and forms"),
    );
  }
}

class TestTNFOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name and forms"),
      ),
      body: Text("List of names and forms"),
    );
  }
}

class TestAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active ingredients"),
      ),
      body: Text("List of active pharmaceutical ingredient"),
    );
  }
}

class TestAPIOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active ingredients"),
      ),
      body: Text("List of active pharmaceutical ingredient"),
    );
  }
}

class TestATC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATC/DDD Classification"),
      ),
      body: Text("Tree of ATC/DDD classification"),
    );
  }
}
