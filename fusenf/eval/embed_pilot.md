# Embedding prior pilot — retro-AE acceptance test (2026-08-21)

Model Qwen/Qwen3-Embedding-8B (bf16, CPU; load 9.5s, encode 82 words 30.1s).
Embeddings sha256 `7ca035a4f7e72cd8…` (determinism pin).

**Acceptance: keep both validated pairs, kill >= 90% of the 93 rejected siblings.**

- validated pairs: automobile/car @ 0.9518, doctor/physician @ 0.9425
- threshold = floor of validated = **0.9425**
- siblings killed below it: **93/93 = 1.0** -> acceptance **PASS**

## Secondary: Tier A ground truth (the prior's known blindness, measured)
| synonym target | cos | control (antonym/near-miss/converse) | cos |
|---|---|---|---|
| buy~purchase | 0.9241 | allow~forbid | 0.8248 |
| buy~acquire | 0.8029 | abandon~continue | 0.7096 |
| repair~fix | 0.8272 | stroll~sprint | 0.6775 |
| repair~mend | 0.7556 | rise~fall | 0.7603 |
| begin~start | 0.9182 | begin~end | 0.8495 |
| begin~commence | 0.8634 | buy~sell | 0.8073 |
| allow~permit | 0.9053 |  |  |
| require~need | 0.7734 |  |  |
| doctor~physician | 0.9425 |  |  |
| car~automobile | 0.9518 |  |  |
| big~large | 0.9419 |  |  |
| difficult~hard | 0.9102 |  |  |

Reading: the prior separates *scenario siblings* from synonyms; it does NOT separate antonyms/converses from synonyms (both are distributional neighbors) — that remains the judges' job. The prior is a candidate FILTER, never evidence.
