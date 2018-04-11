# Scrip Teste 8B - Atividade 2

Clear-Host

# Cria Usuário-Modelo
    $name_user = "VendasTemplate"
    $path_user = "OU=RJ, DC=contoso, DC=com"
    $organization = "Contoso" 
              
    New-ADUser $name_user -Enabled 0 -Organization $organization -DisplayName $name_user -Surname $name_user -SamAccountName $name_user -Path $path_user -Verbose

# Adiciona Usuário ao Grupo
    $name_Group = "G_AlfredoSimoes-RJ"
    Add-ADGroupMember $name_Group -Members $name_user -Verbose

