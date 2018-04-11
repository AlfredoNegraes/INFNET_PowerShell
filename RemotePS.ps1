# Ativa o Gerenciamento Remoto PS
# Enable-PSRemoting

Clear-Host

# Variáveis
$ComputerHost = "DC"
$ComputerGuest = "SRV"


# Teste de Conexão
#Test-Connection $ComputerHost
#Test-Connection $ComputerGuest


# Sessão Remota Não-Persistente/Resiliente (auto open/execution/close)


#Invoke-Command -ComputerName $ComputerHost -ScriptBlock {

#Write-Host "Data: " (Get-Date) " | " "Computador: " (hostname) " | " "Usuário: "(whoami)
#ipconfig

#}


# Sessão Remota Persistente/Resiliente
New-PSSession -name "PsSession_$ComputerHost" -ComputerName $ComputerHost
Get-PSSession

Connect-PSSession -name "PsSession_$ComputerHost"
Get-PSSession

Disconnect-PSSession -name "PsSession_$ComputerHost"
Get-PSSession

Remove-PSSession -name "PsSession_$ComputerHost"
Get-PSSession