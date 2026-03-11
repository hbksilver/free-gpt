#!/bin/bash

echo "Installing Ollama..."

curl -fsSL https://ollama.com/install.sh | sh

echo "Starting Ollama..."
ollama serve &

sleep 5

echo "Downloading model..."
ollama pull tinyllama

echo "Starting Streamlit..."

streamlit run app/app.py --server.address 0.0.0.0 --server.port 8501
