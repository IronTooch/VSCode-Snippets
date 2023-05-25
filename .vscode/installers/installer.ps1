$CurrentUser = [System.String](Get-ChildItem Env:\USERNAME).Value
$SnippetDestPath = [System.String]"C:\Users\$CurrentUser\AppData\Roaming\Code\User\snippets"

Write-Host "Installing All Snippets..."
# Get all files from current folder with snippet extension
$Snippets = Get-ChildItem -Path .\ -Recurse | Where-Object {$_.Name -like '*.code-snippets'}


foreach ($Snippet in $Snippets)
{
    Write-Host -NoNewline "Installing $Snippet... "
    Copy-Item -Path $Snippet.FullName -Destination $SnippetDestPath
    Write-Host "Complete"

}
Write-Host "Install Complete."
