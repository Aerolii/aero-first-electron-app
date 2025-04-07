// 预加载脚本
// 在主进程中执行

import { contextBridge } from 'electron'

contextBridge.exposeInMainWorld('versions', {
	node: () => process.versions.node,
	chrome: () => process.versions.chrome,
	electron: () => process.versions.electron,
})
