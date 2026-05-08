# 翻页时钟 Axure 实现指南

## 项目概述

本指南将指导你在 Axure RP 中重建一个精美的翻页时钟原型。

## 设计规范

### 颜色方案
- 背景色: #000000 (纯黑色)
- 卡片底色: #1a1a1a (深灰色)
- 卡片顶部渐变: #2a2a2a → #1a1a1a
- 卡片底部渐变: #1a1a1a → #0d0d0d
- 数字颜色: #e0e0e0 (浅灰色)
- AM/PM 颜色: #999999
- 分割线颜色: #000000

### 尺寸规格
- 卡片尺寸: 120px × 180px
- 卡片间距: 8px
- 数字字体大小: 140px
- AM/PM 字体大小: 16px
- 分割线高度: 2px

### 字体
- 数字: Helvetica Neue, Arial, 粗体 700
- AM/PM: Helvetica Neue, Arial, 粗体 600

## 组件结构

### 1. 页面设置
- 页面尺寸: 自适应
- 背景色: #000000

### 2. 翻页卡片组件 (Flip Card)

每个数字卡片包含以下元素:

| 元素 | 类型 | 尺寸 | 位置 | 样式 |
|------|------|------|------|------|
| 卡片容器 | 动态面板 | 120×180 | 相对定位 | 圆角12px, 阴影 |
| 顶部区域 | 矩形 | 120×90 | 顶部 | 渐变背景 |
| 底部区域 | 矩形 | 120×90 | 底部 | 渐变背景 |
| 顶部数字 | 标签 | - | 顶部区域居中 | 字体140px |
| 底部数字 | 标签 | - | 底部区域居中 | 字体140px |
| 分割线 | 矩形 | 120×2 | 中间 | 黑色半透明 |
| AM/PM标记 | 标签 | - | 左上角 | 字体16px |

### 3. 设置图标
- 位置: 右下角，距离边缘30px
- 尺寸: 40×40px
- 形状: 圆形，背景rgba(255,255,255,0.1)
- SVG图标: 设置齿轮图标

## 交互设计

### 数字更新逻辑
1. 创建全局变量存储当前时间
2. 使用计时器每1秒更新一次
3. 分别更新时、分、秒的各个数字位

### 变量定义
| 变量名 | 类型 | 说明 |
|--------|------|------|
| currentHours | 数字 | 当前小时 |
| currentMinutes | 数字 | 当前分钟 |
| currentSeconds | 数字 | 当前秒数 |
| period | 文本 | AM/PM |

### 计时器设置
- 触发条件: 页面加载时
- 时间间隔: 1000ms (1秒)
- 循环: 无限循环

### 更新逻辑
```
OnTimer:
  Set currentHours = Now.GetHours()
  Set currentMinutes = Now.GetMinutes()
  Set currentSeconds = Now.GetSeconds()
  
  If currentHours >= 12:
    Set period = "PM"
    Set currentHours = currentHours - 12
  Else:
    Set period = "AM"
  
  If currentHours == 0:
    Set currentHours = 12
  
  Set hour1 = Math.Floor(currentHours / 10)
  Set hour2 = currentHours % 10
  Set minute1 = Math.Floor(currentMinutes / 10)
  Set minute2 = currentMinutes % 10
  Set second1 = Math.Floor(currentSeconds / 10)
  Set second2 = currentSeconds % 10
  
  Update all text widgets with new values
```

## 响应式设计

### 移动端适配 (< 500px)
- 卡片尺寸: 80×120px
- 数字字体: 90px
- AM/PM字体: 12px
- 卡片间距: 6px

## 文件结构

```
AxureProject/
├── project.json          # 项目配置
├── pages/               # 页面文件夹
│   └── 翻页时钟.rppage   # 主页面
├── widgets/             # 组件文件夹
│   └── FlipCard.rpwidget # 翻页卡片组件
├── images/              # 图片资源
│   └── settings.svg     # 设置图标
└── AXURE_IMPLEMENTATION_GUIDE.md  # 实现指南
```

## 导出与发布

### 预览
- 点击预览按钮查看效果
- 确保计时器正常运行

### 导出选项
- HTML原型
- PNG图片
- PDF文档

## 注意事项

1. 使用动态面板实现卡片翻转动画效果
2. 确保字体在所有设备上一致显示
3. 测试不同屏幕尺寸的响应式效果
4. 验证计时器在预览模式下正常工作

---

## 快速导入说明

1. 打开 Axure RP
2. 创建新项目
3. 按照本指南创建组件和页面
4. 设置交互和变量
5. 预览测试

---

*文档版本: 1.0*
*创建日期: 2026-04-23*