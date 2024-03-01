## Step 1. Download HTML

First, download the full network repository metadata HTML.
1. Go to https://networkrepository.com/networks.php
1. Right click "inspect"
1. Right click "Copy > Copy element"
1. Paste data to "netrepo.html"

[Last update: 2024-03-01]

## Step 2. Run auto metadata extraction and data download script

```bash
python get_netrepo_data.py
```

The script will
1. Extract metadata from the raw HTML file (already done).
1. Download all network data given urls (skip bad urls and bad zip files).

## License terms

We follow the data license terms from the [network repository](https://networkrepository.com/policy.php),
which is a permissive [Creative Commons Attribution-ShareAlike License](https://creativecommons.org/licenses/by-sa/4.0/deed.en).

Please acknoledge the network repository in published materials:

```bibtex
@inproceedings{nr,
  title = {The Network Data Repository with Interactive Graph Analytics and Visualization},
  author={Ryan A. Rossi and Nesreen K. Ahmed},
  booktitle = {AAAI},
  url={http://networkrepository.com},
  year={2015}
}
```
