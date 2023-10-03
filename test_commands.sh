# Go to the root of this project
cd ~/Documents/Workspaces/Docker/ubuntu-tuned

## If the Docker buildx instance is unusable, recreate it
docker buildx rm multiarch
docker buildx create --name multiarch --use

# Build the Docker image
docker buildx build --no-cache --progress=plain --push --platform linux/amd64,linux/arm64 --rm -t wujidadi/ubuntu-tuned:2.10 -t wujidadi/ubuntu-tuned:latest . 2>&1 | tee $D/docker-build-ut.log

# Create test container and delete it finally
docker run -d -p 50000:80 -it --name Test wujidadi/ubuntu-tuned:2.10
# docker exec -it Test zsh
docker exec -it Test vim --version | grep 'Included patches'
docker exec -it Test nano -V | grep 'GNU nano, version'
docker stop Test
docker rm Test
