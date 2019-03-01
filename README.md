# Objective-C_Design_Patterns
>iOS设计模式项目演化，来自书籍《Object-C编程之道》
本项目为学习设计模式而创建。

《Object-C编程之道》个人感觉是非常好的一本iOS设计模式书籍。
里面会结合在iOS的Cocoa 框架中使用到的例子进行讲解，在学习设计模式的同时，也能对Cocoa框架中使用的设计模式有个熟悉。这一点我非常喜欢。
 
按照设计模式的功能进行划分，可以分为八类：
接口适配类，对象去耦类，对象创建类，抽象集合类，对象状态类，行为扩展类，算法封装类，性能与对象访问类。其中包含内容如下：

**对象创建型：**1.原型模式；2.工厂模式；3.抽象工厂模式；4.单例模式；5.生成器

**接口适配型：**1.适配器模式；2.桥接模式；3.外观模式

**对象去耦型：**1.中介者模式；2.观察者模式

**抽象集合型：**1.组合模式；2.迭代器模式

**行为扩展型：**1.访问者模式；2.装饰器模式；3.责任链模式

**算法封装型：**1.模版方法模式；2.策略模式；3.命令模式

**性能与对象访问型：**1.享元模式；2.代理模式

**对象状态型：**1.备忘录模式

下面将对书中讲解到的设计模式进行简述。
建议有时间的同学去通读和练习一遍。没有时间的同学就看我下面写的吧，先做到心里有个概况。等有时间了再去研究。

后面计划对里面的每种设计模式进行详解（二十一种，真不少），想持续关注的要留心了。

### 对象创建型
**原型模式：**

简单的说就是复制，用同一个磨具复制出一系列的东西。

使用场景有：
1. 创建一个实例流畅复杂，复制比较容易；
2. 创建一个对象子对象组合比较多，复制比较容易；

应用实例：
自定义对象实现NSCopy协议或者NSMutableCopy协议，实现方法copyWithZone或者mutableCopyWithZone。就是对此设计模式的体现。
 
**工厂模式：**

简单的说就是在一个类中根据需求，可以生产出多种类型的产品。

使用场景有：


类有很多具体的子类，想让返回什么样的子类局部化，由内部自行判断。

应用实例：

NSNumber类定义了一系列的工厂方法：

根据int 生产 intNumber; 根据unsigned int 生产 unsignedNumber;
```
+ (NSNumber *)numberWithInt:(int)value;
+ (NSNumber *)numberWithUnsignedInt:(unsigned int)value;
```


**抽象工厂模式：**

从产品的角度看，是一种二维的思考。如水果工厂的工厂模式是生产苹果，橘子。
而苹果分为北方工厂产的苹果，南方工厂产的苹果。
从工厂的角度看，比较简单。抽象工厂下面两个子工厂，它们都可以生产苹果，橘子。

应用实例：

NSNumber抽象工厂。下面很多具体的number工厂，如：
```
+ (NSNumber *)numberWithInt:(int)value;
+ (NSNumber *)numberWithUnsignedInt:(unsigned int)value;
```

**单例模式：**

一个类只有一个实例，并提供全局访问点。

使用场景有：

系统只能共享，无法复制的元素。


应用实例：

- 文件系统管理类:整个系统只有一份。
- UIApplication：一个App只有一个应用单例。

** 生成器模式：**

将一个复杂对象的构建与它的表现分离，使得同样的构建过程可以创建不一样的表现对象。

使用场景：

构建过程需要用不同的组合构建不同表现的对象。
 
对于生成一个比较复杂的对象，通常使用生成器模式 里面按照角色划分有4种：
- 客户端，提出一系列需要，需要什么样的产品。
- 指挥者，从客户端那里接收到一系列需要，然后按照功能分割。
- 构建者，从指挥者手中得到一个需求，并生产一个对于的产品。

**对象创建型整体宏观图如下：**
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/1.png?raw=true)

### 接口适配型

**适配器模式：**

对象调用接口 -> 适配器 -> 被适配接口，适配器可以使原本不兼容的接口可以一起协调工作了。

使用场景：

已有类的接口与需求类接口不匹配。

应用实例：


Delegate是CocoaTouch框架中采用适配器模式（委托）的一种实现。实现协议的具体类是个适配器。
 
**桥接模式：**

把抽象层次结构从实现中分离出来，使其能够独立变更。

抽象层定义了供客户端使用的上层抽象接口。

实现层次结构定义了供抽象层次使用的底层接口。
 
不想在抽象与其实现之间形成固定的绑定关系；

客户端抽象层引用着实现层抽象层；
 
**外观模式：**

- 为子系统中一组不同的功能接口，提供统一的外观服务接口。
- 子系统变的越来越复杂，可以使用外观类为这个子系统提供一个简单的入口。
 
**接口适配型整体宏观图如下：** 
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/2.png?raw=true)

### 对象去耦型

**中介者模式**

一句看概述：封装对象间的交互。

中介者模式用于定义一个集中的场所，对象间的交互可以在一个中介者对象内处理， 从而避免其他对象间的依存关系。

使用场景：
- 对象间的交互定义明确而复杂，导致一组对象彼此互相依赖且难以理解。

使用实例：
- 组件化开发中使用的路由器，就是一个利用反射机制实现的中介者。
 

**观察者模式**

定义一种一对多的关系，使一个对象状态改变，所以观察者对象都收到通知。
观察者模式也叫发布-订阅机制。

可以利用Observer模式，令通知中心为中介，可以做到一个自定义对象通过通知中心 去通知到其他多个对象的目的。

使用场景：

