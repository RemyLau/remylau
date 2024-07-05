# Notes

## Dev env setup

### Jupyter notebook

We use port `45684` for the notebook.

- Step 1. connect to server and forward port
    ```bash
    ssh -L 45684:localhost:45684 <server>
    ```
- Step 2. launch notebook without opening browser and send to port
    ```bash
    jupyter notebook --no-browser --port=45684
    ```

#### Configure notebook

We can configure jupyter notebook to have the `--no-browser` and `--port=45684`
options be default so that we can simlpy run `jupyter notebook`.

- Step 1. generate config file
    ```bash
    jupyter notebook --generate-config
    ```
- Step 2. modify config options by editing the generated config file under
  `~/.jupyter/jupyter_notebook_config.py`:
    - `c.ServerApp.port = 45684`
    - `c.JupyterNotebookApp.open_browser = False`

#### Installing kernal for existing env

```bash
python -m ipykernel install --user --name=<env_name>
```
