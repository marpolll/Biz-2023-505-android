import 'models/Student.dart';

void main(List<String> args) {
  Student str1 = Student();
  str1.stNum = 1;
  str1.stName = "hong";
  str1.stGrade = 3;
  str1.stDept = "computer";
  print(str1.toString());
}
