import { BrowserWindow, app, ipcMain } from 'electron'
// import path from 'path'
// import path from 'node:path'
import path from 'path'
// import { fileURLToPath } from 'node:url'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

console.log('Electron app starting...')

const createWindow = () => {
	const win = new BrowserWindow({
		width: 800,
		height: 600,
		webPreferences: {
			preload: path.join(__dirname, 'preload.js'),
			// preload: './preload.js',
		},
	})

	console.log(path.join(__dirname, 'preload.js'))

	win.loadFile('./index.html')

	win.webContents.openDevTools()
}

app.whenReady().then(() => {
	ipcMain.handle('ping', () => 'pong')
	createWindow()

	app.on('activate', () => {
		if (BrowserWindow.getAllWindows().length === 0) createWindow()
	})
})

app.on('window-all-closed', () => {
	if (process.platform !== 'darwin') app.quit()
})
