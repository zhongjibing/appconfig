# ffmpeg

## 保存串流为视频
```sh
ffmpeg -protocol_whitelist "file,http,https,tcp,tls" -i "https://abc.com/vstream.m3u8" -c copy -bsf:a aac_adtstoasc output.mp4
```
> 说明：
> 1. -i "URL"：指定输入的M3U8地址（HTTPS）
> 2. -c copy：直接复制流而不重新编码（保持原质量）
> 3. -bsf:a aac_adtstoasc：修复AAC音频流的比特流过滤器（HLS转MP4时常用）
> 4. output.mp4：输出的文件名
> 5. 如果有SSL证书问题，添加`-protocol_whitelist "file,http,https,tcp,tls"`