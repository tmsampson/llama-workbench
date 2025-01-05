# Load config
source ./config.sh

# Helper function for installing brew packages when missing
install_package() {
	local package="$1"
	if brew list "$package" &>/dev/null; then
		echo "✔️ $package already installed"
	else
		echo "Installing $package ..."
		brew install "$package"
	fi
}

# Install llama.cpp
install_package "llama.cpp"

# Install huggingface-cli (required to download models)
install_package "huggingface-cli"

# Download Meta Llama 3 model (4 bit, Medium)
if [ ! -f "$MODEL_FILE" ]; then
	huggingface-cli download MaziyarPanahi/Meta-Llama-3-8B-Instruct-GGUF --local-dir ./models --include '*Q4_K_M*gguf'
else
	echo "✔️ Model downloaded ($MODEL_FILE)"
fi