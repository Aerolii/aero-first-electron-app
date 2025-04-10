// 预加载脚本
// 在主进程中执行

// import { contextBridge, ipcRenderer } from 'electron'
const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('versions', {
	node: () => process.versions.node,
	chrome: () => process.versions.chrome,
	electron: () => process.versions.electron,
	ping: () => ipcRenderer.invoke('ping'),
})

console.log('versions:', window.versions)
