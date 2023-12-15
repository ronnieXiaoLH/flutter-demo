# Flutter

## 什么是 Flutter

- 由 Google 研发
- 一款应用程序 SDK
- 一份代码可以同时生成 Android、iOS、Windows、Mac、Linux、Web、嵌入式等多个高性能、高保真的应用程序

## 为什么要用 Flutter

- 极大提升开发效率
- 美观、高度定制且统一的用户体验
- 性能接近 Native

Flutter 不是通过在 Android 和 iOS 的 UI 底层库上创建一层抽象，从而来抹平各个系统之间的差异。Flutter 使用自己的 widget 内容集，削减了抽象层的开销，用于绘制 Flutter 图像内容的 Dart 代码被编译为机器码，并使用 Skia 进行渲染。

## 怎么使用 Flutter

- 原生 App + Flutter plugin
- Flutter App
- Flutter App + 原生接口

## Flutter 核心原则

- Everyting is widget
- StatelessWidget
- StatefulWidget

## Flutter 为什么选择 Dart

Dart 是在 2011.10 发布的，Dart v1.0 在 2013.11 发布的。Flutter 的诞生是在 2014.10，v.10 发布是在 2018.12。Flutter 是在 Dart 之后出现的，Flutter 为什么会选择 Dart 呢？

- 2011 年发布，目的是取代 JavaScript（显然没有做到）
- 符合 Flutter 构建 UI 的方式。第一个使用声明式 UI
- 支持 JIT（Just In Time）和 AOT（Ahead Of Time）
- 有内存安全保障，降低了安全漏洞风险

JIT 模式：在运行时，Dart 代码被转换为本地机器代码。所以允许开发者在应用程序运行时修改代码，支持热重载（Hot Reload），使用于开发阶段。`flutter run` 命令使用 JIT 编译。

AOT 模式：在构建应用程序时，Dart 代码被提前编译成本地机器代码。由于提前编译，因此具有更好的启动性能，适用于发布阶段。`flutter build` 命令使用 AOT 编译。

## Dart 的特点

- 面向对象的编程语言（类似 Java/OC）
- 强类型语言
- 线程模型
- async 和 await 异步编程

## Dart 线程模型

Dart 的线程模型与 JS 任务队列很相似，JS 有宏任务的概念，在 Dart 中是事件队列。

![Dart线程模型](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\Dart线程模型.png)

## Dart 线程管理

Dart 是一种支持并发的编程语言，它使用隔离（Isolate）来实现并发性。每个隔离都有自己的内存堆，独立于其他隔离，并在其上运行 Dart 代码。每个 Dart 程序至少有一个隔离，这个隔离被称为 `root isolate`。

每个隔离都有自己的事件循环和消息队列，它们可以通过消息传递进行通信。这种模型使得 Dart 能够更好地利用多核处理器，提高程序的性能。

![Dart线程管理](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\Dart线程管理.png)

## Dart 异步编程

- async-await 代码块是对 Future API 的简化方式，将异步回调代码写成同步代码
- async 关键字修饰的函数返回一个 Future 对象，故 async 不会阻塞当前线程
- await 关键字会同步执行，阻塞当前线程

## Flutter 布局

- 文本：Text widget
- 文本样式：Text widget 的 style （TextStyle 对象）
- 文本摘要：Text widget 的 overflow 属性
- 内联文本：RichText widget
- 背景颜色：color（简单颜色） 或者 Container widget 的 decortaion (BoxDecoration 的 color 属性)
- 居中：Center widget
- 绝对定位：Positioned widget 且需放在 Stack widget 中
- 旋转、缩放：Transform widget
- 渐变：Container widget 的 decortaion (BoxDecoration 的 gradient 属性)
- 圆角：Container widget 的 decortaion (BoxDecoration 的 borderRadius 属性)
- 阴影：Container widget 的 decortaion (BoxDecoration 的 boxShadow 属性)
- 圆、椭圆：Container widget 的 decortaion (BoxDecoration 的 shape 属性)

