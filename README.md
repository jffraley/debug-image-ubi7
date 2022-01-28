# debug-image-ubi7

### tools:

- nc 
- curl 
- wget 
- iputils 
- traceroute 
- bind-utils 
- net-tools 
- telnet 
- wireshark 
- mtr 
- tcpdump 
- nmap 
- iproute
- postgresql

### Commands:

**nc -**
```
nc -zv www.cnn.com 80
Connection to www.cnn.com port 80 [tcp/http] succeeded!
nc -zv www.cnn.com 443  
Connection to www.cnn.com port 443 [tcp/https] succeeded!
```

**curl -**
```
curl -sL -o /dev/null -D - https://www.meta.com
curl -sL -o /dev/null https://www.meta.com -m 2 -w "%{http_code}\n"
```
to curl with a proxy:
(from the command line, get IP and port):
```
-> oc get proxy cluster -o=jsonpath='{.status.httpProxy}'
http://172.21.13.70:3128%
```
Apply proxy to curl command (on troubleshooting pod):
```
Then get on troubleshooting pod and export the proxy for curl to use:

-> export https_proxy="http://172.21.13.70:3128"

-> curl -sL -o /dev/null -D - https://www.google.com
HTTP/1.1 200 Connection established

HTTP/1.1 200 OK

Then unset it and see if it works:

-> unset https_proxy
-> curl -sL -o /dev/null -D - https://www.google.com
^C
```


**postgresql -**

**(from command line, get the hostname and port):**

to determine database name: 
```
-> ibmcloud cdb deployments
```
to determine database port: 
```
- >ibmcloud cdb deployment-connections <PGDB> --endpoint-type private |grep CLI
```

(port and db name are listed)

**postgres command on troubleshooting pod:**
```
psql -h <PGDB_HOST> -p <PORT> -U admin -W -d ibmclouddb
```
