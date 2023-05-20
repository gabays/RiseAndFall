# BirthOfStyle

## Data

Comes from [DraCor](https://github.com/dracor-org). It has been cleaned, especially regarding metadata.

## Build the data

```console
bash Make_corpus.bash
```

Install [SuperStyl](https://github.com/SupervisedStylometry/SuperStyl)

Create the 3grams

```console
python3 main.py -s ../txt/* -t chars -n 3
```

and 
```console
python3 main.py -s ../txt/* -t words -n 1 -f ../mots_outils.json
```

## Cite

```bibtex
@inproceedings{cafiero:hal-04093598,
  TITLE = {{Rise and Fall of Theatrical Genres in Early Modern France:}},
  AUTHOR = {Cafiero, Florian and Gabay, Simon},
  URL = {https://hal.science/hal-04093598},
  BOOKTITLE = {{DH Benelux}},
  ADDRESS = {Bruxelles, Belgium},
  YEAR = {2023},
  MONTH = May,
  KEYWORDS = {Stylometry ; French theatre ; 17th \& 18th centuries ; Stylistics ; Stylom{\'e}trie ; Stylistique  litt{\'e}rature fran{\c c}aise ; Th{\'e}{\^a}tre classique -- France},
  PDF = {https://hal.science/hal-04093598/file/DhBenelux_2023.pdf},
  HAL_ID = {hal-04093598},
  HAL_VERSION = {v1},
}
```