## 用户界面

Flutter 是使用小部件（Widget）来构建 UI 的。Widget 通过声明当前的配置和状态来描述其对应的视图是什么样子，当 Widget 的状态发生变化时，Widget 会重建其描述，框架会与之前的描述对比，以确定底层渲染树从之前状态到现在状态的最小变更。

根据官方文档的描述可以看出，Flutter 构建用户界面有两个核心，其一是使用声明式 UI 描述 widget 的样子，其二是通过 diff 算法对比，做到最小更新。

声明式 UI 的优点：

- 更适合做设备适配
- UI 布局和控制逻辑通过 reactive 方式实现数据绑定
- 更好实现 UI 局部刷新机制，只刷新更新的部分

### Widget

Flutter 中所有的东西都是 Widget，应用程序中的文本、图标、图像，甚至布局都是 Widget。Widget 是构建 Flutter 应用界面的基础块，可以理解成是 UI 的最小单元，它有多种种类，比如：Text、Row、Column、Stack、Container。

下面的示例代码就是使用 Text widget 创建一个 `Hello, world!` 的文本

```dart
void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hello, world!'),
    );
  }
}
```

模拟器运行效果如下图：

![hello world](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\text-hello world.png)

#### StatelessWidget & StatefulWidget

按照前端的开发思维，一个大的视图是由小的 UI 单元组成的。在 Flutter 中一个大的视图（新的 Widget）就是由多个 Widget 组成的，并且它分为两类，有状态（`StatelessWidget`）和无状态（`StatefulWidget`），只能是且必须是其中之一。

按照前端的开发思维，其实就是有状态的组件和无状态的组件。

上面 Hello, world! 文本的示例就是一个无状态的 Widget，下面是一个有状态的 Widget。

```dart
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}
```

模拟器运行效果如下图：

![StatefulWidget](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\StatefulWidget.png)

更新视图需要通过 setState 方法触发重新布局，widget 会遍历需要更新的 Element，依次调用 rebuild。

### Material Components & Cupertino Components

在 Vue、React 等前端框架中，都会有封装好的 UI 组件库，在 Flutter 中，也有这种概念。Flutter 在 `material` 包中提供了很多 Widget 帮助构建遵循 Material Design 的应用程序，`Cupertino` 包中提供了很多 Widget 帮助构建遵循 iOS Design 的应用程序。

