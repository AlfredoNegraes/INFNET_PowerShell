
# Cria Zona Primária DNS

        #Variáveis
            $site = "seu_nome.com" 

        #Comando 
            Add-DnsServerPrimaryZone $site -ReplicationScope Domain -DynamicUpdate NonsecureAndSecure -Verbose

    #---------------------------------------------------------------------------------------------------------

    #Cria Host A

        #Variáveis 
            $hostA = "www"
            $IPv4Address = "192.168.1.3"

        # Comando
            Add-DnsServerResourceRecord -ZoneName $site -A -Name $hostA -IPv4Address $IPv4Address -Verbose