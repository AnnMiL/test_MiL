# test_MiL

# 实验测试

### 准备工作
1. 查看待测试芯片具体信息，包括长宽厚度功率等等，可参考相关拆机博客。
2. 使用Ubuntu系统，安装cpu温度监控软件 lm-sensors。输入sensors可以看到对应的硬件设备的温度。在sys/class/hwmon文件目录下，不同的hwmonX中包含name文件，对应着当前文件夹下设备的相关传感器数据。找到并记录对应CPU的文件名。
3. 设置cpupower。注意台式机固定CPU频率为最大值的话，拔掉风扇测试，容易炸……很贵赔不起
参考链接：https://blog.csdn.net/qq_37994458/article/details/87984904

### 获得热力学模型信息
1. 安装HotSpot工具包
下载地址：http://lava.cs.virginia.edu/HotSpot/HotSpot-HOWTO.htm
根据官网要求，解压编译。
2. 获得芯片热力学模型
（1）在HotSpot官网上有快速使用的说明。需要配置的文件有：hotspot.config和ev6.flp文件（注意文件命名）。分别是CPU芯片及散热器相关参数和CPU的平面结构图。CPU的平面结构采用块状结构按照物理核心个数将总面积平均分。

（2）需要更改编译的优先级，将1改为3，可以看到运行结果里详细的热力学模型。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628164947455.png)

（3）运行：`hotspot -c hotspot.config -f ev6.flp -p gcc.ptrace -o gcc.ttrace -steady_file gcc.steady`，可以在后面加上`>> filename`保存输出结果。

（4）注意记录输出结果。

相关基础知识细节等可参考：https://blog.csdn.net/qq_37994458/article/details/88423828
可参考HotSpot_Files文件夹对比修改之后的文件。

### 仿真计算（以intel4790为例）
1. MATLAB配置：
仿真使用MATLAB，需要安装RTC工具包。项目文件夹里有一个RTCToolbox，进入rtc文件夹，有一个install.txt，按照说明文档安装。路径见下图。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628141810652.png)

2. 将整个测试代码添加到MATLAB的环境路径里。
3. 计算。

（1）读入模型信息

首先添加flp文件，内容与HotSpot的flp文件相同。注意文件名，flp文件路径如下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628142604672.png)

修改（或添加）并运行flpRead.m文件。注意文件名，文件保存路径如下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628142832793.png)

（2）输入热力学模型，得到相关数据集。

修改（或添加）fftThermalModel.m文件并运行。其中invc矩阵对应HotSpot得出的inva矩阵，SplusG对应b，g_amb对应g_amb。beta_a的常数系数等于芯片的功率除以物理内核数，具体数值可做微调以便更接近实际情况。文件路径如下，注意函数名和文件名。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628143110469.png)

（3）仿真测试

修改（或添加）并运行测试文件，文件路径如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628144017765.png)

一共有三个任务，如下。wcets的定义和论文保持一致。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628143921719.png)

注意这个系数，测试对应的是哪一个值。
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019062814415877.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM3OTk0NDU4,size_16,color_FFFFFF,t_70)

（3）运行结果

结果保存路径如下，注意测试文件命名的结果的文件。记录得到的newresultData里每种算法的执行时间，solution记录的[toff,ton]矩阵信息等相关数据。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628144342553.png)

备注：其中涉及到会修改的文件可参考项目里的matlab_Files文件夹里的former文件夹（later也可以）。仅做参考，之前的jitter设置为1.5period，错误。后期实验与论文保持一致设置为0.

### 芯片测试
1.安装McFTP。按照项目里的McFTP里面的readme进行配置（项目里已经编译好了其实……）再次提醒如果台式机固定最高频率会炸。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628150451161.png)

 注意关掉软件计算得到的温度：![在这里插入图片描述](https://img-blog.csdnimg.cn/2019062815152896.png)
 
2. 配置xml文件。

文件路径如下：
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628151212559.png)
 
 测试周期：![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628151324773.png)
 
 注意读取的文件名，选择读取内核温度的文件：![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628151409983.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM3OTk0NDU4,size_16,color_FFFFFF,t_70)
 
 根据应用程序定义，设置wcets 和任务数量：![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628151651279.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM3OTk0NDU4,size_16,color_FFFFFF,t_70)
 
 仿真得出的[toff,ton]：![在这里插入图片描述](https://img-blog.csdnimg.cn/20190628152037747.png)
 
 3. 运行
 
 得到温度结果，保存为一个表格文件。
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/201906281521550.png)

第一行为总和。第二行为最大值。第三行为每一列（每个核心）的最大值。第四行开始为每0.1秒测得的CPU核心温度，精度为1.实验仅记录最大值。

注意：

（1）每次测试要使cpu完全冷却，笔记本要无任务等待5-10min，台式机可以通过插上风扇帮助冷却。

（2）测试过程中关闭其他程序，防止干扰。关闭风扇。


### 现实验进程
1. 台式机intel4790和intel6700的热力学模型是准确的，仿真结果保存在MATLAB_Files的jitter=0的文件夹里。intel6700的仿真结果还在跑没跑完。
2. 芯片测试未完成。两台台式机里都保存有McFTP的安装及编译文件，可直接跑测试(intel4790保存在垃圾桶，拎出来就好）。
3. intel4790对应庄耿行师兄现在使用的台式机，intel6700对应赵志豪师兄使用的台式机，仿真结果都是使用赵志豪师兄台式机MATLAB运行（配置比较高跑的快一些）。
