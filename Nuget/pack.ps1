$root = (split-path -parent $MyInvocation.MyCommand.Definition) + '\..'
$version = [System.Reflection.Assembly]::LoadFile("$root\Src\Couchbase.Linq\bin\Release\Couchbase.Linq.dll").GetName().Version
$versionStr = "{0}.{1}.{2}" -f ($version.Major, $version.Minor, $version.Build)

Write-Host "Setting .nuspec version tag to $versionStr"

$content = (Get-Content $root\NuGet\Couchbase.Linq.nuspec) 
$content = $content -replace '\$version\$',$versionStr

$content | Out-File $root\nuget\Couchbase.Linq.compiled.nuspec

#& $root\NuGet\NuGet.exe pack $root\nuget\MarkdownLog.compiled.nuspec
NuGet.exe pack $root\nuget\Couchbase.Linq.compiled.nuspec
