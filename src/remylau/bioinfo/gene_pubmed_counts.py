import gzip
import os.path as osp
from ftplib import FTP
from io import BytesIO
from pathlib import Path

import click
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

from remylau.config import FIGDIR, RAW_DATADIR
from remylau.utils import ensure_dir

FTP_HOST = "ftp.ncbi.nih.gov"
FTP_FILE_PATH = "gene/DATA/gene2pubmed.gz"
FILE_NAME = "gene2pubmed.txt"
FILE_PATH = ensure_dir(RAW_DATADIR / "genes") / FILE_NAME

TAXOID = 9606  # Only concerned with human genes for now
TOP_K = 10

DEFAULT_FIGURE_PATH = FIGDIR / "gene_study_dist.pdf"


def maybe_download_data():
    if osp.isfile(FILE_PATH):
        print(f"Data found: {FILE_PATH}")
        return

    with FTP(FTP_HOST) as ftp:
        ftp.login()

        print("Retriving data from NIH through FTP...")
        with BytesIO() as bp, open(FILE_PATH, "wb") as fp:
            ftp.retrbinary(f"RETR {FTP_FILE_PATH}", bp.write)
            fp.write(gzip.decompress(bp.getvalue()))

    print(f"Data saved to {FILE_PATH}")


def plot_gene_counts_hist(counts, save_path):
    plt.figure(figsize=(6, 3))
    sns.histplot(data=counts, bins=50)
    plt.yscale("log")
    plt.xlabel("# Publications", fontsize=18)
    plt.ylabel("# Genes", fontsize=18)
    plt.savefig(save_path, bbox_inches="tight")
    print(f"Figure saved to {save_path}")


@click.command()
@click.option("--save_path", type=click.Path(), default=DEFAULT_FIGURE_PATH)
def main(save_path):
    maybe_download_data()

    df = pd.read_csv(FILE_PATH, sep="\t")
    df = df[df["#tax_id"] == TAXOID]
    counts = df["GeneID"].value_counts()
    print(f"Top {TOP_K} most studied genes:\n{counts.head(TOP_K)}\n")

    plot_gene_counts_hist(counts, save_path)


if __name__ == "__main__":
    main()
