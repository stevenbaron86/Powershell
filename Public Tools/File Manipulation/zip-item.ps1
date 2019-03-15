    #requires 7zip 
    #original code by u/ascension, cleaned up and generalized for tool use.


    #working directory
    $directory =

    #7z.exe location
    $7zpath = 
    
    
    get-childitem $directory | where-object {} | foreach {
        $filetozip = $_.Name
        $ziptarget = [IO.Path]::GetFileNameWithoutExtension($filetozip) + ".zip"

        $7zpath\7z.exe a -tzip $directory\$ziptarget $directory\$filetozip

        # Remove the original file only if 7zip was successful
        if ($?) {
            remove-item $directory\$filetozip
        }

    }
