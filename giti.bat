
git add .
IF [%1]==[] ( 
    git commit -m "%date:~-4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%%time:~6,2%%username%_%cd%"
) ELSE (
    git commit -m "%1"
)
git push -u origin main
