import os
from typing import Union


import uvicorn
from fastapi import FastAPI
from fastapi import Request

app = FastAPI()

@app.get("/")
def read_root(req: Request):
    ip = req.client.host
    return {
        "Message": "Hello there",
    }

if __name__ == "__main__":
    host = os.getenv("HOST", "127.0.0.1")
    port = int(os.getenv("PORT", 8000))
    uvicorn.run(app, host=host, port=port)