# Programming Language Theory(PLT)

## 语义学

- [Programming Languages and Lambda Calculi](http://www.cs.utah.edu/~mflatt/past-courses/cs7520/public_html/s06/notes.pdf)

只需要看完前半部分（Part I 和 II，100来页）就可以了。这书好在什么地方呢？它是从非常简单的布尔表达式（而不是 lambda calculus）开始讲解什么是递归定义，什么是解释，什么是 Church-Rosser，什么是上下文 (evaluation context)。在让你理解了这种简单语言的语义，有了足够的信心之后，才告诉你更多的东西。比如 lambda calculus 和 CEK，SECD 等抽象机 (abstract machine)。理解了这些概念之后，你就会发现所有的程序语言都可以比较容易的理解了。

当然，我的博客也写过有关于操作语义的科普，配合了Ruby实现一些抽象机器 https://alexiachen.github.io/blog/2017/10/15/program-semantic/

## 形式验证

- [Software Foundation](https://softwarefoundations.cis.upenn.edu/)

这四卷大部头是形式验证领域的经典，第一卷从逻辑再配合Coq语言做形式化验证，逐步带你怎样证明程序的正确性