[Material Components](https://flutter.cn/docs/ui/widgets/material) 提供了很多好看实用的 Widget。

### 生命周期

初始化阶段：

- main() 函数： 应用程序的入口点，它负责运行应用程序。
- runApp() 函数： 负责将根 Widget 添加到 widget 树中，启动应用程序。

运行阶段：

- createState：创建 state，当 StatefulWidget 被调用时会立即执行。
- initState：Stete 初始化方法，需调用 super 重写父类方法。
- build： 在初始化后或当 State 对象依赖的数据发生变化时调用，用于构建 UI。
- didChangeDependencies： 当 State 对象依赖的 InheritedWidget 发生变化时调用。
- didUpdateWidget： 当一个 StatefulWidget 被重新构建时调用，可以用于比较旧的和新的 widget 是否有差异。
- setState： 用于通知框架状态已经改变，需要重新构建 UI。

销毁阶段：

- deactive：在 Widget 被移除节点后会调用，如果该 Widget 被移除节点，然后未被插入到其他节点时，会继续调用 dispose 永久移除。
- dispose()： 当 State 对象被永久删除时调用，通常在这里执行一些清理工作，例如关闭网络连接、取消订阅等。

### 布局

正如前面所述，Flutter 中一切都是 Widget，布局也是 Widget。

布局 Widget 分为三个大类：

- 单个布局
- 多个布局
- 通用布局

#### 单个布局 widget

创建和显示单个布局分为以下 4 个步骤：

1. 选择一个布局 Widget
2. 创建一个可见 widget
3. 将可见 widget 添加到布局 widget
4. 将布局 widget 添加到页面

```dart
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

#### 横向或纵向布局多个 widgets

最常见的布局模式之一是垂直或水平 widgets。你可以使用 Row widget 水平排列 widgets，使用 Column widget 垂直排列 widgets。

**横向布局多个 widgets**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: buildRow()),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      );
  // #enddocregion Row
}
```

模拟器运行效果如下图：

![横向多个布局](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\横向多个布局.png)

**纵向多个布局**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: buildColumn()),
      ),
    );
  }

  Widget buildColumn() =>
      // #docregion Column
      const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      );
  // #enddocregion Column
}
```

模拟器运行效果如下：

![纵向多个布局](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\纵向多个布局.png)

你可以使用 mainAxisAlignment 和 crossAxisAlignment 属性控制行或列如何对齐其子项，MainAxisAlignment 和 CrossAxisAlignment 这两个枚举提供了很多用于控制对齐的常量。

#### 通用布局

Flutter 有一个丰富的布局 widget 仓库，里面有很多经常会用到的布局 widget。

下面的 widget 会分为两类：widgets 库 中的标准 widgets 和 Material 库 中的 widgets。任何 app 都可以使用 widget 库，但是 Material 库中的组件只能在 Material app 中使用。

**标准 widgets**

- Container：向 widget 增加 padding、margins、borders、background color 或者其他的“装饰”。
- GridView：将 widget 展示为一个可滚动的网格。
- ListView：将 widget 展示为一个可滚动的列表。
- Stack：将 widget 覆盖在另一个的上面。

**Material widgets**

- Card：将相关信息整理到一个有圆角和阴影的盒子中。
- ListTile：将最多三行的文本、可选的导语以及后面的图标组织在一行中。

### 设计 & 主题

你可以定义应用全局的主题。你也可以为某一个组件单独继承一个特定的主题。每个主题都可以各自定义颜色、文字样式和其他 Material 配置参数。

Flutter 会按以下顺序应用样式：

1. 针对特定 widget 的样式。

2. 重载的继承主题的样式。

3. 应用的总体样式。

#### 创建应用主题

全局 Theme 会影响整个 app 的颜色和字体样式。只需要向 MaterialApp 构造器传入 ThemeData 即可。

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
    );
  }
}
```

大部分 ThemeData 实例会设置以下两个属性。它们会影响大部分样式属性。

1. colorScheme 定义了颜色。
2. textTheme 定义了文字样式。

#### 应用主题

要想应用你的主题，使用 Theme.of(context) 方法来指定 widget 的样式属性。

Theme.of(context) 会查询 widget 树，并返回其中最近的 Theme。所以他会优先返回我们之前定义过的一个独立的 Theme，如果找不到，它会返回全局主题。

```dart
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
  ),
  color: Theme.of(context).colorScheme.primary,
  child: Text(
    'Text with a background color',
    // ···
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
  ),
),
```

模拟器运行效果如下图：

![主题](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\主题1.png)

#### 重载主题

有两种重载主题的方式：

- 创建一个新的 ThemeData，把它传给 Theme widget
- 从上层 Theme 扩展，使用 copyWith 方法即可

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(child: CustomTheme()),
      ),
    );
  }
}

