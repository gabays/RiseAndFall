# BirthOfStyle

## Data

Comes from [DraCor](https://github.com/dracor-org). It has been cleaned, especially regarding metadata.

## Build the data

All the data are already available in csv format ([3grams are here](https://github.com/gabays/RiseAndFall/blob/main/feats_tests_n3_k_5000.csv) and [stopwords are here](https://github.com/gabays/RiseAndFall/blob/main/feats_tests_n1_k_5000.csv)). But if needed you can recreate them.

1. Extract the text from the xml

```console
bash Make_corpus.bash
```

2. Install [SuperStyl](https://github.com/SupervisedStylometry/SuperStyl)

 * Create data with 3grams

```console
python3 main.py -s ../txt/* -t chars -n 3
```

 * Create data with stopwords
```console
python3 main.py -s ../txt/* -t words -n 1 -f ../mots_outils.json
```

## Cite

This research has been presented at [DH Benelux 2023](https://2023.dhbenelux.org).

```bibtex
@inproceedings{cafiero:hal-04093598,
  TITLE = {{Rise and Fall of Theatrical Genres in Early Modern France:}},
  AUTHOR = {Cafiero, Florian and Gabay, Simon},
  URL = {https://hal.science/hal-04093598},
  BOOKTITLE = {{DH Benelux}},
  ADDRESS = {Bruxelles, Belgium},
  YEAR = {2023},
  MONTH = May,
  HAL_ID = {hal-04093598},
  HAL_VERSION = {v1},
}
```