@echo off
chcp 65001 >nul
cd /d "D:\blog"
echo ============================================
echo    博客 Grenzgang - 一键部署
echo    (git add/commit/push -> GitHub Actions 自动构建上线)
echo ============================================
echo.
echo --- 当前改动 ---
git status -s
echo.
set "msg=update %date% %time%"
set /p "msg=输入提交说明(直接回车用默认时间戳): "
echo.
echo [1/3] git add -A ...
git add -A || goto :err
echo.
echo [2/3] git commit ...
git commit -m "%msg%"
echo.
echo [3/3] git push origin master ...
git push origin master || goto :err
echo.
echo ============================================
echo  已推送!GitHub Actions 正在构建部署,
echo  约 1-2 分钟后 justinzyc271828-sys.github.io 上线更新。
echo  (想看构建进度:GitHub 仓库的 Actions 页)
echo ============================================
goto :end
:err
echo.
echo *** 出错了 ***
echo  常见原因:1) 网络/VPN 没开  2) 没有改动可提交(commit 会提示 nothing to commit)
echo  3) 远程有别处的新提交,需要先 git pull
:end
echo.
pause
