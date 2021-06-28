import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var Task = "";
  var Time = "";
  List<dynamic> lst = [
    ["1", "Namaz", "03:12"],
    ["2", "Study", "04:12"],
    ["3", "Study", "05:12"],
    ["4", "Study", "06:12"],
    ["5", "Study", "07:12"],
    ["6", "Study", "08:12"],
  ];
  String MM = 'One';
  List MMLIST = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];

  bool alart = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              margin: new EdgeInsets.only(top: 7, left: 7, right: 7),
              width: MediaQuery.of(context).size.width - 10,
              height: 50,
              decoration: BoxDecoration(
                // color: Color.fromRGBO(221, 105, 105, 10),
                color: Colors.black38,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: ListTile(
                title: Row(
                  children: [
                    Text("${lst[index][0]}: "),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text("${lst[index][1]}")),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${lst[index][2]}"),
                  ],
                ),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Item"),
                                  content: Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Task Name'),
                                          onChanged: (value) {
                                            Task = value;
                                          },
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Task Time'),
                                          onChanged: (value) {
                                            Time = value;
                                          },
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // color: Color.fromARGB(240, 235, 255, 1)
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.web_asset,
                                                  color:
                                                      Colors.purpleAccent[100],
                                                ),
                                                Switch(
                                                  value: alart,
                                                  onChanged: (bool isOn) {
                                                    setState(() {
                                                      alart =! alart;
                                                    });

                                                    print(alart);
                                                  },
                                                ),
                                              ],
                                            )),
                                        // DropdownButton(
                                        //   hint: Text(
                                        //       'Please choose a location'), // Not necessary for Option 1
                                        //   value: MM,
                                        //   onChanged: (newValue) {
                                        //     setState(() {
                                        //       MM = MM;
                                        //     });
                                        //   },
                                        //   items: MMLIST.map((location) {
                                        //     return DropdownMenuItem(
                                        //       child: new Text(location),
                                        //       value: location,
                                        //     );
                                        //   }).toList(),
                                        // )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            lst.replaceRange(index, index + 1, {
                                              [lst[index][0], Task, Time]
                                            });
                                          });
                                        },
                                        child: Center(child: Text("Edit")))
                                  ],
                                );
                              });
                        },
                        child: Icon(Icons.edit),
                      ),
                      // SizedBox(width: 3,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Crete New Task"),
                    content: TextField(
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: 'Task Name'),
                      onChanged: (value) {
                        Task = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              lst.add(Task);
                            });
                          },
                          child: Center(child: Text("Add")))
                    ],
                  );
                });
          },
          child: Text(
            "+",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )),
    );
  }
}
