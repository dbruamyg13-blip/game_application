$ErrorActionPreference = 'Stop'
$taskNode = (Get-Command node -ErrorAction SilentlyContinue).Source
if (-not $taskNode) {
  $taskNode = Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe'
}
if (-not (Test-Path -LiteralPath $taskNode)) { throw 'Node.js가 필요합니다. https://nodejs.org 에서 설치한 후 다시 실행하세요.' }
& $taskNode (Join-Path $PSScriptRoot 'application-server.cjs') --open-admin
