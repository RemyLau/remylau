import os
import warnings
import zlip
from pathlib import Path
from zipfile import BadZipFile, ZipFile

import click
import pandas as pd
import requests
from bs4 import BeautifulSoup
from tqdm import tqdm

DATADIR = Path(__file__).resolve().parent / "data"


def get_meta_df(path_to_html: str, path_to_metadata: str, reprocess_metadata: bool):
    if not reprocess_metadata and os.path.isfile(path_to_metadata):
        df = pd.read_csv(path_to_metadata)
        print(f"Metadata table loaded from {path_to_metadata}:\n{df}")
        return df

    with open(path_to_html) as f:
        soup = BeautifulSoup(f.read(), "html.parser")

    table_data_raw = soup.find_all("tr")[1:]
    print(f"Total number of networks: {len(table_data_raw):,}")

    table_data_list = []
    for data in tqdm(table_data_raw, desc="Extracting table from raw HTML..."):
        data_dict = {"Name": data.contents[0].find("a").text.strip()}
        data_dict.update({i["title"]: i.text for i in data.contents[2:-2] if i.get("title")})
        data_dict["url"] = data.contents[-1].find("a")["href"]
        table_data_list.append(data_dict)

    df = pd.DataFrame(table_data_list)
    print(f"Finished extracting table:\n{df}")

    df.to_csv(path_to_metadata, index=False)
    print(f"Extracted table saved to {path_to_metadata}")

    return df


def download_data(data_dir: str, meta_df: pd.DataFrame, redownload: bool, reunpack: bool):
    data_dir = Path(data_dir)

    failed = []
    pbar = tqdm(meta_df[["Name", "url"]].iterrows(), total=len(meta_df))

    for _, (name, url) in pbar:
        save_dir = data_dir / name
        save_path = save_dir / url.rsplit("/", 1)[-1]
        os.makedirs(save_dir, exist_ok=True)

        # Download zipped data for the network
        if redownload or not os.path.isfile(save_path):
            pbar.set_description(f"Downloading {name} from {url}")
            with requests.get(url) as r:
                if not r.ok:
                    warnings.warn(
                        f"Failed to download {name} from {url}: {r!r}",
                        RuntimeWarning,
                        stacklevel=2,
                    )
                    failed.append(name)
                    continue

                pbar.set_description(f"Saving zip file to {save_path}")
                with open(save_path, "wb") as f:
                    f.write(r.content)

        # Extract data from the downloaded zip data
        if reunpack or not os.path.isfile(save_dir / "readme.html"):
            pbar.set_description(f"Extracting zipped files from {save_path}")
            try:
                with ZipFile(save_path) as zf:
                    zf.extractall(save_dir)
            except (BadZipFile, zip.error):
                warnings.warn(
                    f"Failed to extract data from {save_path}"
                )

    print("Finished downloading Network Repository data.")
    if failed:
        print(f"Failed to process (total={len(failed):,}): {failed}")


@click.command()
@click.option("--data_dir", type=click.Path(exists=True), default=str(DATADIR))
@click.option("--path_to_html", type=click.Path(exists=True), default="netrepo.html")
@click.option("--path_to_metadata", type=click.Path(), default="netrepo.csv")
@click.option("--reprocess_metadata", is_flag=True, help="If set, reprocess metadata from html.")
@click.option("--redownload", is_flag=True, help="If set, redownload data even if exists.")
@click.option("--reunpack", is_flag=True, help="If set, reunpack data from zip file even if already unpacked.")
def main(
    data_dir: str,
    path_to_html: str,
    path_to_metadata: str,
    reprocess_metadata: bool,
    redownload: bool,
    reunpack: bool,
):
    meta_df = get_meta_df(path_to_html, path_to_metadata, reprocess_metadata)
    download_data(meta_df, data_dir, redownload, reunpack)


if __name__ == "__main__":
    main()
