$DIST="dist"
$DATE=Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$CYAN = [ConsoleColor]::Cyan
$GREEN = [ConsoleColor]::Green
$RED = [ConsoleColor]::Red

Write-Host "Deploy to ./$DIST`n" -ForegroundColor $CYAN

Write-Host "Run build script..." -ForegroundColor $GREEN
Write-Host "> ./tools/build.ps1"
./tools/build.ps1

if ((git status -s).Length -eq 0) {
  Write-Host "Modify gitignore list temporarily..." -ForegroundColor $GREEN

  if ($env:OSTYPE -eq "darwin") {
    Write-Host "> sed -i '' '/$DIST/d' ./.gitignore"
    sed -i '' "/$DIST/d" ./.gitignore
  }
  else {
    Write-Host "> sed -i '/$DIST/d' ./.gitignore"
    sed -i "/$DIST/d" ./.gitignore
  }

  Write-Host "`nStage and commit the all files..." -ForegroundColor $GREEN
  Write-Host "> git add ."
  git add .
  Write-Host "> git commit -m `"dist: $DATE`""
  git commit -m "dist: $DATE"

  Write-Host "`nUse subtree push to gh-pages branch..." -ForegroundColor $GREEN
  Write-Host "> cd git push origin `git subtree split --prefix $DIST master`:gh-pages --force"
  git subtree split --prefix dist master
  git subtree push --prefix=$DIST origin gh-pages

  Write-Host "`nReset the temporary changes..."
  Write-Host "> git reset HEAD~"
  git reset HEAD~
  Write-Host "> git checkout .gitignore"
  git checkout .gitignore
}
else {
  Write-Host "`nFailed to deploy: Need clean working directory to deploy.`n" -ForegroundColor $RED
  exit 1
}

Write-Host "`nDone!" -ForegroundColor $CYAN