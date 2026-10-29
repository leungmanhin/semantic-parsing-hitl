# datasets/

The public datasets the coverage sample and the mining substrate draw on, one directory per
dataset, fetched by `fetch.py`. Only this file, the script and each dataset's `SOURCE.json` (the
source URL, the sha256 and size of every file as fetched, the licence and a note) are versioned;
the data stays local and is reproduced with

    python datasets/fetch.py            # the default set: the small datasets and slices of the large ones
    python datasets/fetch.py --all      # with the training splits and larger slices
    python datasets/fetch.py --list     # the registry

A re-run keeps a file whose recorded hash still matches and reports one that changed at its source.

| dataset | what it is | why it is here | licence |
|---|---|---|---|
| `hotpotqa` | Wikipedia multi-hop QA with supporting-fact sentences | the coverage sample's main source; questions with answers for the held-out value claim | CC BY-SA 4.0 |
| `drop` | reading comprehension with numbers, dates and spans | the numeric and comparative stress test on real passages | CC BY-SA 4.0 |
| `clutrr` | kinship stories with a queried relation | the public stand-in for the kinship chains NESS uses; relational chaining | CC BY-NC 4.0 (non-commercial) |
| `babi` | the location-tracking task of bAbI (task 1; the other tasks' hosts are gone) | state tracking in a small vocabulary | CC BY 3.0 |
| `counterfact`, `zsre`, `mquake` | fact-editing records, relation questions, multi-hop questions over edited facts | the knowledge-editing track: the record as an editable store, the chainer as the propagation | see each `SOURCE.json` |
| `lambada` | narrative passages with a predicted last word | discourse-dependent prediction on narrative text | CC BY 4.0 |
| `wikitext-103` | good and featured Wikipedia articles | open encyclopedic text: a coverage control and mining filler | CC BY-SA 3.0 |
| `openwebtext` | a slice of web pages linked from Reddit | open web text: a coverage control and mining filler | a scrape of mixed provenance |
| `pg19` | the metadata and a few whole books from the validation fold | long narrative: persistent names and relations | the books are public domain |
| `gsm8k` (`--all`) | grade-school math word problems | the narrative part is prose about quantities and transfers | MIT |

## Three stages

1. `fetch.py` — the raw downloads, one directory per dataset, with `SOURCE.json`.
2. `prepare.py` — ONE standard format for the parser: JSON lines under `prepared/`, one SENTENCE per
   record, one file per dataset and split, every record self-describing — `id` (dataset-split-document-
   sentence), `dataset`, `split`, `doc` (the native document, passage, story or book id), `title` where the
   source has one, `sent` (the sentence's index within its document: the availability boundary), `text`,
   `prev` (up to two preceding sentences, for context later), `register`, `domain`, and `task` (pointers
   into the dataset's task — a question id, a queried relation — never parsed). Per-source cleaning lives
   in the adapters: WikiText detokenized, PG-19 unwrapped with the Gutenberg matter dropped, CLUTRR's
   bracketed names stripped, LAMBADA passages with explicit content left out, web text kept to sentences
   of plausible shape, bAbI statements separated from their questions; one shared rule-based splitter
   cuts every source the same way. CounterFact, zsRE and MQuAKE have no adapter: fragments and
   questions, not prose — a consumer test later, not a parsing source.
3. the coverage harness — a stratified sample of the prepared files into `sample/` (the one part of the
   data that is versioned), the parse through the catalog prompt, the validator, the report.

Rules of use: nothing fetched here is copied into a regression suite (a held-out sentence never
comes from a corpus); a dataset that enters the mining substrate is first sampled, partitioned by
family and tier and given its availability boundary in `fusenf/corpora/`, with the catalog version
of the manifest recorded on every parse; the coverage sample is a measurement, not training data.
