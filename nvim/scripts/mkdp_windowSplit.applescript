set Height to 1120
set Width to 1792
set bar to 24
set halfHeight to Height / 2
set halfWidth to Width / 2

-- 检查应用是否在全屏状态
tell application "iTerm" to set screenSize to bounds of front window
set rightX to item 3 of screenSize
if rightX is equal to Width then
	-- 关闭iTerm的全屏状态
	tell application "System Events"
		tell process "iTerm2"
			click (first menu item whose name is "Toggle Full Screen") of menu "View" of menu bar 1
		end tell
	end tell
    delay(0.5)
end if
-- 打开Chrome并放置在右侧
tell application "Google Chrome"
	make new window
	set the bounds of the first window to {halfWidth, bar, Width, Height}
end tell
-- 调整iTerm大小并放置到左侧
tell application "iTerm"
	activate 
	set the bounds of the first window to {0, bar, halfWidth, Height}
    delay(0.5)
end tell




