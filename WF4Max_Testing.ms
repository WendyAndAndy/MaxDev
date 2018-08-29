/*
	C# + VS + WindowsForm for 3dsMax tools GUI
	WendyAndAndy @ 2018.08.29, 184327932@qq.com, iJasonLee@WeChat, kingmax_res@163.com
*/

/* 
	Hot Reload C# DLL 
*/
file = @"D:\git\WendyAndAndy\MaxDev\WF4Max\bin\Release\WF4Max.dll"
dll = (dotNetClass "System.IO.File").ReadAllBytes file
asm = (dotNetClass "System.Reflection.Assembly").Load dll


(dotNetClass "System.GC").Collect()
gc()
-- GUI
global gWin
try
(
	gWin.Close()
)
catch()


gWin = dotNetObject "WF4Max.MyWindow"
show gWin


-- the functions maybe split to a lib
-- add event handler
fn btnBox_Click sender e = 
(
	print(sender.Text)
	
	box name:(uniqueName "myBox_") wireColor:(random white black)
)
dotNet.AddEventHandler gWin.btnBox "Click" btnBox_Click
dotNet.setLifeTimeControl gWin.btnBox #dotnet

fn btnTeapot_Click sender e = 
(
	print(sender.Text)
	
	teapot()
)
dotNet.AddEventHandler gWin.btnTeapot "Click" btnTeapot_Click
dotNet.setLifeTimeControl gWin.btnTeapot #dotnet


fn getColor = 
(
	f = (colorMan.getColor #text as color) * 255
	b = (colorMan.getColor #background as color) * 255
	cls = dotNetClass "System.Drawing.Color"
	fColor = cls.FromArgb f.r f.g f.b
	bColor = cls.FromArgb b.r b.g b.b
	#(fColor, bColor)
)

fn MyWindow_Load sender e =
(	
	fb = getColor()
	--gWin.ForeColor = fb[1]
	gWin.BackColor = fb[2]
	--gWin.btnBox.ForeColor = fb[1]
	gWin.btnBox.BackColor = fb[2]
	--gWin.btnTeapot.ForeColor = fb[1]
	gWin.btnTeapot.BackColor = fb[2]
	
	gWin.groupBox1.ForeColor = fb[1]
	gWin.groupBox1.BackColor = fb[2]
	gWin.txtStatus.ForeColor = fb[1]
	gWin.txtStatus.BackColor = fb[2]
	gWin.pictureBox1.ForeColor = fb[1]
	gWin.pictureBox1.BackColor = fb[2]
	gWin.statusStrip1.ForeColor = fb[1]
	gWin.statusStrip1.BackColor = fb[2]
)
dotNet.addEventHandler gWin "Load" MyWindow_Load


/*
	show or showDialog
*/
-- gWin.show()
-- gWin.ShowDialog()
ptr = dotNetObject "System.IntPtr" (windows.getMaxHWND())
hwnd = dotNetObject "MaxCustomControls.Win32HandleWrapper" ptr
gWin.show(hwnd)

	
