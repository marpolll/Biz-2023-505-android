// List(배열)
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var nations = ["ROK", "USA", "BRI", "GERM"];
List<String> names = ["hong", "lee", "sung"];
void main(List<String> args) {
  print(nums);
  print(nations[2]);
  nums.add(100);
  nations.add("SWI");
  names.add("leam");
  print(nations[4]);

  // List(배열) 에서 특정한 값을 제거하기
  nations.remove("ROK");
  print(nations);
  // List 의 3번 index 요소를 제거하기
  nations.removeAt(3);
  print(nations);

  var result = names.first;
  print(names.first);

  result = names.last;
  print(names.last);

  var iter = names.reversed;
  print("$result, $iter");

  names.shuffle();
  print(names);
}
