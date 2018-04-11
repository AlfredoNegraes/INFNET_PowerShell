#DFS
    Clear-Host

    #Variáveis
        $ShareName = "DocsCorp-Alfredo"
        $Folder = "C:\$ShareName"
        $DFSName = "\\$env:USERDOMAIN\$ShareName"

    #Instala DFS NameSpace e DFS REplication
        #Informa sobre as Features
            Get-WindowsFeature -Name FS-DFS-NameSpace, FS-DFS-Replication | `            Select-Object DisplayName, InstallState, Installed            Write-Host "`r"        #Variável - Verificadora de Feature DFS Namespaces instalada            $VerifNamesapce = [System.Convert]::ToBoolean((Get-WindowsFeature -name FS-DFS-NameSpace |`                                                            Select-Object -ExpandProperty Installed ))        #Variável - Verificadora de Feature DFS Replication instalada            $VerifREplication = [System.Convert]::ToBoolean((Get-WindowsFeature -name FS-DFS-Replication |`                                                            Select-Object -ExpandProperty Installed ))        #Condição de Instalação            if ($VerifNamesapce -eq $false)
            {
                Write-Host "1. Instalação do DFS Namespaces"
                Install-WindowsFeature -name FS-DFS-NameSpace -IncludeManagementTools -Verbose
                Write-Host "`r"
            }
            if ($VerifREplication -eq $false)
            {
                Write-Host "2. Instalação do DFS Replication"
                Install-WindowsFeature -name FS-DFS-Replication -IncludeManagementTools -Verbose
                Write-Host "`r"
            }

        #Cria Diretório
            #Variável - Verificadora de Diretório
                $VerifFolder = [System.Convert]::ToBoolean((Test-Path -Path $Folder))
            #Condição de Criação
                if ($VerifFolder -eq $false)
                {
                    Write-Host "3. Criação de Diretório"
                    New-Item -Path $Folder -ItemType "directory" -Verbose
                    Write-Host "`r"
                }

        #Cria Compartilhamento
            #Variável - Verificadora de Compartilhamento de Diretório
                $VerifShare = (Get-SmbShare | Select-Object -ExpandProperty Path `                                           | Where-Object -FilterScript {$_ -contains $Folder})            #Condição de Criação                if ($VerifShare -ne $Folder)
                {
                    Write-Host "4. Criação de Compartilhamento"
                    New-SmbShare -name $ShareName -Path $Folder `                                 -FullAccess Everyone `                                 -Description "DFS share" `                                 -Verbose
                    Write-Host "`r"
                }

        #Cria DFS-N
            #Variável - Verificadora de DFS-N
                $VerifDFS = (Get-SmbShare | Select-Object -ExpandProperty Path `                                          | Where-Object -FilterScript {$_ -contains $DFSName})
            #Condição de Criação                
                if ($VerifDFS -ne $DFSName)
                {
                    Write-Host "5. Criação do DFS-N"
                    new-DfsnRoot -TargetPath \\$env:COMPUTERNAME\$ShareName `
                                 -Path \\$env:USERDNSDOMAIN\$ShareName `                                 -Type DomainV2 `
                                 -Descriptio "Central source for Publicly visible files" `
                                 -Verbose
                    Write-Host "`r"
                }
        #Executar DFS Management
            Write-Host "6. Confirgurar DFS-N"
            Write-Host "       Abrindo DFS Management..."
            cd $env:windir\system32
            dfsmgmt.msc
            Write-Host "`r"
