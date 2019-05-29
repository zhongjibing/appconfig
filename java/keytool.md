# keytool

## jks to pfx
```
keytool.exe -importkeystore -srckeystore icezhg.com.jks -destkeystore icezhg.com.pfx -srcstoretype JKS -deststoretype PKCS12
```

## pfx to jks
```
 keytool.exe -importkeystore -srckeystore icezhg.com.pfx -destkeystore icezhg.com.jks -srcstoretype PKCS12 -deststoretype JKS
```