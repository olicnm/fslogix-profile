import-module ntfssecurity

'prüfen, ob Datei im Pfad liegt, Ausgabe True/False'
$list=Test-Path C:\Software\sid2.csv

'$P = import-csv -path C:\Software\sid2.csv
$P | Format-Table'

if ($list) {
Import-CSV -Path C:\Software\sid2.csv -Header Name, SID | 
foreach {
    $Sid= $_.SID 
    $name= $_.Name
    $ordnername= "E:\temp" + "\" +$sid + "_" +$name
    New-Item -Path $ordnername -itemType "directory" -force

    Add-NTFSAccess -path $ordnername ` -account 'CNM\' +$name ` -AccessRights FullControl

    }
}