class CustomTheme extends StatelessWidget {
  const CustomTheme({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      // 创建一个新的 ThemeData 实例
      data: ThemeData(
        // 从上层 Theme 上扩展
        // data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      child: const MyContaier(),
    );
  }
}

class MyContaier extends StatelessWidget {
  const MyContaier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        'Text with a background color',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
```

模拟器运行效果如下图：

![主题重载](D:\my-code\mobile-terminal-projet\flutter-project\flutter_demo_from_vscode\md\img\主题重载.png)

### 交互

#### 有状态和无状态的 widget

无状态的 widget 自身无法改变。Text、Icon 和 IconButton 等都是无状态 widget，它们都是 StatelessWidget 的子类。

有状态的 widget 自身是可动态改变的（基于 State）。 Checkbox、Radio、Slider 等都是有状态 widget，它们都是 StatefulWidget 的子类。

一个 widget 的状态保存在一个 State 对象中，它和 widget 的显示分离。 Widget 的状态是一些可以更改的值，如一个滑动条的当前值或一个复选框是否被选中。当 widget 状态改变时，State 对象调用 setState()，告诉框架去重绘 widget。

#### 状态管理

谁管理 stateful widget 的状态？以下是一些最常见的方法：

- widget 管理自己的状态
- 父 widget 管理子 widget 的状态
- 混搭管理：一部分状态由自己管理，一部分状态由父 widget 管理

如何决定使用哪种管理方法？下面的原则帮助你决定：

- 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父 widget 管理。
- 如果所讨论的状态是有关界面外观效果的，例如动画，那么状态最好由 widget 本身来管理。
- 如果有疑问，首选在父 widget 中管理。

#### 手势

Gesture 代表的是语义操作（比如点击、拖动、缩放）。Gesture 可以分发多种事件，对应着手势的生命周期（比如开始拖动、拖动更新、结束拖动）。

如果使用 Material 风格的组件，其中的许多组件都能够支持响应点击或者手势事件（组件内部已封装好了）。比如 IconButton 和 TextButton 响应了按压事件（点击事件）onPressed， ListView 响应了滚动事件。

对于普通的组件，从组件层监听手势，需要用到 GestureDetector。

下面是一个使用 GestureDetector 监听按钮点击操作的示例：

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Gesture Demo';

    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}
```

拖动界面元素：

- LongPressDraggable widget 提供了可是拖放交互所需的确切行为。
- DragTarget widget 可以接受或拒绝来自可拖动对象的数据（在 onAccept 钩子处理逻辑）

滑动清除：Dismissible widget（在 onDismissed 钩子处理逻辑）

#### 表单

##### 输入框

- TextField widget：普通输入框
- TextFormField：TextField 被集成在表单组件 Form 中的表单输入框，可进行输入验证或与其他表达组件交互联动

读取内容：创建 TextEditingController 并与 TextField（TextFormField）的 controller 属性绑定，即可在创建的 TextEditingController 实例的 text 属性上读取输入框的内容

监听内容的变化：

1. TextField 的 onChanged 钩子
2. TextEditingController 实例的 addListener() 方法

聚焦：

1. 给 TextField 的 autofocus 属性设置为 true
2. 创建 FocusNode 并与 TextField 的 focusNode 属性绑定，调用 FocusNode 实例的 requestFocus 方法

校验（步骤）：

1. 给表单 Form 的 key 属性设置 GlobalKey 作为唯一标识（\_formKey）
2. TextFormField 作为 Form 的 child，并给 TextFormField 添加 validator 方法
3. 调用 \_formKey 的 currentState 的 validate 方法（\_formKey.currentState 返回表单的状态）

### 资源

Flutter 要求引用项目本地的资源必须先声明：

- 在 pubspec.yaml 文件的 flutter 字段里面的 assets 字段中声明
- 声明单个文件：imgs/my_icon.png
- 声明整个文件夹：imgs/（目录结尾必须带/）

```yaml
flutter:
  assets:
    - imgs/my_icon.png
    - imgs/
```

引用资源：通过 AssetBundle 对象读取文本和图片

- 文本：rootBundle 对象的 loadString 方法
- 本地图片：build() 方法中使用 AssetImage 加载图片，如果是依赖包中的图片，需要在 AssetImage 指定 package
- 网络图片：使用 Image.network() 构造函数来处理来自 URL 的图片

```dart
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

return const AssetImage('icons/heart.png', package: 'my_icons');

Image.network(
    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif');
```

### 导航 & 路由

命名路由：

```dart
@override
  Widget build(BuildContext context) {
  return MaterialApp(
    routes: {
      '/': (context) => HomeScreen(),
      '/details': (context) => DetailScreen(),
    },
  );
}
```

路由器：

```dart
import 'package:go_router/go_router.dart';
MaterialApp.router(
  routerConfig: GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MyLogin(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      ),
    ],
  )
);
```

添加 Tab 到应用中：

1. 使用 DefaultTabController widget 创建 TabController，它可以使所选的 tab 与所对应的内容同步变化。
2. 使用 TabBar widget 创建 tabs，并将创建好的 tabs 放置在 AppBar widget 中。
3. 使用 TabBarView widget 为每个 tab 创建选中是展示的内容。

```dart
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
```

路由跳转：

- 前进：Navigator.push 方法跳转至新的路由，push 方法会添加一个 Route 对象到导航器堆栈上，这个 Route 对象在 Material Design 风格中使用 MaterialPageRoute 类实现，在 iOS Design 风格中使用 CuperinoPageRoute 类实现
- 后退：Navigator.pop 方法实现路由回退。

给新路由传参：

1. 直接通过 MaterialPageRoute 给要跳转的新路由渲染视图的 widget 传参
2. 通过 RouteSettings 给 MaterialPageRoute 绑定参数，在新路由渲染视图的 widget 中获取参数（ModalRoute.of(context)!.settings）

```dart
// 直接传参
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(todo: todos[index]),
  ),
);

// 使用 RouteSettings 传参
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const DetailScreen(),
    settings: RouteSettings(
      arguments: todos[index],
    ),
  ),
);

@override
Widget build(BuildContext context) {
  final todo = ModalRoute.of(context)!.settings.arguments as Todo;
}
```

从新路由传参回来：

首先，Navigator.push 方法接受参数，Navigator.pop 方法传递参数

```dart
// 新路由页面传递参数
onPressed: () {
  Navigator.pop(context, 'Yep!');
},

// 接收新路由页面传回的数据
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SelectionScreen()),
);
```

抽屉：

在 Material Design 准则里，主要提供了两种导航方式：Tab 和 Drawer。当没有足够的空间来支持 tab 导航时，drawer 提供了另一个遍历的选择。

**当用户打开 drawer 的时候，Flutter 会将 drawer widget 覆盖在当前的导航堆栈上，要关闭 drawer 需要通过 Navigator.pop 方法来实现。（这点与 web 开发中通过显隐来控制不同）**

## 用户界面之外

### 状态管理

短暂状态 & 持久状态

一句话概括就是单个 widget 中状态，和多个 widget 都会用到的状态，类似于单个组件中的状态和全局状态。

持久状态：

flutter 可以使用 provider package 来管理持久状态。这里有四个核心的组成：

- ChangeNotifierProvider

