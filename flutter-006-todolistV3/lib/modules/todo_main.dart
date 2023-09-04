import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/service/todo_service.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  /// **Controller
  /// flutter 의 대분분의 Widget 에는 위젯Controler 라는 객체가 있다.
  /// HTML 의 id 속성에 해당하는 객체이다.
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];

  Todo getTodo(String content) {
    return Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: content,
      complete: false,
    );
  }

  /// Scaffold
  /// 처음 화면의 layout 을 꾸밀때 사용하는 Widget 이다.
  /// appBar, Body, bottomSheet 가 있는데
  /// appBar 는 화면의 머릿글에 해당하는 부분
  /// Body 는 본문(중앙) 에 해당하는 부분
  /// bottomSheet 는 화면의 footer(꼬릿글)에 해당하는 부분
  /// Body는 보통 데이터를 표현하는 부분, 여기는 Scroll 이 일어나는 부분
  /// appBar, bottomSheet 는 body 가 변화 되더라도 Scroll 이 되지 않는 부분
  /// bottomSheet 는 입력화면에서 소프트 키보드가 나타나면 키보드 위에
  ///   표현되는 부분
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "images/sun.jpg",
          fit: BoxFit.fill,
        ),
        title: const Text("나의 TodoList"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => alertDialog(context),
                );
              },
              icon: const Icon(
                Icons.add_alarm,
              ))
        ],
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  /// TextField 에 id(Controler) 를 설정하기
                  controller: inputController,
                  onChanged: (value) => setState(() {
                    todoContent = value;
                  }),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear(),
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "할일을 입력해주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  var todo = getTodo(todoContent);
                  setState(() {
                    // todoList.add(todo);
                    TodoService().insert(todo);
                    todoContent = "";
                    inputController.clear();
                  });
                },
                icon: const Icon(Icons.send_outlined),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder(
            /// future 는 실제 데이터를 가죠오는 속성
            /// 여기에서 가져오는 데이터는 builder 에게 snapshot 에 담아서 전달
            future: TodoService().selectAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return todoListView(
                  snapshot: snapshot,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: "데이터 없음",
                  ),
                );
              }
            },
          )),
    );
  }

  /// ListView return type 를 Widget 으로 변경하기
  /// 모든 Widget 은 가장 상위 클래스인 Widget 을
  /// 상속 받고 있기 때문에 모든 Widget의 return 은
  /// Widget 으로 설정하여도 된다.
  Widget todoListView({required AsyncSnapshot<List<Todo>> snapshot}) {
    /// snapshot 으로부터 실제 todoList 를 뽑아서 todoList 에 담기
    var todoList = snapshot.data!;
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {},
          splashColor: const Color.fromARGB(255, 180, 20, 30).withOpacity(0.5),
          title: Dismissible(
            /// Key(todoList[index].content),
            /// 만약 todoList 데이터가 없는 경우
            /// null exception 이 발생할수 있기 떄문에
            /// key 의 값이 null 이 된다. flutter 에서 제공하는
            /// UUID 인 UniqueKey()를 사용한다.
            key: UniqueKey(),

            /// 왼쪽에서 오른쪽으로 Swipe 를 했을때 나타나는 Widget
            background: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.save,
                size: 36,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                size: 36,
                color: Colors.white,
              ),
            ),

            /// 사라지기 전의 event
            /// event 핸들러에서 Future.value(true) 를 return 하면
            /// swipe 행위가 진행되고, false 를 return 하면 진행을 멈춘다.
            confirmDismiss: (direction) => onConfirmHandler(direction, index),

            /// confirmDismiss 에서 ture 가 return 되었을때 할일
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  todoList[index].complete = !todoList[index].complete;
                });
              } else if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${todoList[index].content} 를 삭제 하였습니다."),
                ));

                TodoService().delete(todoList[index].id ?? 0);
                setState(() {
                  // todoList.removeAt(index);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todoList[index].sdate),
                      Text(todoList[index].stime),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            todoList[index].content,
                            style: todoList[index].complete
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 20,
                                    color: Color(0xFFBEC7CE))
                                : const TextStyle(
                                    fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> onConfirmHandler(direction, index) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(index);
    } else if (direction == DismissDirection.endToStart) {
      return deleteConfirm();
    }
    // Future : 화면에 state 에 의해서 변화를 감지하는 객체
    return Future.value(false);
  }

  Future<bool?> deleteConfirm() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("삭제할까요??"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("네"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니요"),
          )
        ],
      ),
    );
  }

  Future<bool?> completeConfirm(index) {
    var yesNo = todoList[index].complete ? "완료처리를 취소 할까요?? " : "완료처리를 할까요??";
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(yesNo),
        actions: [
          ElevatedButton(
            onPressed: () {
              /// Nacigator.pop(ture) : showDialog 가 return 하는 값
              Navigator.of(context).pop(true);
            },
            child: const Text("네"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니요"),
          )
        ],
      ),
    );
  }

  Widget alertDialog(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        actions: [
          const TextField(),
          TextField(
            // keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value 가 추가되었음"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해 주세요",
            ),
          )
        ],
      );
}
