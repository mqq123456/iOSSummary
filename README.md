# iOS开发总结
  我们如何去做一个快速有效的app，这是一个问题，那么我们如何才能做的最快
  这里写一些模版，让用户能更快捷，更方便的使用
  个人认为iOS开发还是相对比较简单的，oc语言也是比较简单的，只是语法相对于其他语言要怪异一点，根本有有C语言想象中那样指针的复杂

## 学习iOS控件
  1.UIView属性
  2. UISlider可拖动的进度条 （android SeekBar
  3. UIButton按钮
  4. UILable 文本 （android TextView）
  5. UITextdField UITextView 文本输入框（android EditText）
  6. UISwitch 开关
  7. UIDatePicker日期控件
  8. UIPickerView 跟android Spinner相似
  9. UIScollView (android ScollView)
  10. UITableView UICollectionView（ android ListView GridView ExpandListView）
  11. UIImageView 图片显示控件（android ImageView）

## 开发设计
  1.前提，我们已经熟悉iOS的MVC设计模式，已经了解ViewController的生命周期
  2.拿到一个设计图稿以后，我们首先分析页面布局
  3.哪些地方用哪种控件实现，以及控件的包含关系
  4.创建控件
  5.自定义控件
  6.提供frame控件的位置，设计关键是控件的位置以及大小。
  
## 复杂设计
1.列表设计
    不可否认，列表是一个应用必须要存在的东西
    学会复杂列表设计思想
2.导航条设计
    一个应用，一定会有导航条，可以自定义各种样式导航条
3.拖拽设计
    很多情况下我们会发现有列表拖拽的情况，如何处理滑动冲突时必然的
4.复杂布局
    其实再复杂的布局也是用一个一个小控件一点一点地勾勒出来的，不要着急，一点点的分析好包含关系，基本上没有问题
5.基础资源设计
    app一定会包含一些常量字符串、宏等，学会在一个文件中定义这些数据
6.单例设计
    不多说，理解好单例的生命周期，其实就是app的生命周期，比较适合一些运行时数据的保存
7.时间戳处理
    学会时间的格式化
8.懒加载
    学会一种加载方式吧。
