# Check file times 

<p> Verifica se há algum arquivo criado há mais de 30 minutos em uma pasta de rede específica <strong> ($pasta) </strong> e registra o valor em um arquivo de <strong> ($log) </strong>.</p>
<p>Se algum arquivo com mais de 30 minutos for encontrado, o valor 1 é gravado no log, indicando a existência de um arquivo "antigo". Caso contrário, o valor permanece 0.</p>

<br> 

```ps1
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
```
