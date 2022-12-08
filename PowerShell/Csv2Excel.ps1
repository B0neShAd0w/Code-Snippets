function CSV2Excel {
    [CmdLetBinding ()]
    Param (
        [Parameter (Mandatory = $true)]
        [String] $InputDirectory,
        [Parameter (Mandatory = $true)]
        [String] $OutputDirectory,
        [Parameter (Mandatory = $true)]
        [String] $FileName
    )
    
    $xl = New-Object -ComObject Excel.Application
    $xl.Visible = $false
    $wb = $xl.Workbooks.Add()

    Get-ChildItem $InputDirectory\*.csv | % {
        if (Import-Csv $_.FullName) {
            $csvBook = $xl.Workbooks.Open($_.FullName)
            $csvBook.ActiveSheet.Copy($wb.Worksheets($wb.Worksheets.Count))
            $csvBook.Close()
            Write-Output "`nImporting $($_.FullName)"
        }
    }

    try 
    {
        $wb.Sheets.Item('sheet1').Delete()
        Write-Output "`nDeleting unused Sheet1`n"
    }
    catch
    {
        #OnError
    }

    try
    {
        $wb.SaveAs("$OutputDirectory\$FileName.xlsx")
        $wb.Close()
        $xl.Quit()
        Write-Output "Saving Excel Workbook: $OutputDirectory\$FileName.xlsx`n"
        Write-Output "Closing application - please be patient...`n"

    $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb); 
    $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl); 
    [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()
    }
    catch
    {
        Write-Warning "File name already exists! - EXITING...`n"
        $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb); 
        $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl); 
        [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()
    }  
}

# Clear Console
Clear-Host

# Run
CSV2Excel -InputDirectory "C:\Temp" -OutputDirectory "C:\Temp" -FileName "Test-Excel"
