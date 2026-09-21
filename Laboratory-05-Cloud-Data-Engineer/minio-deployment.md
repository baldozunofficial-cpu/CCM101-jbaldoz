# MinIO Deployment Documentation

## Docker Command Used

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
  -e "MINIO_ROOT_USER=cloudadmin" \
  -e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
  quay.io/minio/minio server /data --console-address ":9001"
```

The image was pulled from Quay.io (`quay.io/minio/minio`) instead of Docker Hub (`minio/minio`), because the Docker Hub pull failed with an "access denied" error.

## Deployment Details

| Item | Value |
|------|-------|
| Web console port | 9001 |
| API port | 9000 |
| Container name | minio-server |
| Bucket created | client-photos |

## Steps Taken

1. Launched a KillerCoda Ubuntu Playground.
2. Ran the `docker run` command above to download and start the MinIO server.
3. Verified the container was running with `docker ps`.
4. Opened port 9001 through the Traffic / Ports tab to reach the MinIO web console.
5. Logged in with the credentials set in the Docker command.
6. Created a bucket named `client-photos` and uploaded a sample file.

## Environment Variables (-e flags)

- **`MINIO_ROOT_USER=cloudadmin`** sets the administrator username used to log in to the MinIO web console and API.
- **`MINIO_ROOT_PASSWORD=CloudNova2026!`** sets the administrator password for that account.

The `-e` flag passes an environment variable into the container when it starts. MinIO reads these two variables at startup to create its root account, so no manual setup is needed inside the container. These are lab-only credentials and should not be used in production.

## Troubleshooting Notes

- The first attempt failed because `minio/minio` could not be pulled from Docker Hub. Switching to `quay.io/minio/minio` fixed it.
- A later attempt failed with a container name conflict. Removing the old container with `docker rm -f minio-server` and re-running the command resolved it.

## Screenshots

- `screenshots/minio-deployed.png`: MinIO container running
- `screenshots/minio-bucket-upload.png`: `client-photos` bucket with an uploaded file
