import 'package:flutter/material.dart';

void main() {
  runApp(const BoilerPlateApp());
}

class BoilerPlateApp extends StatelessWidget {
  const BoilerPlateApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const BoilerPlateAppExample(),
    );
  }
}

enum Gender { male, female }

enum Job { developer, designer }

class BoilerPlateAppExample extends StatefulWidget {
  const BoilerPlateAppExample({super.key});

  @override
  State<BoilerPlateAppExample> createState() => _BoilerPlateAppExampleState();
}

class _BoilerPlateAppExampleState extends State<BoilerPlateAppExample> {
  bool light0 = false;
  Gender _gender = Gender.male;
  bool isChecked1 = false;
  bool isChecked2 = false;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF182949),
        title: const TextStyleApp(),
        actions: <Widget>[
          Switch(
              activeColor: const Color(0xff4b6eb1),
              thumbColor: const MaterialStatePropertyAll(Color(0xffffffff)),
              value: light0,
              onChanged: (bool value) {
                setState(() {
                  light0 = value;
                  if (value == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('switch를 ON하였습니다'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff182949),
              ),
              child: TextStyleApp(),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Color(0xFF7B7A7A)),
              title: DrawerListileApp(),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(19, 23, 24, 46),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(237, 237, 237, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff182949))),
                hintText: 'Name',
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio<Gender>(
                    activeColor: const Color(0xff4b6eb1),
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio<Gender>(
                    activeColor: const Color(0xff4b6eb1),
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Designer'),
                    leading: Checkbox(
                      activeColor: const Color(0xff4b6eb1),
                      value: isChecked1,
                      onChanged: (value) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Developer'),
                    leading: Checkbox(
                      activeColor: const Color(0xff4b6eb1),
                      value: isChecked2,
                      onChanged: (value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 72, 0, 0),
            child: Row(
              children: [
                const Expanded(flex: 2, child: Text('버튼을 눌러 날짜를 선택해주세요')),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          side:
                              BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12))),
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050),
                      );
                      if (newDate == null) return;
                      setState(() => date = newDate);
                    },
                    child: const Text('SELECT DATE',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.25,
                          height: 1.14,
                          color: Color.fromRGBO(75, 110, 177, 1),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: const ContinuousRectangleBorder(),
                      backgroundColor: const Color(0xffffffff),
                      title: const Text('+버튼을 누르셨습니다',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              letterSpacing: 0.25,
                              color: Color.fromRGBO(0, 0, 0, 0.6))),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, '확인'),
                          child: const Text(
                            '확인',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.14,
                                letterSpacing: 1.25,
                                color: Color.fromRGBO(24, 41, 73, 1)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                backgroundColor: const Color(0xff182949),
                child: const Icon(Icons.add, color: Color(0xffffffff)),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 13,
            endIndent: 14,
            color: Color.fromRGBO(33, 33, 33, 1),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(65, 13, 64, 13),
            child: Text('Copyright 2022 SODA  All rights reserved.'),
          ),
        ],
      ),

      //bottomSheet: ,
    );
  }
}

class TextStyleApp extends StatelessWidget {
  const TextStyleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'SODA',
      style: TextStyle(
        fontSize: 20,
        height: 1.2,
        color: Color(0xFFFFFFFF),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }
}

class TextStyleApp2 extends StatelessWidget {
  const TextStyleApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('This is List tile',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            fontSize: 20,
            fontFamily: String.fromEnvironment('Roboto'),
            height: 1.2));
  }
}

class DrawerListileApp extends StatelessWidget {
  const DrawerListileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Text(
        'Icon:favorite',
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.6),
          letterSpacing: 0.1,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
