####  FlyweightPattern 享元模式

实现享元模式的两个重要组件：
1.可共享的享元对象
2.保持享元对象的池
享元对象的池通常采用抽象工厂来管理

运用共享技术，有效的支持大量细粒度的对象

何时使用享元模式
1.应用程序中使用大量对象时
2.对象的特有状态可以放到外面轻量化
3.移除外部特有状态时，可以用较少的共享对象来替代原来的那组对象。

通过享元对象节省的内存空间数计算
1.通过共享减少了多少对象总数
2.每个对象中内在状态的个数
3.外在状态是通过计算的，还是需要报错到内存中的。
