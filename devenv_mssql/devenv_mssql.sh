sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Select*from1' -p 1433:1433 -v mssql_volume:/var/opt/myssql/ --name mssql19 --rm -it mcr.microsoft.com/mssql/server:2019-CU3-ubuntu-16.04
