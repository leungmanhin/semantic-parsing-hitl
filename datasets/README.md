# datasets/

The public datasets the coverage sample and the mining substrate draw on, one directory per
dataset, fetched by `fetch.py`. Only this file, the script and each dataset's `SOURCE.json` (the
source URL, the sha256 and size of every file as fetched, the licence and a note) are versioned;
the data stays local and is reproduced with

    python datasets/fetch.py            # the default set: the small datasets and slices of the large ones
    python datasets/fetch.py --all      # with the training splits and larger slices
    python datasets/fetch.py --list     # the registry

A re-run keeps a file whose recorded hash still matches and reports one that changed at its source.
Where a dataset has official splits, every public split is in the registry (the training splits
with `--all`); HotpotQA's and DROP's test answers are not public (leaderboards).

| dataset | what it is | why it is here | licence |
|---|---|---|---|
| `hotpotqa` | Wikipedia multi-hop QA with supporting-fact sentences | the coverage sample's main source; questions with answers for the held-out value claim | CC BY-SA 4.0 |
| `drop` | reading comprehension with numbers, dates and spans | the numeric and comparative stress test on real passages | CC BY-SA 4.0 |
| `clutrr` | kinship stories with a queried relation | the public stand-in for the kinship chains NESS uses; relational chaining | CC BY-NC 4.0 (non-commercial) |
| `babi` | the location-tracking task of bAbI (task 1; the other tasks' hosts are gone) | state tracking in a small vocabulary | CC BY 3.0 |
| `counterfact`, `zsre`, `mquake` | fact-editing records, relation questions, multi-hop questions over edited facts | the knowledge-editing track: the record as an editable store, the chainer as the propagation | see each `SOURCE.json` |
| `lambada` | narrative passages with a predicted last word | discourse-dependent prediction on narrative text | CC BY 4.0 |
| `wikitext-103` | good and featured Wikipedia articles | open encyclopedic text: a control for the do-no-harm checks (never mined) and coverage | CC BY-SA 3.0 |
| `openwebtext` | a slice of web pages linked from Reddit | open web text: a control for the do-no-harm checks (never mined) and coverage | a scrape of mixed provenance |
| `pg19` | the metadata and a few whole books from the validation fold | long narrative: persistent names and relations | the books are public domain |
| `gsm8k` (`--all`) | grade-school math word problems | the narrative part is prose about quantities and transfers | MIT |
| `mrpc` | news sentence pairs judged equivalent or not (train 4,076, test 1,725), the original untokenized text | natural paraphrase pairs: does a normalization align paraphrases without merging non-paraphrases | Microsoft Research's terms (verify) |
| `sick` | caption pairs rewritten to keep or change meaning, labelled entailment / contradiction / neutral (9,840) | controlled paraphrase and contrast pairs with human labels; under evaluation | CC BY-NC-SA 3.0 (non-commercial) |

## Three stages

1. `fetch.py` — the raw downloads, one directory per dataset, with `SOURCE.json`.
2. `prepare.py` — ONE standard format for the parser: JSON lines under `prepared/`, one SENTENCE per
   record, one file per dataset and split, every record self-describing — `id` (dataset-split-block-
   sentence, unique), `dataset`, `split`, `doc` (the BLOCK: the native paragraph, passage, story, page or
   book id), `title` where the source has one, `sent` (the sentence's index within its block: the
   availability boundary), `text`, `family`, `role`, `register`, `domain`, and `task` (pointers into the
   dataset's task — queried relations, questions — never parsed). The parser's context for a sentence is
   every earlier sentence of its block. FAMILY = the unit no split may cut (an article, a passage, a story,
   a page, a book; for MRPC the sentences joined by pairs, for SICK also the rewrites of one caption);
   ROLE = the family's role by fixed rules, so that no family is both mined and evaluated: `mine`,
   `evaluate` (the held-out pool each experiment draws its fitting, admission and test sets from, by
   family), `control` (WikiText, OpenWebText), `later` (PG-19, LAMBADA) or `spent` (a family the coverage
   sample drew from: never evaluated). The official splits are not family splits (HotpotQA's validation
   articles recur in train questions, half of one CLUTRR validation split copies train stories, MRPC and
   SICK share sentences or captions across splits), so the rules work by family: HotpotQA evaluates the
   validation questions' gold articles and mines a pool of train articles none of which appears in a
   validation question (`--hotpotqa-pool`); DROP mines train passages not repeated in dev; CLUTRR mines
   every story of a train split; MRPC evaluates the families with a test pair, SICK the families whose
   pairs are mostly in the official test set; bAbI is evaluated only. Beside the sentences:
   `mrpc.pairs.jsonl`, `sick.pairs.jsonl` (the labelled pairs, by block id) and
   `hotpotqa.validation.questions.jsonl` (answers, supporting facts, gold and distractor articles, and
   whether every gold article is still in the evaluation pool). Per-source cleaning lives
   in the adapters: WikiText detokenized, PG-19 unwrapped with the Gutenberg matter dropped, CLUTRR's
   bracketed names stripped, LAMBADA passages with explicit content left out, web text kept to sentences
   of plausible shape, bAbI statements separated from their questions; one shared rule-based splitter
   cuts every source the same way. CounterFact, zsRE and MQuAKE have no adapter yet: their fragments
   become sentences when completed with the dataset's own answers, and their questions need a question
   form in the parser (a query with a placeholder) — later.
3. the coverage harness — a stratified sample of the prepared files into `sample/` (the one part of the
   data that is versioned), the parse through the catalog prompt, the validator, the report.

Rules of use: nothing fetched here is copied into a regression suite (a held-out sentence never
comes from a corpus); a dataset that enters the mining substrate is first sampled, partitioned by
family into its roles (mining, fitting, admission, test) and given its availability boundary, with
the catalog version of the manifest recorded on every parse; the coverage sample is a measurement,
not training data.
