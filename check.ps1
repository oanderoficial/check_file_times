$pasta = "\\SERVERBR001\OSGT_CLOUD\MBBRAS "
$log = "C:\Zabbix\Scripts\monitoramento_share\MBBRAS.log"
$limite = (Get-Date).AddMinutes(-30)

$tempo = 0 

Get-ChildItem -Path $pasta | ForEach-Object {
    if ($_.CreationTime -lt $limite) {
        $tempo = 1 
    }
}

Set-Content -Path $log -Value $tempo