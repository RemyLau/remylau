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

## Notes

- [2024-03-01] Download notes
    - Failed to download (5):
        - `bio-MUTAG-g1`
        - `ca-cit-Hepfqw.php`
        - `install.log`
        - `aff-delicious-user-url`
        - `index.php`
    - Failed to unpack (38):
        - `data/hugebubbles-00020/hugebubbles-00020.zip`
        - `data/graph500-scale25-ef16-adj/graph500-scale25-ef16_adj.zip`
        - `data/soc-friendster/soc-friendster.zip`
        - `data/soc-twitter-mpi-sws/soc-twitter-mpi-sws.zip`
        - `data/soc-twitter/soc-twitter.zip`
        - `data/web-ClueWeb09/web-ClueWeb09.zip`
        - `data/web-cc12-firstlevel-subdomain/web-cc12-firstlevel-subdomain.zip`
        - `data/web-cc12-hostgraph/web-cc12-hostgraph.zip`
        - `data/ASIC-100k/ASIC_100k.zip`
        - `data/ASIC-100ks/ASIC_100ks.zip`
        - `data/Baumann/Baumann.zip`
        - `data/GL7d14/GL7d14.zip`
        - `data/Ga10As10H30/Ga10As10H30.zip`
        - `data/Ga19As19H42/Ga19As19H42.zip`
        - `data/Ge99H100/Ge99H100.zip`
        - `data/HEP-th-new/HEP-th-new.zip`
        - `data/HV15R/HV15R.zip`
        - `data/Kuu/Kuu.zip`
        - `data/M80PI-n/M80PI_n.zip`
        - `data/Maragal-6/Maragal_6.zip`
        - `data/Maragal-8/Maragal_8.zip`
        - `data/NotreDame-actors/NotreDame_actors.zip`
        - `data/OPF-3754/OPF_3754.zip`
        - `data/Si41Ge41H72/Si41Ge41H72.zip`
        - `data/SiNa/SiNa.zip`
        - `data/TSOPF-RS-b300-c2/TSOPF_RS_b300_c2.zip`
        - `data/TSOPF-RS-b39-c19/TSOPF_RS_b39_c19.zip`
        - `data/TSOPF-RS-b39-c7/TSOPF_RS_b39_c7.zip`
        - `data/a0nsdsil/a0nsdsil.zip`
        - `data/a5esindl/a5esindl.zip`
        - `data/af-0-k101/af_0_k101.zip`
        - `data/av41092/av41092.zip`
        - `data/bbmat/bbmat.zip`
        - `data/cavity25/cavity25.zip`
        - `data/circuit5M/circuit5M.zip`
        - `data/circuit5M-dc/circuit5M_dc.zip`
        - `data/delicious-ut/delicious-ut.zip`
        - `data/webbase-2001/webbase-2001.zip`
