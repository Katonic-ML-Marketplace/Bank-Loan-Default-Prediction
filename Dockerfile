FROM quay.io/katonic/katonic-base-images:py38-base-conda4.9.2

RUN mkdir -p img_src models

COPY app.py .
COPY img_src/Logo.png img_src/.
COPY img_src/favicon.ico img_src/.
COPY img_src/loan_predict_src.png img_src/.
COPY models/best_model.pkl models/.
COPY models/one_hot_encoder.pkl models/.
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error --server.fileWatcherType=none
