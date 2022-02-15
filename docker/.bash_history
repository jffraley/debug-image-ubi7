nc -zv www.cnn.com 80
nc -zv www.cnn.com 443  
curl -sL -o /dev/null -D - https://www.cnn.com/politics
curl -sL -o /dev/null -D - https://www.cnn.com/
curl -sL -o /dev/null https://www.meta.com -m 2 -w "%{http_code}\n"
for i in `cat URLs`; do echo -ne "$i\t"; curl -sL -o /dev/null ${i} -m 2 -w "%{http_code}\n"; done
nmap -sP 172.12.10.0/24
nmap -O -v 172.12.10.45
psql -h <PG_HOST> -p <PG_PORT> -U admin -w -d ibmclouddb
psql -h 1f0acc83-473a-4242-bb66-b2a99143cf42.c2f3lg8w0g8s0rkj98i0.private.databases.appdomain.cloud -p 30726 -U admin -w -d ibmclouddb
