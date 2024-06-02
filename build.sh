 #!/usr/bin/env bash
 
 set -ex
 
 docker build --tag c2w-build123d --network host docker

./c2w --debug-image --dockerfile docker/Dockerfile.c2w c2w-build123d web/out.wasm

echo "web/out.wasm is ready. Run server.py to serve web/ files on http://localhost:8000"