在MVC框架模式中，通过观察着，实现Model，View的联动。
**对象去耦型整体宏观图如下：**
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/3.png?raw=true)

### 抽象集合型
**组合模式**

组合模式让我们把相同基类型的对象组合到树状结构中，其中父节点包含同类型的子节点。

组件节点和叶子节点都是实现同一个基类接口。同一个抽象父类。

对组合对象的查询，访问都是递归操作。

将对象组合成树形结构，以表示“整体-部分”的层次结构，组合使得用户对单个对象和组合对象的操作具有一致性。
使用实例：
- UIView的树形结构，包含很多子View。
- 事件消息链，响应链传递。
 
**迭代器模式**

迭代器提供了一种 顺序访问聚合对象（集合）中元素的方法，而无需暴露结构的底层表示和结构细节。 遍历集合元素的任务从集合 转移给了迭代器对象。

使用场景：

需要访问组合对象内容，而不想暴露内部表示，结构。

迭代器分为内部迭代器和外部迭代器。

外部迭代器允许客户端更自由的使用，同时需要熟悉组合对象的内部结构。

内部迭代器被封装在集合内部，在集合外部提供接口。

使用实例：

集合对象（nsarray, nsdictionary）都默认提供了迭代器。
 
**抽象集合型整体宏观图如下： **
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/4.png?raw=true)

### 行为扩展型
**访问者模式**

作用于组合对象结构中的每一个元素的操作，它让我们在不改变元素类的前提下，扩展这些类的新操作。

在接受访问者的接口方法中，实现将元素传给访问者，然后访问者扩展对元素的操作。

使用场景：

想对一个对象进行很多不相关的操作，又不想污染这个对象。
 
**装饰器模式**

向对象添加行为而不破坏其原有的风格，因此增强了的对象是同一个类的加强版。任何“增强”均可以动态添加和删除。装饰对象可以附加到另一装饰对象，也可以附加到原始对象。

使用场景：

在不影响对象的情况下，动态，透明的给单个对象添加职责。

使用实例：

滤镜操作，可以不管滤镜顺序。
 
**责任链模式**

让一组对象处理特定的请求，而对这个组中的成员（处理程序对象handler）增加，删除不影响组的完整性。

链中的每一个对象实现了同样的方法，处理对链中第一个对象发起的同一个请求。 如果一个对象不知道如何处理这个请求，就把请求传给下一个响应器（successor）。

使用场景：

向一组对象发送处理请求，而不想显示的指定是哪个对象进行处理。
 
**行为扩展型整体宏观图如下：** 
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/5.png?raw=true)

### 算法封装型
**模版方法模式**

在抽象父类中定义操作架构和公共操作，具体操作延迟到子类中实现。

在模版方法模式中，使子类可以重定义算法的某些特定步骤而不改变算法结构。

使用场景：

需要一次性将不变部分写好，将可变部分留给子类实现。

使用实例：

- 在UIView 中的方法draw:(CGRect)rect方法。

这个绘图方法draw:为UIView提供的钩子函数，当用户想要自己绘图时，就可以自己扩展添加。不实现也不影响功能。
 
**策略模式**

在面向对象设计中，将不同的算法分离成不同的类，称为策略。与这种做法相关的设计模式，称为策略模式。

使用场景：

在平时的函数中会出现if-else或者switch-case这样的选择语句，它们的不同分支下对应的是不同的算法。 而将这些不同的算法封装成一个个不同的算法对象。实际上就是不同的策略。

使用实例：

控制器是视图的策略类，视图可以因为控制器不同而展示不同的信息。
 
**命令模式**

在面向对象设计中，把指令封装在各种命令对象中，命令对象可以被传递， 并且在指定时刻被不同客户的复用，从这一概念精心设计的模式被称为命令模式。

使用场景：
- 想让程序支持撤销恢复功能

使用实例：

NSInvocation, NSUndoManager是框架中这个模式的典型应用。
 
**算法封装型整体宏观图如下： **
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/7.png?raw=true)

### 性能与对象访问型

**享元模式**

运用共享技术，有效的控制大量细粒度的对象。

使用场景：
- 应用程序中使用大量对象时。
- 通过共享减少了多少对象总数。

使用实例：

屏幕上要展示1000朵小花，利用共享可以只用10个imageData对象，1000个坐标对象。
 
**代理模式**

为其他客户端提供一种代理，来控制对真实对象的访问。
- 远程代理：用本地对象代替远程对象。如：发送网络时的代理服务器。
- 虚拟代理：将代理直接面向客户端，使客户端认为操作的虚拟代理就是真实对象。虚拟代理提供占位对象和重型对象。默认使用占位对象，当需要使用重型对象时才加载。
 
使用实例：

- Object-C不支持多继承，如果代理对象不是NSObject的子类的话，可以考虑用NSProxy来作为占位或者替代对象。
- 尽管NSProxy也是NSObject类型，但是NSProxy的作用就是当代理。
 
**性能与对象访问型整体宏观图如下：** 
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/6.png?raw=true)

### 对象状态型
**备忘录模式**

在不破坏原有封装的前提下，捕获一个对象的内部状态，并在该对象之外保存状态。 这样，之后可将对象恢复到之前的状态。将状态封装成对象保存。

使用场景：

需要保存对象在某一时刻的状态（或部分状态），这样以后就可以恢复到先前的状态。

使用实例：

Cocoa Touch框架在归档，属性列表序列化，核心数据中采用了备忘录模式。
 
**对象状态型整体宏观图如下：** 
![](https://github.com/zhfei/Objective-C_Design_Patterns/blob/master/Objective-C_Design_Patterns/Rescues/8.png?raw=true)