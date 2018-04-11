#WSUS

Clear-Host

    #Instalação WSUS
        #DB WID
            Install-WindowsFeature -Name UpdateServices -IncludeManagementTools -Verbose
        
        # --------------------- ou --------------------- #

        #DB SQL
            #Install-WindowsFeature -Name UpdateServices-Service, UpdateService-DB -IncludeManagementTools -Verbos  
                
        #Variáveis 
            $PathData = "C:\WSUS" 
            $PathTools = "C:\Program Files\Update Services\Tools"
            $PathSnapin = "C:\Program Files\Update Services\AdministrationSnapin"
            $SQLinstance = “DC1\SQL2008”

        #Criação do Diretório WSU           
           
            New-Item -Path $PathData -ItemType "directory" -Verbose               

        #Configuração do Diretório

            #WID
                Set-Location $PathTools
                .\wsusutil postinstall content_dir =$PathData #linha de comando

            # --------------------- ou --------------------- #
        
            #SQL
                #Set-Location $PathTools
                #.\wsusutil postinstall SQL_INSTANCE_NAME=$SQLinstance content_dir=$PathData #linha de comando

#Configurar WSUS
    Set-Location $PathSnapin
    .\wsus.msc