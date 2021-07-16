## 性能探测工具
- https://github.com/plasma-umass/coz  
  一个有意思的性能分析工具Coz，传统的perf和profile一般告诉你哪里慢了，但是哪里导致慢还得苦苦分析，Coz通过“虚拟加速代码”不停的探测哪行代码需要去优化，且告诉你优化后的整体性能提升多少。据官方分析，通过Coz分析，Memcached性能提高了9%，SQLite的性能提高了25%，并将6个PARSEC应用程序的速度提高了68%，而且这些优化需要修改的代码大都在10行以下。分析报告有图表。学院派作品，算是SOSP，2015的论文实现。
- [easy_profiler](https://github.com/yse/easy_profiler) Lightweight cross-platform profiler library for c++


## static analyzer
- [facebook/infer](https://github.com/facebook/infer) A static analyzer for Java, C, C++, and Objective-C http://fbinfer.com/

