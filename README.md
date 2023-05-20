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
```bash
python3 main.py -s ../txt/* -t words -n 1 -f ../mots_outils.json
```

## Cite

Simon Gabay and Florian Cafiero, _Rise And Fall_, university of Geneva/Sciences Po Paris, 2023