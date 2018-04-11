# WDS
    Clear-Host

    #Variáveis
        $ImageGroup = "DataCenter_2012"
        $PathBoot = "D:\sources\boot.wim"
        $PathInstall = "D:\sources\install.wim"
        $ImageName = "Windows Server 2012 R2 SERVERDATACENTER"
    
    #Criação de Grupo em Imagens de Instalação
              New-WdsInstallImageGroup -Name $ImageGroup -Verbose -Debug
   
    #Importação de Imagem de Instalação
              Import-WdsInstallImage -Path $PathInstall -ImageGroup $ImageGroup -ImageName $ImageName -Verbose -Debug
    
    #Importação de Imagem de Boot
              Import-WdsBootImage -Path $PathBoot -Debug