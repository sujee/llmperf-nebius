#!/bin/bash
# This script runs benchmarks for various models and archives previous results.


# Archive previous results if they exist
if [ -d "result_outputs" ]; then
    timestamp=$(date +%Y%m%d_%H%M%S)
    mv result_outputs "result_outputs.${timestamp}"
    echo "Archived previous results to result_outputs.${timestamp}"
fi

# Create new result_outputs directory
mkdir -p result_outputs

for model in "deepseek-ai/DeepSeek-R1-0528" \
"Qwen/Qwen3-235B-A22B-Instruct-2507" \
"Qwen/Qwen3-235B-A22B" \
"Qwen/Qwen3-30B-A3B" \
"Qwen/Qwen3-32B" \
"Qwen/Qwen3-14B" \
"Qwen/Qwen3-4B-fast" \
"deepseek-ai/DeepSeek-V3-0324" \
"meta-llama/Llama-3.3-70B-Instruct"

do
    echo "=========  Running benchmark for model: $model ==========="
    start_time=$(date +%s)
    python token_benchmark_ray.py  \
        --model "$model"   \
        --mean-input-tokens 550   \
        --stddev-input-tokens 150  \
        --mean-output-tokens 150  \
        --stddev-output-tokens 10  \
        --max-num-completed-requests 100  \
        --timeout 600  \
        --num-concurrent-requests 10   \
        --results-dir "result_outputs"   \
        --llm-api openai  \
        --additional-sampling-params '{}' 
    end_time=$(date +%s)
    elapsed=$((end_time - start_time))
    echo "=========  Completed benchmark for model: $model in $elapsed seconds ==========="
done

