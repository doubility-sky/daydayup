[PHP](https://www.php.net/) is a popular general-purpose scripting language that is especially suited to web development.

Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.


- [PECL](https://pecl.php.net/) is a repository for PHP Extensions, providing a directory of all known extensions and hosting facilities for downloading and development of PHP extensions.



## Learn
- [Coding standards for modern PHP](https://make.wordpress.org/core/2020/03/20/updating-the-coding-standards-for-modern-php/)



## Frameworks

### [Laravel](https://laravel.com/)
- Laravel is a web application framework with expressive, elegant syntax. We’ve already laid the foundation — freeing you to create without sweating the small things.

### Yaf(Yet Another Framework)
- [用户手册](http://www.laruence.com/manual/)



## Interview
- [PHP interview best practices in China](https://github.com/wudi/PHP-Interview-Best-Practices-in-China)



## FAQs
- [php-fpm进程数管理](https://segmentfault.com/a/1190000015612563)
- [PHP-FPM子进程数量应该如何设置？](https://blog.csdn.net/hhq163/article/details/72953664)
  - 如果代码是 CPU 计算密集型的，pm.max_chindren 不能超过 CPU 的内核数
  - 如果代码不是 CPU 计算密集型的，那么将 pm.max_chindren 的值大于 CPU 的内核数
  - 在 N + 20% 和 M / m 之间
    - N 是 CPU 内核数量
    - M 是 PHP 能利用的内存数量
    - m 是每个 PHP 进程平均使用的内存数量
- [启用php-fpm状态详解](http://www.ttlsa.com/php/use-php-fpm-status-page-detail)



## Resources
- [Awesome PHP](https://github.com/ziadoz/awesome-php), A curated list of amazingly awesome PHP libraries, resources and shiny things.
