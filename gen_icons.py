from PIL import Image
import os

src = r"C:\Users\ycx15\Desktop\tubiao.png"

icons = {
    r"D:\Turning_page_clock\android\app\src\main\res\mipmap-mdpi\ic_launcher.png": 48,
    r"D:\Turning_page_clock\android\app\src\main\res\mipmap-hdpi\ic_launcher.png": 72,
    r"D:\Turning_page_clock\android\app\src\main\res\mipmap-xhdpi\ic_launcher.png": 96,
    r"D:\Turning_page_clock\android\app\src\main\res\mipmap-xxhdpi\ic_launcher.png": 144,
    r"D:\Turning_page_clock\android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png": 192,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-20x20@1x.png": 20,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-20x20@2x.png": 40,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-20x20@3x.png": 60,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-29x29@2x.png": 58,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-29x29@3x.png": 87,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-40x40@1x.png": 40,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-40x40@3x.png": 120,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-60x60@2x.png": 120,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-60x60@3x.png": 180,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-76x76@1x.png": 76,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-83.5x83.5@2x.png": 167,
    r"D:\Turning_page_clock\ios\Runner\Assets.xcassets\AppIcon.appiconset\Icon-App-1024x1024@1x.png": 1024,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_16.png": 16,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_32.png": 32,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_64.png": 64,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_128.png": 128,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_256.png": 256,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_512.png": 512,
    r"D:\Turning_page_clock\macos\Runner\Assets.xcassets\AppIcon.appiconset\app_icon_1024.png": 1024,
    r"D:\Turning_page_clock\web\favicon.png": 16,
    r"D:\Turning_page_clock\web\icons\Icon-192.png": 192,
    r"D:\Turning_page_clock\web\icons\Icon-512.png": 512,
}

img = Image.open(src).convert("RGBA")
w, h = img.size
side = min(w, h)
left = (w - side) // 2
top = (h - side) // 2
img = img.crop((left, top, left + side, top + side))

for path, size in icons.items():
    os.makedirs(os.path.dirname(path), exist_ok=True)
    img.resize((size, size), Image.LANCZOS).save(path)
    print(f"OK {size}x{size} -> {path}")

print("Done.")
