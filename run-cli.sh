# Load config
source ./config.sh

# Load and run the model
llama-cli \
	-m "$MODEL_FILE" \
	-r '<|eot_id|>' \
	--conversation \
	--in-prefix "\n<|start_header_id|>user<|end_header_id|>\n\n" \
	--in-suffix "<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n" \
	-p "<|begin_of_text|><|start_header_id|>system<|end_header_id|>\n\nYou are a helpful, smart, kind, and efficient AI assistant. You always fulfill the user's requests to the best of your ability.<|eot_id|>\n<|start_header_id|>user<|end_header_id|>" -n 1024