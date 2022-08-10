FROM python:3.8.2-slim

WORKDIR /app

COPY app.py .
COPY best-model.pkl .
COPY katonic-1.0-py3-none-any.whl .
COPY loan_default.csv .
COPY one-hot-encoder.pkl .
COPY Logo.png .
COPY favicon.ico .
COPY requirements.txt .
COPY loan-predict-src.png .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error