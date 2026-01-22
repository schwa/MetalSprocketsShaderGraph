#!/bin/bash
# Generate stdlib files from gyb templates
# Run from project root: ./Scripts/generate-stdlib.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
GYB="$SCRIPT_DIR/gyb.py"

# Generate Metal stdlib
python3 "$GYB" --line-directive "" \
    -o "$PROJECT_ROOT/Sources/ShaderGraphShaders/Metal/Stdlib.metal" \
    "$PROJECT_ROOT/Templates/Stdlib.metal.gyb"
echo "Generated Sources/ShaderGraphShaders/Metal/Stdlib.metal"

# Generate Swift stdlib registration
python3 "$GYB" --line-directive "" \
    -o "$PROJECT_ROOT/Sources/ShaderGraph/StdlibGenerated.swift" \
    "$PROJECT_ROOT/Templates/StdlibGenerated.swift.gyb"
echo "Generated Sources/ShaderGraph/StdlibGenerated.swift"
