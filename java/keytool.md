# keytool

## jks to pfx
```
keytool.exe -importkeystore -srckeystore icezhg.com.jks -destkeystore icezhg.com.pfx -srcstoretype JKS -deststoretype PKCS12
```

## pfx to jks
```
 keytool.exe -importkeystore -srckeystore icezhg.com.pfx -destkeystore icezhg.com.jks -srcstoretype PKCS12 -deststoretype JKS
```

## genkey genkeypair
```
keytool -genkeypair -alias quercus -keyalg RSA -keystore quercus-prod.jks
keytool -genkey -alias quercus -keyalg RSA -keysize 2048 -keystore quercus.p12 -validity 365
keytool -genkey -alias tomcat -keypass 123456 -keyalg RSA -keysize 1024 -validity 365 -keystore D:/tomcat.keystore -storepass 123456
```
> -genkey 表示要创建一个新的密钥对  
> -alias 表示keystore的别名  
> -keyalg 表示使用的加密算法是RSA  
> -keysize 表示密钥的长度  
> -keystore 表示生成的密钥存放位置  
> -validity 表示密钥的有效时间, 单位为天 
> -keypass 密钥口令 
> -storepass 密钥库口令 

## list entries
```
keytool -v -list -keystore icezhg.com.jks
```
