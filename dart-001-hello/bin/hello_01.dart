// lib 폴더에 저장된 다른 dart 파일을 import
import 'package:dart_hello/module_01.dart';

void main(List<String> args) {
  var num1 = 30;
  var num2 = 40;
  var korea = "한국";
  var nums = [2, 4, 6, 1, 6, 3, 6, 8, 7];

  print(nation(korea));
  var result = addNums(num1, num2);
  print("결과 : $result");

  result = sumNums(nums);
  print("결과 : $result");
}
