import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class ToDoModalClass {
  String title;
  String description;
  String date;

  ToDoModalClass(
      {required this.title, required this.description, required this.date});
}

class _ToDoAppState extends State<ToDoApp> {
  List<ToDoModalClass> cardList = [
    ToDoModalClass(
      title: "Arrange Meeting",
      description: "Meet the backend team",
      date: "28 Feb 2024",
    ),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void submit(bool doEdit, [ToDoModalClass? todoModelobj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doEdit) {
        setState(() {
          cardList.add(
            ToDoModalClass(
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
                date: dateController.text.trim()),
          );
        });
      } else {
        setState(() {
          todoModelobj!.title = titleController.text.trim();
          todoModelobj.description = descriptionController.text.trim();
          todoModelobj.date = dateController.text.trim();
        });
      }
    }
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void editCard(ToDoModalClass todoModelobj) {
    titleController.text = todoModelobj.title;
    descriptionController.text = todoModelobj.description;
    dateController.text = todoModelobj.date;

    showBottomSheet(true, todoModelobj);
  }

  void deleteCard(ToDoModalClass todoModelobj) {
    setState(() {
      cardList.remove(todoModelobj);
    });
  }

  void showBottomSheet(bool doEdit, [ToDoModalClass? todoModelobj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 13,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create Tasks",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Enter Title",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Enter Date",
                          suffixIcon: const Icon(Icons.date_range_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2025));
                          String formatedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          dateController.text = formatedDate;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 600,
                        margin: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(89, 57, 241, 1),
                            ),
                            onPressed: () {
                              doEdit
                                  ? submit(doEdit, todoModelobj)
                                  : submit(doEdit);
                              Navigator.of(context).pop();
                              clearController();
                            },
                            child: Text(
                              "Submit",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.only(left: 29),
              child: Text(
                "Good Morning",
                style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 29),
              child: Text(
                "Shreyash",
                style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Expanded(
              child: Container(
                // height: 618,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Color.fromRGBO(217, 217, 217, 1)),
                child: Column(
                  children: [
                    Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        child: ListView.builder(
                            itemCount: cardList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Slidable(
                                    closeOnScroll: true,
                                    endActionPane: ActionPane(
                                        extentRatio: 0.2,
                                        motion: const DrawerMotion(),
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              89, 57, 241, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    editCard(cardList[index]);
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          const Color.fromRGBO(
                                                              89, 57, 241, 1),
                                                    ),
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    deleteCard(cardList[index]);
                                                  },
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 11,
                                          left: 16,
                                          right: 16),
                                      height: 90,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(241, 240, 240, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 20,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.08)),
                                          ]),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: Image.asset("assets/1.png"),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  //  height: 13,
                                                  width: 237,

                                                  child: Text(
                                                    cardList[index].title,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color
                                                            .fromRGBO(
                                                            0, 0, 0, 1)),
                                                  ),
                                                ),
                                                Container(
                                                  //   height: 28,
                                                  width: 235,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 7, top: 7),
                                                  child: Text(
                                                    cardList[index].description,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromRGBO(
                                                            0, 0, 0, 0.7)),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    cardList[index].date,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                            .fromRGBO(
                                                            0, 0, 0, 0.7)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            activeColor: Colors.green,
                                            value: true,
                                            onChanged: (val) {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 46,
        width: 46,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
          onPressed: () {
            showBottomSheet(false);
          },
          child: const Icon(
            size: 40,
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