  ChangeNotifierProvider widget 可以向其子孙节点暴露一个 ChangeNotifier 实例。ChangeNotifierProvider 应该放在需要访问它的 widget 之上。

  ```dart
  void main() {
    runApp(
      ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MyApp(),
      ),
    );
  }
  ```

- ChangeNotifier

  ChangeNotifier 是 Flutter SDK 中的一个简单的类。它用于向监听器发送通知。上面的示例代码中，ChangeNotifierProvider widget 向 CartModel widget 暴露了一个 ChangeNotifier 实例，CartModel widget 定义为 ChangeNotifier 便可以订阅它的状态。当模型发生改变并且需要更新 UI 的时候可以调用 notifyListeners 方法。

  ```dart
  class CartModel extends ChangeNotifier {
    /// Internal, private state of the cart.
    final List<Item> _items = [];

    /// An unmodifiable view of the items in the cart.
    UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

    /// The current total price of all items (assuming all items cost $42).
    int get totalPrice => _items.length * 42;

    /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
    /// cart from the outside.
    void add(Item item) {
      _items.add(item);
      // This call tells the widgets that are listening to this model to rebuild.
      notifyListeners();
    }

    /// Removes all items from the cart.
    void removeAll() {
      _items.clear();
      // This call tells the widgets that are listening to this model to rebuild.
      notifyListeners();
    }
  }
  ```

- Consumer

  上面的示例代码中，CartModel 已经通过 ChangeNotifierProvider 在应用中与 widget 相关联，现在可以使用 Consumer widget 调用它。

