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

## Mount drives

**Mount physical device**

1. Check device
   ```bash
   sudo fdisk -l
   ```
1. Create mount directory with user permission (if not yet done before)
   ```bash
   sudo mkdir -m777 /mnt/<mount_name>
   ```
1. Mount the device
   ```bash
   sudo mount /dev/<device_id>/ /mnt/<mount_name>/
   ```

[Reference](https://www.xda-developers.com/how-mount-ubuntu/)

**Mount network drive via sshfs**

1. Set up ssh keys
1. Create mount directory with user permission (if not yet done before)
   ```bash
   sudo mkdir -m777 /mnt/<mount_name>
   ```
1. Mount through sshfs
   ```bash
   sshfs <user>@<host>:/path/to/mount /mnt/<mount_name>
   ```

[Reference](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh)

### Set up auto mounts

1. Create backup of `/etc/fstab` in case something happens
   ```bash
   sudo cp /etc/fstab /etc/fstab.bkp
   ```
1. Append mount info to the `/etc/fstab` file
    1. Physical drive
        1. Find the UUID of the partition you want to mount
           ```bash
           sudo blkid
           ```
        1. Add mount info, e.g.,
           ```txt
           # UUID=<uuid> <pathtomount> <filesystem> defaults 0 0
           /dev/disk/by-uuid/<uuid> <pathtomount> <filesystem> defaults 0 0
           ```
    1. Network drive
        1. Add mount info, e.g.,
           ```txt
           sshfs#<user>@<most>:/path/to/mount /mnt/<mount_name> fuse defaults,_netdev,allow_other 0 0
           ```

[Reference](https://askubuntu.com/questions/164926/how-to-make-partitions-mount-at-startup)
