import 'package:flutter/material.dart';
import 'package:todo_list/todo_model.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoModel> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32315B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF32315B),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, size: 40, color: Color(0xFFAAB1D7)),
            Text(
              "CHORES",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  color: Color(0xFFAAB1D7)),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            // height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFF292850),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                const Expanded(
                    child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Color(0xFFDCDBFF),
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Add Item',
                    hintStyle: TextStyle(
                      color: Color(0xFFDCDBFF),
                      fontSize: 24,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w300,
                      // fontFamily: 'Montserrat',
                    ),
                  ),
                )),
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(height: 20),
          const Divider(
            height: 2,
            thickness: 1,
            color: Color.fromARGB(255, 88, 88, 116),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text("TO DO",
                style: TextStyle(
                    color: const Color(0xFFAAB1D7),
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final TodoModel todo = _tasks[index];
                if (todo.completed) {
                  return Container();
                } else {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 7),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                    // height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF44446A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.check,
                          color: todo.completed ? Colors.green : Colors.white,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        todo.task,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.white),
                      ),
                      trailing: Text(
                        todo.date,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 15, bottom: 15),
            child: Text("COMPLETED",
                style: TextStyle(
                    color: const Color(0xFFAAB1D7),
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final TodoModel todo = _tasks[index];
                if (!todo.completed) {
                  return Container();
                } else {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 7),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                    // height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF44446A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.check,
                          color: todo.completed ? Colors.green : Colors.white,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        todo.task,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.white),
                      ),
                      trailing: Text(
                        todo.date,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
