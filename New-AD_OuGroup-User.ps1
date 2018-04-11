# Scrip - Teste 8B - atividade 1
Clear-Host

# Cria as Unidade Organizacionais
    #  RJ
        $name_OU = "RJ" 
        New-ADOrganizationalUnit $name_OU -ProtectedFromAccidentalDeletion $true
    # SP
        $name_OU = "SP" 
        New-ADOrganizationalUnit $name_OU -ProtectedFromAccidentalDeletion $true
    # MG
        $name_OU = "MG" 
        New-ADOrganizationalUnit $name_OU -ProtectedFromAccidentalDeletion $true


# Cria os Grupos
    # RJ
        $name_Group = "G_AlfredoSimoes-RJ"
        $Path_Group = "OU=RJ, DC=contoso, DC=com"
        New-ADGroup $name_Group -DisplayName $name_Group -SamAccountName $name_Group -GroupScope Global -GroupCategory Security -Path $Path_Group
    # SP
        $name_Group  = "G_AlfredoSimoes-SP"
        $Path_Group = "OU=SP, DC=contoso, DC=com"
        New-ADGroup $name_Group -DisplayName $name_Group -SamAccountName $name_Group -GroupScope Global -GroupCategory Security -Path $Path_Group
    # MG
        $name_Group = "G_AlfredoSimoes-MG"
        $Path_Group = "OU=MG, DC=contoso, DC=com"
        New-ADGroup $name_Group -DisplayName $name_Group -SamAccountName $name_Group -GroupScope Global -GroupCategory Security -Path $Path_Group    


# Cria Usuários
    # RJ
        $city = "Rio de Janeiro"
        $path_user = "OU=RJ, DC=contoso, DC=com"  
       
        # Quantidade de Usuários a serem criados
            $QTD  = 50 

        #Automatiza
            $QTD = $QTD+1
            for ($i = 1; $i -lt $QTD; $i++)
            { 
                    # Formata o Nome (caracteres numéricos - D3)
                        $name_user="t"+"{0:D3}" -f $i 

                    # Formata o Password 
                        $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force       
              New-ADUser $name_user -Enabled 1 -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -City $city       
              # Adiciona Usuário ao Grupo
                  $name_Group = "G_AlfredoSimoes-RJ"
                  Add-ADGroupMember $name_Group -Members $name_user       
            }