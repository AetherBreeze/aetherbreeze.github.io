$DIST="./dist"
$PUBLIC="./app/public"
$PUBLIC_ARTICLE="./app/public/article"
$PUBLIC_WORK="./app/public/work"

$CYAN = [ConsoleColor]::Cyan
$GREEN = [ConsoleColor]::Green

Write-Host "Start build:`n" -ForegroundColor $CYAN

Write-Host "Create ${PUBLIC} directory if it does not exist..." -ForegroundColor $GREEN
Write-Host "> [-d ${PUBLIC} ] || mkdir ${PUBLIC}"
if (!(Test-Path $PUBLIC)) {mkdir $PUBLIC > $null}
Write-Host "> [-d ${PUBLIC_ARTICLE} ] || mkdir ${PUBLIC_ARTICLE}"
if (!(Test-Path $PUBLIC_ARTICLE)) {mkdir $PUBLIC_ARTICLE > $null}
Write-Host "> [-d ${PUBLIC_WORK} ] || mkdir ${PUBLIC_WORK}`n"
if (!(Test-Path $PUBLIC_WORK)) {mkdir $PUBLIC_WORK > $null}

Write-Host "Create ${DIST} directory if it does not exist..." -ForegroundColor $GREEN
Write-Host "> [-d ${DIST} ] || mkdir ${DIST}`n"
if (!(Test-Path $DIST)) {mkdir $DIST}

Write-Host "`nPublish the templates..." -ForegroundColor $GREEN
Write-Host "> ts-node ./tools/publish.ts page"
./node_modules/.bin/ts-node.ps1 ./tools/publish.ts page
Write-Host "> ts-node ./tools/publish.ts article"
./node_modules/.bin/ts-node.ps1 ./tools/publish.ts article
Write-Host "> ts-node ./tools/publish.ts work"
./node_modules/.bin/ts-node.ps1 ./tools/publish.ts work

Write-Host "`nReset distribution directory..." -ForegroundColor $GREEN
Write-Host "> rm -r ${DIST}/*"
Remove-Item $DIST/* -Recurse -Force

Write-Host "> mkdir ${DIST}/styles`n"
mkdir $DIST/styles > $null
Write-Host "> mkdir ${DIST}/assets`n"
mkdir $DIST/assets > $null
Write-Host "> mkdir ${DIST}/images`n"
mkdir $DIST/images > $null

Write-Host "`nCopy files to distribution directory..." -ForegroundColor $GREEN
Write-Host "> cp -r ./app/static/* ${DIST}/"
Copy-Item ./app/static/* $DIST/ -Recurse -Force
Write-Host "> cp -r ./app/public/* ${DIST}/"
Copy-Item ./app/public/* $DIST/ -Recurse -Force
Write-Host "> cp -r ./app/styles/* ${DIST}/styles/"
Copy-Item ./app/styles/* $DIST/styles/ -Recurse -Force
Write-Host "> cp -r ./app/assets/* ${DIST}/assets/"
Copy-Item ./app/assets/* $DIST/assets/ -Recurse -Force
Write-Host "> cp -r ./images/* ${DIST}/images/"
Copy-Item ./images/* $DIST/images/ -Recurse -Force

Write-Host "`nMinify css files..." -ForegroundColor $GREEN
./node_modules/.bin/cleancss.ps1 --batch --batch-suffix `"`" ./dist/styles/*.css

Write-Host "`nMinify html files..." -ForegroundColor $GREEN
./node_modules/.bin/html-minifier.ps1 --input-dir $DIST --output-dir $DIST --file-ext html --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype

if (Test-Path "./CNAME") {
    Write-Host "> Found a CNAME File! Bringing the CNAME over"
    Copy-Item ./CNAME $DIST/CNAME -Recurse -Force
}

Write-Host "`nDone!" -ForegroundColor $CYAN