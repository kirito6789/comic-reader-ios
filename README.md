# 漫画 iOS 自用版

这是一个最小的原生 iOS 壳，使用 `WKWebView` 打开：

```text
https://8.133.243.109/
```

这个方案使用免费 Apple ID 和 Sideloadly，自签安装到自己的 iPhone。
不需要购买 99 美元/年的 Apple Developer Program。

## 免费签名的限制

- App 需要用免费 Apple ID 在本机签名。
- 免费签名通常约 7 天后失效，需要重新安装。
- 同一免费 Apple ID 同时只能保留少量自签 App。
- 这是个人自用安装，不是 App Store 或 TestFlight 发布。

## 第一步：生成未签名 IPA

1. 在 GitHub 新建一个 **Public** 仓库。公开仓库的 Actions 构建不消耗付费额度。
2. 把本目录中的**内容**上传到仓库根目录。不要只上传 `ios-sideload` 文件夹，否则 GitHub Actions 找不到工作流。
3. 上传后进入仓库的 `Actions` 页面。
4. 打开 `Build unsigned IPA`，点击 `Run workflow`。
5. 等构建完成后，在该次运行的 `Artifacts` 中下载 `ComicReader-unsigned`。
6. 解压后得到 `ComicReader-unsigned.ipa`。

仓库中的工作流带有 `workflow_dispatch`，也可以在每次推送到 `main` 时自动构建。

## 第二步：在 Windows 上用 Sideloadly 安装

1. 从官网下载并安装 Sideloadly：<https://sideloadly.io/>。
2. 如果 Windows 缺少苹果驱动，按 Sideloadly 提示安装 Apple 官网版本的 iTunes 和 iCloud。
3. 用数据线连接 iPhone，信任这台电脑。
4. 把 `ComicReader-unsigned.ipa` 拖入 Sideloadly。
5. 输入自己的免费 Apple ID。按 Sideloadly 提示处理双重验证和专用密码。
6. 点击 `Start`，等待签名和安装完成。

## 第三步：在 iPhone 上信任 App

1. 打开 `设置 > 隐私与安全性 > 开发者模式`，开启开发者模式并按提示重启。
2. 打开 `设置 > 通用 > VPN 与设备管理`，信任自己的开发者证书。
3. 回到桌面打开“漫画”。

如果打开时提示不受信任，通常是证书还没信任；如果使用约 7 天后打开失败，重新用 Sideloadly 安装一次即可。

## 文件说明

- `project.yml`：XcodeGen 工程配置。
- `ComicApp/`：原生 WebView 壳源码。
- `.github/workflows/build-unsigned-ipa.yml`：GitHub 免费 macOS 运行器构建未签名 IPA。
