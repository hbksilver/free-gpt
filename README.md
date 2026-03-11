# createGPT
Create your own version of  AI tool "gpt"
This creates a 100% free GPT-style chatbot using:

Ollama

TinyLlama (fast for Codespaces)

Streamlit

No paid APIs. No hosting cost.

1️⃣ Project Folder Structure

Create this structure in Codespaces:

free-gpt/
│
├── app/
│   ├── app.py
│   └── chatbot.py
│
├── requirements.txt
└── start.sh
2️⃣ requirements.txt

Create file:

requirements.txt

Paste:

streamlit
requests

Install:

pip install -r requirements.txt
3️⃣ Backend GPT Logic

Create:

app/chatbot.py

Code:

import requests

def get_response(prompt):

    response = requests.post(
        "http://localhost:11434/api/generate",
        json={
            "model": "tinyllama",
            "prompt": prompt,
            "stream": False
        }
    )

    return response.json()["response"]
4️⃣ Chat UI

Create:

app/app.py

Code:

import streamlit as st
from chatbot import get_response

st.set_page_config(page_title="FreeGPT", page_icon="🤖")

st.title("🤖 FreeGPT (Local AI)")

if "messages" not in st.session_state:
    st.session_state.messages = []

for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

if prompt := st.chat_input("Ask something..."):

    st.session_state.messages.append({"role": "user", "content": prompt})

    with st.chat_message("user"):
        st.markdown(prompt)

    response = get_response(prompt)

    with st.chat_message("assistant"):
        st.markdown(response)

    st.session_state.messages.append(
        {"role": "assistant", "content": response}
    )
5️⃣ Auto Setup Script

Create:

start.sh

Code:

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

Make it executable:

chmod +x start.sh
6️⃣ Run Everything With ONE Command

Inside Codespaces:

./start.sh

This automatically:

Installs Ollama

Starts the AI server

Downloads TinyLlama

Launches Streamlit

7️⃣ Make Your GPT Public

Open Ports tab

Find:

8501

Set:

Visibility → Public

Then open the generated URL like:

https://your-codespace-name-8501.app.github.dev

Your GPT chatbot will load.

🚀 Result

You now have:

✅ Free GPT chatbot
✅ Runs fully inside Codespaces
✅ No API costs
✅ Shareable link
✅ Chat memory in session

🔥 Future implimentation/upgrade this to a real ChatGPT-level system with:

persistent memory

document upload

vector database

code interpreter

tools

agent workflows

All still 100% free.
