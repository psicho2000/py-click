# py-click Demo

## Usage

```bash
python3 -m venv .venv
source ./.venv/bin/activate
```

## Install and build

```bash
poetry build
pip install ./dist/py_click-0.1.0-py3-none-any.whl
_CLICKY_COMPLETE=zsh_source clicky | sudo tee /usr/local/share/zsh/site-functions/_clicky >/dev/null
_CLICKY_COMPLETE=bash_source clicky | sudo tee /usr/share/bash-completion/completions/clicky >/dev/null
```
