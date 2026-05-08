# 翻页时钟

一款极简风格的翻页时钟 Android App，基于 Flutter + WebView 实现。

> 本产品纯粹vibing coding产物，使用的是claude code sonnet 4.6 搭配cursor开发，在代码上可能会出现冗余 

## 功能:heart_eyes:

- 翻页动画时钟（时/分/秒，带流畅翻页效果）
- 实时日期与星期显示
- 黑/白两种主题切换
- 计时器（最长 24 小时，支持开始/暂停/重置）
- 倒计时（滑块设置时间，归零时音效提示）
- 石英钟走针音效（可开关）

## 产品截图:kissing_cat:

![image-20260508152602027](D:\Turning_page_clock\image\image-20260508152602027.png)

![image-20260508152628390](D:\Turning_page_clock\image\image-20260508152628390.png)

![image-20260508152634998](D:\Turning_page_clock\image\image-20260508152634998.png)

![image-20260508152647619](D:\Turning_page_clock\image\image-20260508152647619.png)

> 在手机上横屏全屏显示，沉浸式体验。

## 安装

从 [Releases](../../releases) 页面下载最新的 `app-release.apk`，传到 Android 手机安装即可。

> 首次安装需在手机设置中允许"安装未知来源应用"。

## 本地构建

```bash
# 安装依赖
flutter pub get

# 构建 APK
flutter build apk --release
```

构建产物位于 `build/app/outputs/flutter-apk/app-release.apk`。

## 技术栈

- Flutter 3.x
- flutter_inappwebview — WebView 容器
- HTML / CSS / JavaScript — 时钟 UI 与动画
- Web Audio API — 音效合成
