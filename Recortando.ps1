# Recortando Conteúdo


    # Variáveis
        $origem = "C:\origem"
        $destino = "C:\destino"


    # Copiar
        # Copiar Todos os Sub-Diretórios Sobrescrevendo
        Copy-Item -Path $origem\* -Destination $destino -Recurse -Force 

        # Copiar todos os Arquivos Sobrescrevendo
        Copy-Item -Path $origem\*.* -Destination $destino -Force 

    # Apagar
        # Apaga todo os arquivos da Pasta
        Remove-Item $origem\* -Recurse -Force 

        # Apaga todo os arquivos da Pasta
        Remove-Item $origem\*.* -Force 