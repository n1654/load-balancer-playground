FROM python:3

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir Flask

CMD ["/home/main_b.py"]
