#BranchCache

    #Instalar BranchCache
        Write-Host "1. Instalar BranchCache:"
        Install-WindowsFeature FS-BranchCache, BranchCache -IncludeAllSubFeature -IncludeManagementTools
        Write-Host "`r"
    
    #Habilitar BranchCache - Hosted Mode
        Write-Host "2. Habilitar BranchCache - Hosted Mode:"
        Enable-BCHostedServer -Verbose
        Write-Host "`r"

    #Criar Diretórios
        Write-Host "3. Criar Diretórios:"
        New-Item -Path "C:\Share" -ItemType "directory" -Verbose
        New-Item -Path "C:\BranchCache" -ItemType "directory" -Verbose
        Write-Host "`r"

    #Criar Compartilhamento
        Write-Host "4. Criar Compartilhamento:"
        New-SmbShare -name Share -Path "C:\Share" -FullAccess Everyone -Description "BranchCache share" -Verbose
        Write-Host "`r"
            
    #Gerar informação de Conteudo BranchCache
        Write-Host "5. Gerar informação de Conteudo BranchCache:"
        Publish-BCFileContent -Path "C:\Share" -StageData -Verbose
        Write-Host "`r"
         
    #Exportar informação de Conteudo BranchCache
        Write-Host "6.Exportar informação de Conteudo BranchCache:"
        Export-BCCachePackage  -Destination "C:\BranchCache" -Verbose
        Write-Host "`r"
