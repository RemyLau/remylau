from pathlib import Path

from remylau.utils import ensure_dir

HOMEDIR = Path(__file__).resolve().parents[2]

DATADIR = ensure_dir(HOMEDIR / "data")
RAW_DATADIR = ensure_dir(DATADIR / "raw")
PROCESSED_DATADIR = ensure_dir(DATADIR / "processed")
EXTRAS_DATADIR = ensure_dir(DATADIR / "extras")

FIGDIR = ensure_dir(HOMEDIR / "figures")