  ```dart
  return Consumer<CartModel>(
    builder: (context, cart, child) {
      return Text('Total price: ${cart.totalPrice}');
    },
  );
  ```

  Consumer widget 唯一必须的参数就是 builder。当 ChangeNotifier 发生变化的时候会调用 builder 这个函数。（换言之，当你在模型中调用 notifyListeners() 时，所有相关的 Consumer widget 的 builder 方法都会被调用。）

- Provider.of

  有的时候你不需要模型中的 数据 来改变 UI，但是你可能还是需要访问该数据，我们可以使用 Consumer<CartModel> 来实现这个效果，不过这么实现有点浪费。因为我们让整体框架重构了一个无需重构的 widget。这里我们可以使用 Provider.of，并且将 listen 设置为 false。

  ```dart
  Provider.of<CartModel>(context, listen: false).removeAll();
  ```

  在 build 方法中使用上面的代码，当 notifyListeners 被调用的时候，并不会使 widget 被重构。

### Package 和插件

在前端开发中，我们使用 npm 来管理包。在 flutter 中使用 pub 来管理包。flutter 应用中的 pubspec.yaml 文件类似于前段项目中的 package.json 文件。

**Package 和插件的区别：** 插件 (plugin) 是 package 的一种，全称是 plugin package，我们简称为 plugin，中文叫插件。Dart package 最低要求是包含一个 pubspec.yaml 文件。此外，一个 package 可以包含依赖关系 (在 pubspec.yaml 文件里声明)、 Dart 库、应用、资源、字体、测试、图片和例子等。插件 (plugin package) 是一种特别的 package，特别指那些帮助你获得原生平台特性的 package。

使用 package：

添加依赖

直接通过命令 `flutter pub add xxx` 添加，添加成功后，会在 pubspec.yaml 文件的 dependencies 字段中看到。也可以先在 pubspec.yaml 文件的 dependencies 字段中先添加 xxx 依赖包以及的版本信息，然后通过 `flutter pub get` 命令添加依赖包

移除依赖

直接通过 `flutter pub add xxx`

如果使用自己本地正在开发的依赖包，在 npm 中是使用 npm link 创建软链接的方式，在 flutter 中，可以直接在 pubspec.yaml 文件的 dependecies 字段中，直接声明你本地依赖包的名字和依赖包的相对路径或绝对路径。

```yaml
# pubspec.yaml
dependencies:
  packageA:
    path: ../packageA/
```

### 序列化

术语：编码和序列化数据是一回事——将数据结构转换为字符串。解码和反序列化数据则是相反的过程——将字符串转换为数据结构。然而，序列化数据通常也指代将数据结构转换为更加易读的数据格式的整个过程。

#### 手动序列化

内联序列化 JSON 数据：

使用 Flutter 内置的 `dart:convert` 库，这个库包含了一个简单的 JSON 编码器和解码器。jsonDecode 方法可以将原始字符串转化为 `Map<String, dynamic>` 数据结构（类似于 JS 中的对象），但是这种数据结构意味着在运行时之前，不知道值的类型，导致失去了大部分的静态类型语言特性：类型安全、自动补全以及最重要的编译时异常。

```dart
import 'dart:convert';

String jsonString = '{"name":"John Smith","email":"john@example.com"}';
final user = jsonDecode(jsonString) as Map<String, dynamic>;

print('Howdy, ${user['name']}!');
print('We sent the verification link to ${user['email']}.');
```

在模型类中序列化 JSON 数据：

通过引入模型类来解决上面提到的问题。在 User 类中：

- 一个 User.fromJson() 构造函数，用于从映射中构造一个新的 User 实例。
- 一个 toJson() 方法，这个方法会将 User 实例转换为一个映射。

```dart
import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

String jsonString = '{"name":"John Smith","email":"john@example.com"}';
final userMap = jsonDecode(jsonString) as Map<String, dynamic>;
final user = jsonDecode(jsonString) as Map<String, dynamic>;

print('Howdy, ${user['name']}!');
print('We sent the verification link to ${user['email']}.');
```

#### 自动序列化

自动序列化就是指使用 pub.dev 上面的库来实现。官方文档推荐的两个社区的库：`json_serializable` 和 `built_value`

#### 在后台处理 JSON 解析

为了避免解析巨大的 JSON 文档耗时超过 16ms，让用户感受到掉帧，在 Flutter 中，可以使用单独的 Isolate（隔离）去处理。

Flutter 中提供 compute 方法将解析和转换的工作移交到一个后台的 isolate 中，compute() 函数可以在后台 isolate 中运行复杂的函数并返回结果。

isolates 可以来回传递消息的类型可以是 null、num、bool、double、String、List 等，更复杂的对象，比如 Future 或者 http.Response 是无法传递的，需要使用其他解决方案 `work_manager` 或 `workmanager` package。

### 网络 & http

http package 提供了 http 请求最简单易用的方法。该 package 支持 Android、iOS、macOS、Windows、Linux 以及 Web。

使用 http 提供的方法拿到的接口响应的数据需要进行序列化处理。

添加 Authorization Headers：

http package 提供了相当实用的方法来向请求中添加 headers，你也可以使用 dart:io 来使用一些常见的 HttpHeaders。

```dart
final response = await http.get(
  Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  // Send authorization headers to the backend.
  headers: {
    HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
  },
);
```

发送数据到服务器：

需要使用 flutter 内置的 `dart:covert` 库对需要传递的参数进行反序列化。

```dart
Future<http.Response> createAlbum(String title) {
  return http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
}
```

除了 http package 之外，社区中还有一个更好用的库 `dio`。

- Restful API
- 拦截器
- Cookie 管理
- 文件上传/下载
- ...

WebSocket 通信：

`web_socket_channel` 这个 package 提供了连接 WebSocket 服务器所需的一些工具，该包提供的 WebSocketChannel 不仅可以监听来自服务器的消息，还可以向服务器推送消息。

### 持久化

存储键值对数据：

如果需要存储的键值集合较少，可以使用 `shared_preferences` 插件，它将 key-value 保存到磁盘中。

```dart
import 'package:shared_preferences/shared_preferences.dart';

final prefs = await SharedPreferences.getInstance();
// 保存数据
await prefs.setInt('counter', counter);
// 读取数据
final counter = prefs.getInt('counter') ?? 0;
// 移除数据
await prefs.remove('counter');
```

文件读写：

首先需要使用 `path_provider` package，它提供一种与平台无关、一致的方式访问设备的文件位置系统。它支持访问两种文件位置系统：

- 临时文件夹

