
# *** ATENCÃO ***
# Estrutura de diretórios:
#	C:\Scripts\Import-CSV\FUNCIONARIOS.ps1
#	C:\Scripts\Import-CSV\FUNCIONARIOS.csv

Clear-Host

# variaveis
    # Para Alterar
    $SeuNome = "AlfredoSimoes"
    $OUs = @("RJ", "SP", "MG")
    $FQDN = @("contoso","com") 
        
        #Planilha
        $diretorio = "C:\Scripts\Import-CSV"
        $arquivo = "FUNCIONARIOS"

        #Ativar ou Desativar
        $CriaOU = $false       #  $true  ->  ativa criação  |   $false ->  desativa criação
        $CriaGrupo = $false    #  $true  ->  ativa criação  |   $false ->  desativa criação
        $CriaUsuario = $true  #  $true  ->  ativa criação  |   $false ->  desativa criação
    
    # Para Não Alterar
    $cont = ($OUs.Count)-1  
         

 # Cria OUs   
    if ($CriaOU -eq $true)
    {        
          for ($i = 0; $i -le $cont; $i++)
            {               
              # $i   #debug
               New-ADOrganizationalUnit ($OUs.GetValue($i)).ToUpper()-Verbose -ProtectedFromAccidentalDeletion $false
            }
    }
  
  # Cria Grupos   
    if ($CriaGrupo -eq $true)
    {      
          for ($i = 0; $i -le $cont; $i++)
            {               
              $name_Group = "G_" + $seunome.ToUpper() + "-" + ($OUs.GetValue($i)).ToUpper()
              $Path_Group = "OU=" + ($OUs.GetValue($i)).ToUpper() + ", DC=" + ($FQDN.GetValue(0)).ToUpper() +", DC=" + ($FQDN.GetValue(1)).ToUpper() # +", DC=" + ($FQDN.GetValue(2)).ToUpper()
              # $name_Group  + " : " + $Path_Group #debug
              
              New-ADGroup $name_Group -DisplayName $name_Group -SamAccountName $name_Group -GroupScope Global -GroupCategory Security -Path $Path_Group -verbose
            }
    }

#Criação de Usuários
 $i = 0
 if ($CriaUsuario -eq $true)
    {        
     #Importação da Planilha de Funcionários (.csv)
          $path_user = "OU=" + ($OUs.GetValue($i)).ToUpper() + ", DC=" + ($FQDN.GetValue(0)).ToUpper() +", DC=" + ($FQDN.GetValue(1)).ToUpper() # +", DC=" + ($FQDN.GetValue(2)).ToUpper()
          # $path_user #Debug

          # Formata o Password 
                $password = ConvertTo-SecureString "Infnet2015" -AsPlainText -Force
                # $password #Debug      
          
        Import-Csv ($diretorio + "\" + $arquivo + ".csv") | ForEach-Object {
                           
            New-ADUser $_.CONTA -AccountPassword $password -ChangePasswordAtLogon 1 -Path $path_user -Enabled 1
            
        # Adiciona Usuário ao Grupo
                $name_Group = "G_" + $seunome + "-" + ($OUs.GetValue($i))
                Add-ADGroupMember $name_Group -Members $_.CONTA  
                   
        }
    }
    


