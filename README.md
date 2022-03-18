# force-torque-sensor-filter
Filter for force torque sensor which mounted on robot end. 

最近做一个医疗机器人，上面安装了力矩传感器，为了防止机器人撞到其他设备或者人。客户要求力矩响应在50N以上就要机器人停止运动，所以传感器本身的输出波动要小于15N，否则很容易误触发。
由于这个项目控制器是采用的其他家的，他们在力矩传感器调试这边就简单导入了厂商的xml，读取传感器实时数据，然后使用卡尔曼kalman滤波，对当前负载进行重力补偿一下就输出了。

项目中有matlab和C的两种测试，前期先用matlab测试一下 均值滤波(average filter), 中值滤波(median filter), 一阶、二阶kalman.
