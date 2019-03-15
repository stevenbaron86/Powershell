$ExcelWB = new-object -comobject excel.application
$source = ""
$Workbook = $ExcelWB.Workbooks.Open($source) 
$Workbook.SaveAs("",6)
$Workbook.Close($false)
$ExcelWB.quit()