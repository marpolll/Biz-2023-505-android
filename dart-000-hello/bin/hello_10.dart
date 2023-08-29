import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];

  /// 1 ~ 100 까지의 범위 난수를 만들어 20개의 배열을 생성했다.
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }

  print(nums);
  // 배열에 저장된 요소들 중에 소수를 구하여 출력

  for (var i = 0; i < nums.length; i++) {
    var index = 2;
    for (index = 2; index < nums[i]; index++) {
      if (nums[i] % index == 0) break;
    }
    // index 와 nums[i] 관계
    if (index < nums[i]) {
      print("${nums[i]} 는 소수가 아님");
    } else {
      print("${nums[i]} 는 소수 !!");
    }
  }

  List<int> pNums = primeNums(nums);

  print("배열에서 찾은 소수: $pNums");
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= number.bitLength; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

List<int> primeNums(List<int> numbers) {
  List<int> primeNumbers = [];
  for (int num in numbers) {
    if (isPrime(num)) {
      primeNumbers.add(num);
    }
  }
  return primeNumbers;
}
