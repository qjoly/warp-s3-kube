<p align="center">
    <img src="https://avatars.githubusercontent.com/u/82603435?v=4" width="140px" alt="Helm LOGO"/>
</p>

<div align="center">

  [![Blog](https://img.shields.io/badge/Blog-blue?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://une-tasse-de.cafe/)
  [![Minio](https://img.shields.io/badge/Minio-red?style=for-the-badge&logo=minio&logoColor=white)](https://min.io/docs/minio/kubernetes/upstream/index.html)
  
</div>

# Warp S3 Benchmark docker image

## How to run locally

- Create a docker-compose file with the following content:

```yaml
services:
  app:
    # build: .
    image: ghcr.io/qjoly/warp-s3-kube:v0.0.5
    environment:
      - "WARP_HOST=host"
      - WARP_ACCESS_KEY=admin
      - WARP_SECRET_KEY=password
      - WARP_TLS=false
      - WARP_BUCKET=bench3az
      - BENCH_MODE=mixed
      - DURATION=5m
      - EXTRA_ARGS=--analyze.out=out/warp-s3-kube.csv
      - KEEP_ALIVE_AFTER_TEST=false
    volumes:
      - ./output:/app/out
```

You can use example file given in this repo `docker-compose-example.yaml`

Build the image locally

```bash
% docker compose build
```

Run the image

```bash
% docker compose up

[+] Running 1/0
 ✔ Container warp-s3-kube-app-1  Created                                                                                                                                                                                                   0.0s 
Attaching to app-1
app-1  | Testing on host xxxxxxxxx
app-1  | Access key: xxxxxxxxx
app-1  | Running benchmark test...
app-1  | warp mixed --duration=5m --analyze.out=out/filename.csv --bucket=bench3az
app-1  | warp: Preparing server.
Uploading 2500 objects of Random data; 10485760 bytes totalwarp: Starting benchmark in 3s...
app-1  | warp: Benchmark starting...
app-1  | warp: Saving benchmark data...
app-1  | warp: Benchmark data written to "warp-mixed-2025-01-22[153252]-pkjW.csv.zst"
app-1  | 
app-1  | Mixed operations.
app-1  | Operation: DELETE, 10%, Concurrency: 20, Ran 4m49s.
app-1  |  * Throughput: 1.45 obj/s
app-1  | 
app-1  | Operation: GET, 45%, Concurrency: 20, Ran 4m51s.
app-1  |  * Throughput: 64.38 MiB/s, 6.44 obj/s
app-1  | 
app-1  | Operation: PUT, 15%, Concurrency: 20, Ran 4m51s.
app-1  |  * Throughput: 21.73 MiB/s, 2.17 obj/s
app-1  | 
app-1  | Operation: STAT, 30%, Concurrency: 20, Ran 4m51s.
app-1  |  * Throughput: 4.30 obj/s
app-1  | 
app-1  | Cluster Total: 85.87 MiB/s, 14.33 obj/s over 4m51s.
app-1  | Aggregated data saved to out/filename.csv
app-1  | warp: Starting cleanup...
Clearing Prefix "bench3az/YY)B0nxP/"...warp: Cleanup Done.
app-1  | Test completed. Exiting...
app-1 exited with code 0
```

CSV file of the bench can be found in the `./output/` directory

## TODO How to run on Kubernetes 

TODO

## Contributions

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
