#!/usr/bin/env bash
set -euo pipefail

SCENE="${1:-1}"

case "$SCENE" in
    1|photo_scene1)
        CONFIG="outputs/photo_scene/splatfacto/2026-07-09_141323/config.yml"
        PORT=7007
        ;;
    2|photo_scene2)
        CONFIG="outputs/photo_scene2/splatfacto/2026-07-09_190020/config.yml"
        PORT=7008
        ;;
    3|photo_scene3)
        CONFIG="outputs/photo_scene3/splatfacto/2026-07-09_223638/config.yml"
        PORT=7009
        ;;
    4|photo_scene4)
        CONFIG="outputs/photo_scene4/splatfacto/2026-07-10_165728/config.yml"
        PORT=7010
        ;;
    *)
        echo "Usage: ./view.sh {1|2|3|4}"
        exit 1
        ;;
esac

if ! command -v ns-viewer >/dev/null 2>&1; then
    echo "ERROR: ns-viewer not found."
    echo "Please activate the nerfstudio environment first:"
    echo "conda activate nerfstudio"
    exit 1
fi

if [ ! -f "$CONFIG" ]; then
    echo "ERROR: config not found: $CONFIG"
    exit 1
fi

export TORCHDYNAMO_DISABLE=1
export TCNN_CUDA_ARCHITECTURES="${TCNN_CUDA_ARCHITECTURES:-89}"

if [ -n "${CONDA_PREFIX:-}" ]; then
    export CUDA_HOME="$CONDA_PREFIX"
    export PATH="$CUDA_HOME/bin:$PATH"
    export LD_LIBRARY_PATH="$CUDA_HOME/lib:/usr/lib/wsl/lib:${LD_LIBRARY_PATH:-}"
    export LIBRARY_PATH="$CUDA_HOME/lib:/usr/lib/wsl/lib:${LIBRARY_PATH:-}"
fi

echo "Loading: $CONFIG"
echo "Open in browser: http://127.0.0.1:$PORT"

ns-viewer \
    --load-config "$CONFIG" \
    --viewer.websocket-port "$PORT"
