<p align="center">
    <img src="https://avatars.githubusercontent.com/u/82603435?v=4" width="140px" alt="Helm LOGO"/>
</p>

<div align="center">

  [![Blog](https://img.shields.io/badge/Blog-blue?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://une-tasse-de.cafe/)
  [![Minio](https://img.shields.io/badge/Minio-red?style=for-the-badge&logo=minio&logoColor=white)](https://min.io/docs/minio/kubernetes/upstream/index.html)
  
</div>

## Warp S3 Benchmark

## How to run

- Create a docker-compose file with the following content:

```yaml
services:
  app:
    build: .
    image: ghcr.io/qjoly/warp-s3-kube:latest
    environment:
      - WARP_HOST=minio_url
      - WARP_ACCESS_KEY=access_key
      - WARP_SECRET_KEY=secret_key
      - WARP_TLS=true
      - BENCH_MODE="mixed"
      - DURATION=10s
```

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="center">
   <a href="https://github.com/qjoly/warp-s3-kube/graphs/contributors">
      <img src="https://contrib.rocks/image?repo=qjoly/warp-s3-kube">
   </a>
</p>
</details>

---
