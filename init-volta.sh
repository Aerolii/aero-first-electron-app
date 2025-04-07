#!/bin/bash

# 检查 Volta 是否已安装
if ! command -v volta &> /dev/null
then
    echo "Volta 未安装，请先安装 Volta"
    exit 1
fi

# 你可以把下面这两个版本改成你自己项目想用的
NODE_VERSION="22"
NPM_VERSION="latest"

echo "🚀 创建新 Node 项目并初始化 Volta 版本..."

# 初始化项目（如果没有 package.json）
if [ ! -f "package.json" ]; then
  echo "{}" > package.json
  echo "📦 创建空 package.json"
fi


# 安装并锁定 Node 版本为 22
echo "正在通过 Volta 安装 Node 22..."

# 安装并设置 Node 和 npm
volta install node@$NODE_VERSION

# 显示当前 Node 版本
echo "当前 Node 版本：$(node -v)"

# 绑定到项目
volta pin node@$NODE_VERSION

# 安装 pnpm 以保持一致的包管理工具
echo "正在通过 Volta 安装 pnpm..."
volta install npm@$NPM_VERSION

volta pin npm@$NPM_VERSION

# 显示 pnpm 版本
echo "当前 pnpm 版本：$(pnpm -v)"

echo "✅ Volta 配置完成！"
echo "📌 当前项目绑定的版本如下："
cat package.json | grep '"volta"' -A 4
echo "🔗 你可以使用 'volta list' 命令查看当前项目绑定的版本"






