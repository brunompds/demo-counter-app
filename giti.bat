SET message = "%date:~-4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%%time:~6,2%%username%_%cd%"
git add .
IF NOT [%1]=="" message=%1
git commit -m $message
:message:~-4%%date:~
git push -u origin main
