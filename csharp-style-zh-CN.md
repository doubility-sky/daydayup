译自：[C# at Google Style Guide](https://google.github.io/styleguide/csharp-style.html)

# C# 谷歌风格指南

This style guide is for C# code developed internally at Google, and is the
default style for C# code at Google. It makes stylistic choices that conform to
other languages at Google, such as Google C++ style and Google Java style.

## 格式指南

### 命名规则

命名规则遵循
[Microsoft's C# naming guidelines](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/naming-guidelines).
其未指定的规则 (如： 私有和局部变量) 取自
[CoreFX C# coding guidelines](https://github.com/dotnet/runtime/blob/master/docs/coding-guidelines/coding-style.md)

规则概要:

#### 源码

*   Names of classes, methods, enumerations, public fields, public properties,
    namespaces: `大驼峰`.
*   Names of local variables, parameters: `小驼峰`.
*   Names of private, protected, internal and protected internal fields and
    properties: `_小驼峰`.
*   Naming convention is unaffected by modifiers such as const, static,
    readonly, etc.
*   For casing, a "word" is anything written without internal spaces, including
    acronyms. For example, `MyRpc` instead of ~~`MyRPC`~~.
*   Names of interfaces start with `I`, e.g. `IInterface`.

#### 文件

*   Filenames and directory names are `大驼峰`, e.g. `MyFile.cs`.
*   Where possible the file name should be the same as the name of the main
    class in the file, e.g. `MyClass.cs`.
*   In general, prefer one core class per file.

### 组织结构

*   Modifiers occur in the following order: `public protected internal private
    new abstract virtual override sealed static readonly extern unsafe volatile
    async`.
*   Namespace `using` declarations go at the top, before any namespaces. `using`
    import order is alphabetical, apart from `System` imports which always go
    first.
*   Class member ordering:
    *   Group class members in the following order:
        *   Nested classes, enums, delegates and events.
        *   Static, const and readonly fields.
        *   Fields and properties.
        *   Constructors and finalizers.
        *   Methods.
    *   Within each group, elements should be in the following order:
        *   Public.
        *   Internal.
        *   Protected internal.
        *   Protected.
        *   Private.
    *   Where possible, group interface implementations together.

### 空白规则

Developed from Google Java style.

*   A maximum of one statement per line.
*   A maximum of one assignment per statement.
*   Indentation of 2 spaces, no tabs.
*   Column limit: 100.
*   No line break before opening brace.
*   No line break between closing brace and `else`.
*   Braces used even when optional.
*   Space after `if`/`for`/`while` etc., and after commas.
*   No space after an opening parenthesis or before a closing parenthesis.
*   No space between a unary operator and its operand. One space between the
    operator and each operand of all other operators.
*   Line wrapping developed from Google C++ style guidelines, with minor
    modifications for compatibility with Microsoft's C# formatting tools:
    *   In general, line continuations are indented 4 spaces.
    *   Line breaks with braces (e.g. list initializers, lambdas, object
        initializers, etc) do not count as continuations.
    *   For function definitions and calls, if the arguments do not all fit on
        one line they should be broken up onto multiple lines, with each
        subsequent line aligned with the first argument. If there is not enough
        room for this, arguments may instead be placed on subsequent lines with
        a four space indent. The code example below illustrates this.

### 例子

```c#
using System;                                       // `using` 置顶, 在命名空间之外


namespace MyNamespace {                             // 命名空间 大驼峰.
                                                    // 命名空间之后空行.
  public interface IMyInterface {                   // 接口以 'I' 开始
    public int Calculate(float value, float exp);   // 接口方法 大驼峰，逗号后加空格
  }

  public enum MyEnum {                              // 枚举名 大驼峰.
    Yes,                                            // 枚举值 大驼峰.
    No,
  }

  public class MyClass {                            // class 名 大驼峰.
    public int Foo = 0;                             // Public 成员变量 大驼峰.
    public bool NoCounting = false;                 // 推荐 字段初始化.
    private class Results {
      public int NumNegativeResults = 0;
      public int NumPositiveResults = 0;
    }
    private Results _results;                       // Private 成员变量 '_小驼峰'. 
    public static int NumTimesCalled = 0;
    private const int _bar = 100;                   // const/static 不影响命名约定.
    private int[] _someTable = {                    
      2, 3, 4,                                      // 容器初始化需缩进
    }

    public MyClass() {
      _results = new Results {
        NumNegativeResults = 1,                     // 对象初始化需缩进
        NumPositiveResults = 1,                     
      };
    }

    public int CalculateValue(int mulNumber) {      // 左花括号不折行
      var resultValue = Foo * mulNumber;            // 局部变量 小驼峰.
      NumTimesCalled++;
      Foo += _bar;

      if (!NoCounting) {                            // 一元操作符无需空格，if 关键字后空格
        if (resultValue < 0) {                      // 始终使用花括号；比较操作符两边添加空格
          _results.NumNegativeResults++;
        } else if (resultValue > 0) {               // 花括号与 else 之间不折行.
          _results.NumPositiveResults++;
        }
      }

      return resultValue;
    }

    public void ExpressionBodies() {
      // 简单的 lambda 表达式, 单行，无需括号或花括号
      Func<int, int> increment = x => x + 1;

      // 右花括号，与左花括号所在行的第一个字符对齐
      Func<int, int, long> difference1 = (x, y) => {
        long diff = (long)x - y;
        return diff >= 0 ? diff : -diff;
      };

      // 如果在折行之后定义，则缩进整个代码块
      Func<int, int, long> difference2 =
          (x, y) => {
            long diff = (long)x - y;
            return diff >= 0 ? diff : -diff;
          };

      // 行内 lambda 参数也遵循这些规则。如果参数包含 lambda，推荐另起一行
      CallWithDelegate(
          (x, y) => {
            long diff = (long)x - y;
            return diff >= 0 ? diff : -diff;
          });
    }

    void DoNothing() {}                             // 精简空代码块

    // 如果可以的话，令换行后的参数与第一个参数对齐。
    void AVeryLongFunctionNameThatCausesLineWrappingProblems(int longArgumentName,
                                                             int p1, int p2) {}

    // 如果不方便与第一个参数对齐，或影响阅读，将所有参数另起一行并缩进
    void AnotherLongFunctionNameThatCausesLineWrappingProblems(
        int longArgumentName, int longArgumentName2, int longArgumentName3) {}

    void CallingLongFunctionName() {
      int veryLongArgumentName = 1234;
      int shortArg = 1;
      // 如果可以的话，令换行后的参数与第一个参数对齐。
      AnotherLongFunctionNameThatCausesLineWrappingProblems(shortArg, shortArg,
                                                            veryLongArgumentName);
      // 如果不方便与第一个参数对齐，或影响阅读，将所有参数另起一行并缩进
      AnotherLongFunctionNameThatCausesLineWrappingProblems(
          veryLongArgumentName, veryLongArgumentName, veryLongArgumentName);
    }
  }
}
```

## C# 编码指南

### 常量

*   变量与字段，能 `const` 就 `const`
*   如果不能 `const`, 可以尝试 `readonly`
*   用常量代替 `magic numbers`

### IEnumerable vs IList vs IReadOnlyList

*   尽可能用最严格的集合类型作为输入，例如：输入不可变的话，以 `IReadOnlyCollection` / `IReadOnlyList` / `IEnumerable` 作为方法的输入。
*   对于输出，如果要将返回容器的所有权传递给所有者，推荐使用 `IList` 而不是 `IEnumerable`。
    如果不传递所有权，推荐更严格的类型选择。

### 生成器(Generator) vs 容器(Container)

- [What is generator code?](https://softwareengineering.stackexchange.com/questions/411877/what-is-generator-code)
  - Generator 是一个能产生 enumerable 的方法

*   谨慎判断，并牢记以下几点:
    *   生成器代码通常比使用容器的可读性差。
    *   如果结果可以被惰性处理，生成器代码可以有更好的性能。例如：当不需要所有结果的时候。
    *   生成器代码通过 `ToList()` 转为容器，比直接使用容器效率低。
    *   调用多次生成器代码，要远慢于迭代一个容器多次。

### 属性(Property)风格

*   对于单行只读属性，推荐使用表达式体属性(`=>`)
*   其他情况，使用旧的 `{ get; set; }` 语法

### 表达式体(Expression body)语法

例如:

```c#
int SomeProperty => _someProperty
```

*   对于 lambda 和属性，适当使用表达式体语法。
*   不要用在方法定义。
*   与方法和其他作用域代码块一样，将右括号对齐到包含左括号的行的第一个字符。

### 结构体(Struct) 和 类(Class)

*   Struct 和 class 有很大的不同:

    *   struct 总是以值的形式传递和返回。
    *   给一个返回的 struct 的成员赋值，不改变原始 struct 的数据。-- 例如：`transform.position.x = 10`
        不会将 transform 的 position.x 设为 10；这里的 `position` 是返回 `Vector3` 值的一个属性，
        所以这只是设置了一个原始 struct 的副本的 x 参数。

*   几乎总是使用 class

*   当类型可以被当作值类型来对待时，考虑使用 struct - 例如，如果类型的实例很小，并且通常是短暂存在的，
    或者通常嵌入在其他对象中，比如 Vector3，四元数与界。

*   注意，这个指导意见可能因团队而异，例如，性能问题可能会被迫使用结构。

### Lambda 表达式 vs 具名方法(named methods)

*   如果一个 lambda 是非琐碎的 (例如：除了声明还有不少语句)，或在多个地方重复使用，它就可能应该写成有具体名字的方法。

### 字段初始化(Field initializers)

*   鼓励使用字段初始化。

### 扩展方法(Extension methods)

*   仅当没有原始 class 的源码或无法改变源码时，使用扩展方法。
*   仅当要添加的功能是一个适合添加到原始 class 的源码中的‘核心’通用特性，使用扩展方法。
    *   注意 - 如果我们有要扩展的 class 的源码，且 class 的维护者不希望添加该功能，则不推荐使用扩展方法。
*   仅将扩展方法放在无处不在的核心库中 - 只在某些代码中可用的扩展会造成可读性问题。
*   注意，使用扩展方法总是会混淆代码，所以最好不要用。

### ref 和 out

*   对于非输入的返回，使用 `out`。
*   将 `out` 形参，放在方法定义中所有形参的最后。
*   `ref` 应很少被使用，仅当有必要修改输入时。
*   不要用 `ref` 作为传递 struct 的一种优化。
*   不要用 `ref` 将可修改容器传递到方法中。仅在提供的容器要被完全不一样的容器替换时，才需要 `ref`。

### LINQ

*   一般选择单行的 LINQ 调用以及命令式代码，而不是长链式的 LINQ。混杂命令式代码和大量链接的 LINQ 通常很难读。
*   推荐成员扩展函数而不是 SQL 风格的 LINQ 关键字 - 例如：推荐 `myList.Where(x)` 而不是 `myList where x`
*   对于任何超过单行的语句，避免使用 `Container.ForEach(...)` 

### 数组(Array) vs 列表(List)

*   对于 public 变量、属性，及返回类型，相比数组通常选 `List<>`  (参考前面关于 `IList` / `IEnumerable` /
    `IReadOnlyList` 的指导意见)。
*   当容器的大小可以改变时，选择 `List<>`。
*   如果容器大小确定，且在创建时已知，选择数组。
*   尽可能使用一维数组而不是多维数组。
*   注意:
    *   数组和 `List<>` 都是线性、连续的容器。
    *   类似 C++ 中的数组与 `std::vector`，数组的容量固定而 `List<>` 可以动态增加。
    *   一些情况下数组的性能更好，但通常来说 `List<>` 更灵活

### 文件夹和文件位置

*   和项目保持一致。
*   尽可能选择平坦的结构。

### 使用元组(tuple)作为返回类型

*   通常选择有名字的 class 而不是 `Tuple<>`，尤其是当返回复杂类型的时候。

### 字符串内插 vs `String.Format()` vs `String.Concat` vs `+` 操作符

*   一般来说，使用最容易阅读的方式，特别是对于日志和断言消息。
*   注意使用 `+` 链式拼接会很慢，而且导致大量的内存搅动。
*   如果关注性能，使用 `StringBuilder` 来拼接多个字符串将会更快。

### `using`

*   一般不要使用 `using` 来为长类型名起别名。这通常意味着一个 `Tuple<>` 需要转换为 class。
    *   例如： `using RecordList = List<Tuple<int, float>>` 应使用一个具名的 class 来代替。
*   注意，`using` 语句仅在文件范围内起作用，因此用途有限。类型别名将对外部用户不可见。

### 对象初始值设定项(Object Initializer)语法

例如:

```c#
var x = new SomeClass {
  Property1 = value1,
  Property2 = value2,
};
```

*   对象初始值设定项语法适用于普通数据(POD)类型。POD(plain old data): int、char、float ...
*   对于带有构造函数的 class 或 struct，避免使用此语法。
*   如果拆分多行，则缩进一个块级别。

### 命名空间(namespace)的命名

*   namespace 深度一般不超过两层。
*   无需强制 文件/目录 布局和 namespace 匹配。
*   对共享的 库/模块 代码，使用 namespace。终端的 'application' 代码，比如 `unity_app`, namespace 没有必要。
*   对于顶层 namespace 命名必须全局唯一，且便于辨认。

### 值/空形式返回 struct

*   推荐返回一个 'success' 布尔值，或一个 `out` struct 值
*   在不关注性能的地方，若能令代码的可读性大幅提升（例如：链式的 null 条件运算符相对于深度嵌套的 if 语句），
    则可空的 struct 是能接受的。
*   注意:

    *   可空 struct 很方便，但加强了 ‘null is failure’ 的形式，建议避免。

### 迭代时从容器移除

C# (像许多其他语言一样) 不提供明显的机制在迭代期间从容器中移除项。一些可选的方式：

*   如果所有需要移除的项都满足一些条件，建议使用 `someList.RemoveAll(somePredicate)` 方式。
*   如果在迭代期间需要做些其他工作，`RemoveAll` 就可能不太够用了。
    一个常用的替代方案是，在循环之外创建一个新的容器，将要保留的项插入到新的容器中，然后在迭代结束时和原始的容器做交换。

### 调用 delegates

*   当调用一个 delegate，使用 `Invoke()` 且使用 null 条件运算符 - 例如：`SomeDelegate?.Invoke()`。
    这能清晰表明这是‘一个 delegate 在调用’。此处的 null 检查能简洁且健壮地应对线程竞争情形。

### `var` 关键字

*   如能通过避免（啰嗦的、显而易见的、不重要的）类型名来增加可读性，则鼓励使用 `var`
*   以下情况，鼓励使用:

    *   当类型是明显的 - 例如： `var apple = new Apple();` 或 `var request = Factory.Create<HttpRequest>();`
    *   对于仅直接传递给其他方法的短暂过渡变量 - 例如：`var item = GetItem(); ProcessItem(item);`

*   以下情况，不鼓励使用:

    *   使用基本类型时 - 例如： `var success = true;`
    *   使用编译器解析的内置数值类型时 - 例如： `var number = 12 * ReturnsFloat();`
    *   当用户明显受益于知晓具体类型时 - 例如： `var listOfItems = GetList();`

### 特性(Attributes)

*   Attributes 应出现在关联的字段、属性和方法的上一行，和成员分开。
*   多个 attributes 应换行分隔开。以方便添加或移除 attributes，令每个 attribute 易于查找。

### 实参命名

源自 Google C++ style guide。

当一个函数实参的意义不明显时，考虑以下补救方式：

*   如果实参是一个字符串常量，且在多个函数调用中被使用，使用命名常量来将其显式约束并持有。
*   考虑改变函数签名，替换 `bool` 实参为 `enum` 实参。这将使实参值能自描述。
*   将大型或复杂的嵌套表达式替换为具体命名的变量。
*   考虑使用[命名实参](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/named-and-optional-arguments)
    来阐明实参在调用点的含义。
*   对于具有多个配置选项的函数，考虑定义单独的 class 或 struct 来持有所有的选项然后传递一个实例。
    这个方法有很多优势。选项在调用点是以名字方式引用的，所以阐明了他们的含义。同时减少了函数实参的数量，
    使得函数调用读写更简单。还有个附加的好处是，当增/减选项时，调用点无需修改。

考虑下面的例子:

```c#
// Bad - 传入参数意义不明朗
DecimalNumber product = CalculateProduct(values, 7, false, null);
```

对比:

```c#
// Good
ProductOptions options = new ProductOptions();
options.PrecisionDecimals = 7;
options.UseCache = CacheUsage.DontUseCache;
DecimalNumber product = CalculateProduct(values, options, completionDelegate: null);
```
