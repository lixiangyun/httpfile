# httpfile
- A http file server tool

## build
```
go build .
```

## usage
```
Usage of httpfile.exe:
  -cert string
        certificate file (https). (default "server.crt")
  -d string
        http file server root directory. (default "./")
  -h    this help.
  -key string
        private key file name (https). (default "server.key")
  -p string
        http file server listener address. (default "127.0.0.1:8080")
  -tls
        enable https.
```

## Native deployment

### normal mode

```
httpfile.exe -p :8080 -d ./data
```

### tls mode
```
httpfile.exe -tls -p :8080 -d ./data
```

## Docker deployment

### normal mode

```
docker run -d -p 8080:8080 -v /opt/data:/data --restart=always linimbus/httpfile
```

### tls mode

```
docker run -d -p 8080:8080 -v /opt/data:/data --restart=always linimbus/httpfile -tls
```

## Browse wiew

such as
```
http://192.168.0.111:8080/
or
https://192.168.0.111:8080/
```
