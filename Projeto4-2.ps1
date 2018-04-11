# Projeto de Bloco - Teste 4 - atividade 2
# Criação de Automatizada de Usuários

Clear-Host

#ADM
    $path_user = "OU=ADM, DC=alfredosimoes, DC=com"  
       
    # Quantidade de Usuários a serem criados
    $QTD  = 3 

    #Automatiza            
            for ($i = 1; $i -le $QTD; $i++)
            {                   
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="ADM_"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              
              $model_user = "model-user_ADM"
              New-ADUser $name_user -Instance $model_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Verbose
              
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes_ADM"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }


#COM
    $path_user = "OU=COM, DC=alfredosimoes, DC=com"  
       
    # Quantidade de Usuários a serem criados
    $QTD  = 3 

    #Automatiza            
            for ($i = 1; $i -le $QTD; $i++)
            {                   
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="COM_"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              
              $model_user = "model-user_COM"
              New-ADUser $name_user -Instance $model_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Verbose
              
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes_COM"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }


#DIR
    $path_user = "OU=DIR, DC=alfredosimoes, DC=com"  
       
    # Quantidade de Usuários a serem criados
    $QTD  = 3 

    #Automatiza            
            for ($i = 1; $i -le $QTD; $i++)
            {                   
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="DIR_"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              
              $model_user = "model-user_DIR"
              New-ADUser $name_user -Instance $model_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Verbose
              
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes_DIR"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }


#RHG
    $path_user = "OU=RHG, DC=alfredosimoes, DC=com"  
       
    # Quantidade de Usuários a serem criados
    $QTD  = 3 

    #Automatiza            
            for ($i = 1; $i -le $QTD; $i++)
            {                   
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="RHG_"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              
              $model_user = "model-user_RHG"
              New-ADUser $name_user -Instance $model_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Verbose
              
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes_RHG"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }

#TIC
    $path_user = "OU=TIC, DC=alfredosimoes, DC=com"  
       
    # Quantidade de Usuários a serem criados
    $QTD  = 3 

    #Automatiza            
            for ($i = 1; $i -le $QTD; $i++)
            {                   
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="TIC_"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              
              $model_user = "model-user_TIC"
              New-ADUser $name_user -Instance $model_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Verbose
              
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes_TIC"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }