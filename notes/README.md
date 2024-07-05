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

[Reference](https://gist.github.com/wklchris/6e7fac67d8a22a348f3e6b6c75c0836e)

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

[Reference](https://jupyter-notebook.readthedocs.io/en/5.6.0/config.html)

#### Installing kernal for existing env

```bash
python -m ipykernel install --user --name=<env_name>
```

[Reference](https://medium.com/@nrk25693/how-to-add-your-conda-environment-to-your-jupyter-notebook-in-just-4-steps-abeab8b8d084)
