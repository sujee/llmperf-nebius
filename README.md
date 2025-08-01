# LLMPerf Nebius

This is a fork of https://github.com/ray-project/llmperf.

This is to test models in Nebius AI Studio.

Moved some old files into [archived](archived/) folder.  [Old readme file](archived/README.md)

See [migration notes](migration-notes.md)

## Setup

```bash
uv sync
uv venv
source .venv/bin/activate
# install a kernel to be used in jupyter / vscode
python -m ipykernel install --user --name="llmperf-nebius" --display-name "llmperf-nebius"

```

Get your Nebius API key from : https://studio.nebius.com/

## Running


**1. Setup API keys**

```bash
export NEBIUS_API_KEY="your_nebius_api_key"
export OPENAI_API_KEY=$NEBIUS_API_KEY
export OPENAI_API_BASE="https://api.studio.nebius.com/v1/"
```


**2. Inspect `run.sh`**

This is a convenient script:  [run.sh](run.sh)

- You can set which models to test
- how many requests to make `--max-num-completed-requests 100`
- concurrent requets `--num-concurrent-requests 10 `

**3. run.sh**

```bash
bash run.sh
```

This will take a few minutes to complete.

Run results will be in `result_outputs` folder.

## Analyzing Results

Code :  [analyze_results.ipynb](analyze_results.ipynb)

To run it with Vscode:
- open [analyze_results.ipynb](analyze_results.ipynb)
- Choose kernel : `llmperf-nebius`
- Run all

To run with Jupyter

```bash
uv run --with jupyter jupyter lab   analyze_results.ipynb
```

And run all cells.

After notebook run is complete, it will export the results as a HTML file ([analyze_results.html](analyze_results.html)) for easy sharing.  
