# Get the user's download folder path
$downloadFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile), "Downloads")

# Define the temp file name and Zygor URL
$tempFileName = "zygor-temp.zip"
$zygorUrl = "https://github.com/tieonlinux/ZygorDownloader/releases/latest/download/ZygorGuidesViewer.zip"

# Function to calculate MD5 hash of a file (same as before)
Function Get-FileMD5Hash($filePath) {
    $md5 = [System.Security.Cryptography.MD5]::Create()
    $stream = [System.IO.File]::OpenRead($filePath)
    $hash = [BitConverter]::ToString($md5.ComputeHash($stream)).Replace("-", "").ToLower()
    $stream.Close()
    return $hash
}

# Check if the original Zygor file exists
$originalFilePath = [System.IO.Path]::Combine($downloadFolder, "ZygorGuidesViewer.zip")
$tempFilePath = [System.IO.Path]::Combine($downloadFolder, $tempFileName)

If (Test-Path -Path $originalFilePath) {
    # Download the new Zygor file as 'zygor-temp' and show progress
    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")
    $webClient.DownloadFile($zygorUrl, $tempFilePath)
    
    # Calculate MD5 hashes of both files
    $originalMD5 = Get-FileMD5Hash -filePath $originalFilePath
    $tempMD5 = Get-FileMD5Hash -filePath $tempFilePath
    
    If ($originalMD5 -eq $tempMD5) {
        # MD5 hashes match, delete the 'zygor-temp' file
        Remove-Item -Path $tempFilePath -Force
        Write-Host "The Zygor files match. 'zygor-temp' deleted."
    }
    Else {
        # MD5 hashes don't match, replace the original file with 'zygor-temp'
        Remove-Item -Path $originalFilePath -Force
        Rename-Item -Path $tempFilePath -NewName "ZygorGuidesViewer.zip"
        Write-Host "The Zygor files don't match. Original replaced with 'zygor-temp'."
    }
}
Else {
    # Original Zygor file doesn't exist, download it directly and show progress
    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")
    $webClient.DownloadFile($zygorUrl, $originalFilePath)
    Write-Host "Original Zygor file downloaded."
}
