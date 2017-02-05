.\packages\OpenCover.4.6.519\tools\OpenCover.Console.exe  `
-register:user `
"-target:C:\projects\$env:APPVEYOR_PROJECT_NAME\packages\xunit.runner.console.2.1.0\tools\xunit.console.exe" `
"-targetargs:UnitTests\UnitTests.Delta.Units\bin\$env:CONFIGURATION\UnitTests.Delta.Units.dll UnitTests\UnitTests.Delta.Units.Globalization\bin\$env:CONFIGURATION\UnitTests.Delta.Units.Globalization.dll -appveyor -noshadow" `
"-filter:-[UnitTests*]*" `
"-output:opencoverCoverage.xml"

$coveralls = (Resolve-Path "packages/coveralls.net.*/tools/csmacnz.coveralls.exe").ToString()

& $coveralls --opencover -i opencoverCoverage.xml `
--repoToken $env:COVERALLS_REPO_TOKEN `
--commitId $env:APPVEYOR_REPO_COMMIT `
--commitBranch $env:APPVEYOR_REPO_BRANCH `
--commitAuthor $env:APPVEYOR_REPO_COMMIT_AUTHOR `
--commitEmail $env:APPVEYOR_REPO_COMMIT_AUTHOR_EMAIL `
--commitMessage $env:APPVEYOR_REPO_COMMIT_MESSAGE `
--jobId $env:APPVEYOR_JOB_ID