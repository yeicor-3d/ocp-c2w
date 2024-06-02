FROM python:3-slim as base

RUN apt-get update && apt-get install -y libgl1 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY tea_cup.py requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN /bin/bash -c "find  /usr/local/lib/python* -name '*.so*' -size +10M -print0 | tar -czvf libs.tar.gz --remove-files --null -T /dev/stdin | tee /dev/stderr"

FROM python:3-slim

WORKDIR /app

COPY --from=base / /

ENTRYPOINT ["/bin/bash", "-exc",  "tar -C / -xzvf libs.tar.gz && rm libs.tar.gz && python -m trace --ignore-dir=$(python -c 'import sys; sep=\":\"; print(sep.join(sys.path)[1:])') -t ./tea_cup.py" ]
