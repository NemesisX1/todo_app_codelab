import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_task.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [
    Todo(
      title: "Upload 1099-R to TurboTax",
      subtitle: "💰 Finance",
      isTaped: true,
    ),
    Todo(
      title: "Submit 2019 tax return",
      subtitle: "💰 Finance",
      isTaped: false,
    ),
    Todo(
      title: 'Print parking passes',
      subtitle: '💞 Wedding',
      isTaped: false,
    ),
    Todo(
      title: 'Sign contract, send back',
      subtitle: '🖥️ Freelance',
      isTaped: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 15,
          right: 15,
        ),
        child: ListView(
          children: [
            const Text(
              "March 9, 2020",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Gap(10),
            const Text(
              "5 incomplete, 5 completed",
              style: TextStyle(
                color: Color(0xff575767),
                fontSize: 14,
              ),
            ),
            const Gap(10),
            const Divider(
              color: Color(
                0xffD0D0D0,
              ),
              thickness: 2,
            ),
            const Gap(10),
            const Text(
              "Incomplete",
              style: TextStyle(
                color: Color(0xff575767),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Gap(10),
            ...List<Widget>.generate(
              todos.length,
              (index) {
                if (todos[index].isTaped) {
                  return const SizedBox();
                } else {
                  return TodoTask(
                    title: todos[index].title,
                    subtitle: todos[index].subtitle,
                    isTapedOnStart: todos[index].isTaped,
                    isTapedCallack: (isTaped) {
                      if (isTaped) {
                        setState(() {
                          todos[index].isTaped = true;
                        });
                      }
                    },
                  );
                }
              },
            ),
            const Gap(30),
            const Text(
              'Completed',
              style: TextStyle(
                color: Color(0xff575767),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Gap(10),
            ...List<Widget>.generate(
              todos.length,
              (index) {
                if (!todos[index].isTaped) {
                  return const SizedBox();
                } else {
                  return TodoTask(
                    title: todos[index].title,
                    subtitle: todos[index].subtitle,
                    isTapedOnStart: todos[index].isTaped,
                    isTapedCallack: (isTaped) {
                      log(isTaped.toString());
                      if (isTaped) {
                        setState(() {
                          todos[index].isTaped = false;
                        });
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          setState(() {
            todos.add(Todo(
              title: "Submit 2019 tax return",
              subtitle: "💰 Finance",
              isTaped: false,
            ));
          });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
