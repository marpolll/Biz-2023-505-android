// 변수를 보낼때 반드시 순서를 지켜야 한다. 위치기반
String sayHello(String? name, int? age, String? nation) =>
    "hi $name ya , you age $age , home is $nation";

// 순서를 바꾸어도 상관이 없다.
String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "hi $name ya , you age $age , home is $nation";

/// <Span name="hong", age = 33, nation = "korea" />
/// const Span = ({name, age, nation}) => {return <></>}
