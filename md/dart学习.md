# Dart

## 变量

定义变量的方式：

- var
- const：不可变的常量
- final：只可赋值一次

## 类与对象

属性与方法：

- 属性默认会生成 getter 和 setter 方法
- 使用 final 声明的属性只有 getter 方法
- 属性和方法通过 `.` 来访问
- 方法不能被重载

类及成员可见性：

- Dart 中的可见性以 libaray（库） 为单位
- 默认情况下，每个 Dart 文件就是一个库
- 使用 `_` 表示库的私有性
- 使用 `import` 导入库

计算属性：

- 计算属性的值是通过计算而来，本身并不存储值
- 计算属性赋值，其实是通过计算转换到其它实例变量

```dart
class Rectangle {
  num width = 1, height = 1;
  // 计算属性
  num get area => width * height;
}
```

构造方法：

- 如果没有自定义构造方法，则会有个默认的构造方法
- 如果存在自定义构造方法，则默认构造方法无效
- 构造方法不能重载

```dart
class Person {
  String? name;
  int? age;
  final String gender = '男';

  Person(this.name, this.age);
}
```

命名构造方法：

- 使用命名构造方法，可以实现多个构造方法
- 使用 `类名.方法` 的形式实现

```dart
class Person {
  String? name;
  int? age;
  final String gender = '男';

  Person(this.name, this.age);

  Person.withName(this.name);

  Person.withAge(this.age);
}
```

常量构造方法：

- 如果类是不可变状态，可以把对象定义为编译时常量
- 使用 `const` 声明构造方法，并且所有变量都为 `final`
- 使用 `const` 声明对象，可以省略

```dart
class Person {
  final String name;
  final int age;
  final String gender;

  const Person(this.name, this.age, this.gender);
}
```

工厂构造方法：

- 工厂构造方法类似于设计模式中的工厂模式
- 在构造方法前添加关键字 `factory` 实现一个工厂构造方法
- 在工厂构造方法中可返回对象

初始化列表：

- 初始化列表会在构造方法体执行之前执行
- 使用逗号分隔初始化表达式
- 初始化列表常用于设置 `final` 变量的值

```dart
class Person {
  String? name;
  final int age;
  final String gender;

  Person.withMap(Map map)
      : age = map['age'],
        gender = map['gender'] {
    name = map['name'];
  }
}
```

静态成员：

- 使用 `static` 关键字来实现类级别的变量和函数
- 静态成员不能访问非静态成员，非静态成员可以访问静态成员
- 类中的常量需要使用 `static const` 声明

```dart
class Page {
  static const int maxPage = 10;

  static int currentPage = 1;

  // 下滑
  void scrollDown() {
    if (currentPage < maxPage) {
      currentPage++;
    } else {
      currentPage = 1;
    }
  }

  // 上滑
  void scrollUp() {
    if (currentPage > 1) {
      currentPage--;
    } else {
      currentPage = 1;
    }
  }
}
```

对象操作符：

- 条件成员访问：`?.`
- 类型转换：`as`
- 是否是指定类型：`is`，`is!`
- 级联操作符：`..`

```dart
void main() {
  var person = Person();
  person
    ..name = 'zhangsan'
    ..age = 18
    ..gender = '男';
  print('Name: ${person.name}, Age: ${person.age}, Gender: ${person.gender}');
}

class Person {
  String? name;
  int? age;
  String? gender;
}
```

继承：

- 使用关键字 `extends` 继承一个类
- 子类会继承父类的可见属性和方法，不会继承构造方法
- 子类能够复写父类的方法、getter 和 setter
- 单继承、多态性

```dart
class Person {
  String? name;
  int? age;
  String? gender;

  bool get isAdult => age! > 18;

  void run() {
    print('Person run...');
  }
}

class Student extends Person {
  void study() {
    print('Student study...');
  }

  @override
  bool get isAdult => age! > 20;

  @override // 标记复写
  void run() {
    // 执行父类的 run 方法
    super.run();
    // 执行改写后的逻辑
    print('Student run...');
  }
}
```

继承中的构造方法：

- 子类的构造方法默认会调用父类的无名无参构造方法
- 如果父类没有无名无参构造方法，则需要显示调用父类构造方法
- 在构造方法参数后使用 :显示调用父类构造方法

```dart
void main() {
  var student = Student('张三');
  print(student.name);
}

class Person {
  String? name;
  int? age;

  // 无名构造函数
  // Person() {
  //   print('Person');
  // }

  // 无名有参构造函数
  Person(this.name);

  // 有名有参构造函数
  Person.withName(this.name);
}

class Student extends Person {
  // 显示调用父类构造方法
  // Student(String name) : super(name);
  Student(String name) : super.withName(name);
}
```

构造方法执行顺序：

- 父类的构造方法在子类构造方法体开始执行的位置调用
- 如果有初始化列表，初始化列表会在父类构造方法之前执行

```dart
class Person {
  String? name;
  int? age;

  // 无名构造函数
  // Person() {
  //   print('Person');
  // }

  // 无名有参构造函数
  Person(this.name);

  // 有名有参构造函数
  Person.withName(this.name);
}

class Student extends Person {
  final String gender;

  // 显示调用父类构造方法
  // Student(String name) : super(name);
  Student(String name, String g)
      : gender = g,
        super.withName(name);
}
```

抽象类：

- 抽象类使用 `abstract` 关键字表示，不能被实例化
- 抽象方法不用 `abstract` 关键字修饰，无实现
- 抽象类可以没有抽象方法
- 有抽象方法的类一定得声明为抽象类

```dart
abstract class Person {
  void run();
}

class Student extends Person {
  @override
  void run() {
    print('Student run');
  }
}
```

接口：

- 类和接口是统一的，类就是接口
- 每个类都隐式的定义了一个包含所有实例成员的接口
- 如果是复用已有类的实现，使用继承 `extends`
- 如果只是使用已有类的外在行为，使用接口 `implements`

```dart
abstract class Person {
  void run();
}

class Student implements Person {
  @override
  void run() {
    print('Student run');
  }
}
```

Mixins：

- Mixins 类似于多继承，是在多继承中重用一个类代码的方式
- 作为 Mixin 的类不能有显示声明的构造方法

```dart
class A {
  void a() {
    print('A.a ...');
  }
}

mixin class B {
  void a() {
    print('B.a ...');
  }

  void b() {
    print('B.b ...');
  }
}

mixin class C {
  void a() {
    print('C.a ...');
  }

  void b() {
    print('C.b ...');
  }

  void c() {
    print('C.c ...');
  }
}

class D extends A with B, C {}
```