  系统随时可以清空的临时（缓存）文件夹。

- Documents 目录

  供应用使用，用于存储只能由该应用访问的文件夹。只有在删除应用时，系统才会清楚这个目录。

用 SQLite 做数据持久化：

SQLite 适合需要持久化且查询大量本地设备数据的 app，数据库能够提供更为迅速的插入、更新、查询功能。

## Flutter 工程模式

混合开发模式：Flutter 可以很好地支持以独立页面、甚至可以通过 UI 片段的方式集成到现有的应用中。

- 统一管理模式：将原生工程作为 Flutter 工程的子工程，由 Flutter 统一管理。
- 三端分离模式：将 Flutter 工程作为原生工程的子模块，维持原有的原生管理方式不变。

工程类型：

- Flutter App：构建一个标准 Flutter App（统一管理模式），包含 Dart 层和平台层（Android/iOS）。
- Flutter Module：创建一个 Flutter 模块（三端分离模式），以模块的形式嵌入原生项目。
- Flutter Package：纯 Dart 插件工程，不依赖 Flutter，仅包含 Dart 层的实现，通常用来定义一些公共库。
- Flutter Plugin：Flutter 平台插件，包含 Dart 层与 Native 层的实现，是一种特殊的 Flutter Packages。
- Flutter Skeleton：自动生成 Flutter 模块，提供常用框架。
