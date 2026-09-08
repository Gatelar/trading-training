-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Les dossiers suffixes '-en' fournissent la version anglaise du parcours.
-- Partie 5 sur 6 : parcours intermediaire, langue en.
-- A executer dans l'ordre : la partie 1 vide la table.
-- Requiert la migration 011 : la colonne langue doit exister.

begin;

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.1', 'Thirty trades, and what they do not say', 'HOOK:
You have thirty compliant trades and a positive average R. The Beginner track asked you to wait for this moment before concluding anything. It lied to you by omission: thirty trades conclude nothing. They only entitle you to start looking.

P: The reason lies in an asymmetry between the two figures you track. The **compliance rate** depends on you alone: thirty observations are more than enough to know whether you apply your rules. The **average R** depends on the market, and the market is noisy. Over thirty trades it produces a number, not a measurement.

P: That is exactly why chapter 6.3 of the Beginner track made you fix compliance first. It was not a matter of moral discipline: it was the only one of the two quantities a small sample lets you measure.

P: The tool that separates them is called the **standard error**: the uncertainty left on an average, given the number of observations. It equals the standard deviation of the results divided by the square root of the number of trades.

CASE: Your average R, with its margin
On a series with 1R losses and 3R gains, the standard deviation of results is about **1.9 R**. That is the figure to remember; it is used throughout this track.
**Over 30 trades**: standard error = 1.9 ÷ √30 = **0.35 R**. For a displayed average R of +0.52 R, the interval at two standard errors runs from **−0.18 to +1.22 R**. It contains zero. Your system could be losing.
**Over 100 trades**: standard error = 1.9 ÷ √100 = **0.19 R**. The same +0.52 R gives an interval of **+0.14 to +0.90 R**. The sign is finally established.
The displayed figure has not moved. What has changed is what you are entitled to say about it.

ERR: The classic mistake
Announcing your average R as a fact. Thirty trades give an exact number — that is indeed what happened — and a false measurement — that is not what will happen. Both statements are true at once, and mistaking the first for the second is the founding error of this level.

KEY: Key points
- Thirty trades measure your compliance, not your expectancy.
- Standard error = standard deviation ÷ square root of n. Quadrupling the sample halves the uncertainty.
- As long as your interval contains zero, you have demonstrated nothing.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.2', 'Run or signal', 'HOOK:
Six losses in a row. You change something. That is where most people destroy a system that was working — and the arithmetic says they were wrong to move.

P: Chapter 6.2 of the Beginner track asked you not to change method on a short run. It asked in the name of common sense. You can now check it instead of believing it.

P: The principle: before you attach meaning to a pattern, ask how many chances that pattern had to occur. A run of six losses is spectacular when it happens to you. It is unremarkable once you count the number of places it could have started.

P: The exact calculation is tedious; an approximation is quite enough for what we do with it here, and it gives the right order of magnitude.

CASE: What variance produces on its own
A system with a 40% hit rate, so 60% losses. Over a sequence of 100 trades:
Probability that a run of **at least 6 consecutive losses** appears somewhere: about **84%**.
Probability for a run of **at least 8**: about **47%**.
In other words: a run of six is near enough guaranteed over a hundred trades, and a run of eight is a coin flip. These are not accidents. They are the patterns a perfectly healthy system produces.
*(Poisson approximation on the expected number of runs. The order of magnitude is reliable, the decimal is not.)*

ERR: The classic mistake
Looking for an explanation for a run. The brain is excellent at finding causes, and it will find them: a change in volatility, some news, a lapse in attention. Those explanations are plausible, free, and usually wrong. The only valid test is the number of chances.

KEY: Key points
- A run of six losses over a hundred trades is expected in more than eight cases out of ten.
- Before interpreting a pattern, count how many chances it had to occur.
- The warning sign is never a run: it is a gap that persists across a whole subsample.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.3', 'Segmenting your journal', 'HOOK:
Your overall average R is a blend. It adds your buys to your sells, your two assets, your mornings and your evenings. Separating that blend once teaches you more than three months of extra trades.

P: **Segmentation** means cutting your sample by a single criterion and comparing the subsamples you get. The useful criteria at this level are few: the direction of the position, the asset, the time of day, the market regime, compliance.

P: One constraint governs the whole exercise: **one criterion at a time**. Two crossed criteria over sixty trades produce cells of fifteen, where chapter 1.1 showed you the uncertainty far exceeds the effect you are looking for.

P: And a gap between two subsamples is not compared to zero. It is compared to the standard error of the difference, which is the standard deviation multiplied by the square root of the sum of the reciprocals of the two counts.

CASE: A gap that may not be one
Journal of 60 compliant trades, overall average R **+0.45 R**.
Segmented by direction: **buys** (34 trades) **+0.78 R** · **sells** (26 trades) **+0.02 R**.
Apparent gap: **0.76 R**. Impressive.
Standard error of the difference: 1.9 × √(1/34 + 1/26) = 1.9 × 0.26 = **0.49 R**.
So the gap is worth **1.5 standard errors**. That is suggestive. It is not established — that would take two standard errors, meaning a gap of 0.98 R.
Conclusion: write the hypothesis down, change nothing, and test it in the next module.

ERR: The classic mistake
Segmenting until you find something. Cut for long enough and a brilliant subsample always turns up in the end. It is the overfitting of module 2 applied to your own journal — and it is its most seductive form, because this is your data and you trust it.

KEY: Key points
- One segmentation criterion at a time. Never two crossed.
- A gap is compared to its standard error, never to zero.
- A segmentation produces a hypothesis. It does not produce a decision.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, '1.4', 'What you cannot conclude', 'HOOK:
The most frequent result of a good journal analysis is "I don''t know yet". That is not a failure of the analysis. It is what it is supposed to produce most of the time.

P: Three conclusions are possible at the end of an analysis. An **established effect** — rare. A **hypothesis to test** — frequent. And **nothing** — the most common case of all. Being able to name the third is the skill of this module.

P: The difficulty is not technical, it is psychological. You have just spent time on this analysis, and the temptation is to produce a conclusion in proportion to the effort. An hour of work seems to deserve better than "nothing".

P: What that restraint buys you is considerable, though: it leaves your system intact long enough for it to become measurable. It is the Beginner track''s compliance, transposed to the scale of a month.

CASE: A whole module, zero decisions
Take the three analyses run here.
**The average R over 30 trades**: interval containing zero. No decision.
**The run of six losses**: expected in 84% of cases. No decision.
**The segmentation by direction**: gap at 1.5 standard errors. A hypothesis, not a decision.
Three analyses, a module''s worth of work, **zero changes**. One line to write: *"hypothesis: sells underperform buys, to be tested"*.
That is the normal yield of this work. It looks meagre. It is far better than the yield of an unjustified change.

ERR: The classic mistake
Turning a hypothesis into a rule. Between "sells seem to work less well" and "I no longer sell" lies exactly the protocol of the next module. Skipping that step means adding an untested rule to a system that had seven tested ones.

KEY: Key points
- Three possible conclusions: established effect, hypothesis to test, nothing. The third dominates.
- An analysis that concludes nothing has done its job.
- Write the hypothesis. Do not change the rule.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 1, 'EX', 'What your statement really says', 'EXF: Skill assessed
Goals 13 and 14: determine whether a gap is variance or a real effect; segment a journal by a single criterion and compare the subsamples.

EXF: Instructions
**Step A.** You are given a journal of 60 trades. Calculate the average R and its standard error, then say whether the sign of the result is established.
**Step B.** Segment that journal by one criterion of your choice out of three. Compare the two subsamples and express the gap in standard errors.
**Step C.** Apply the same approach to your own journal from the Beginner track, then choose your conclusion from three set wordings.

EXF: What the platform must provide
- A supplied journal of 60 trades in a sortable table, carrying the seven fields from the Beginner track plus two columns: direction of the position and session.
- A built-in calculator showing average R, standard deviation and standard error as soon as the selection changes. The user chooses the selection, the machine does the sums: the skill assessed is interpretation, not arithmetic.
- Only one segmentation criterion active at a time. The interface **refuses** the second and says why.
- Step C: import of the user''s Beginner journal. **Fallback required** if that journal is unavailable or holds fewer than 30 compliant trades — a second supplied journal, presented as another user''s, with the same mechanics. The exercise must stay complete in both cases.
- Three selectable conclusion wordings — "established effect", "hypothesis to test", "nothing conclusive" — plus a 120-character free field.

EXF: Worked correction
**Step A.** Average R +0.45 R, standard error 0.25 R, interval from −0.04 to +0.94 R. The sign is **not** established. Most users answer that it is, because the number is positive and sixty trades feel like a lot. Sixty trades are not a lot.
**Step B.** By direction, the gap is worth 1.5 standard errors: a hypothesis. By asset, the gap is small: nothing. By session, the trap is elsewhere — the "evening" subsample holds only 9 trades, and its standard error exceeds 0.6 R. Choosing that criterion and drawing a conclusion from it is the expected error, and the interface must display the count large enough that the user cannot claim not to have seen it.
**Step C.** For almost every user, the only correct answers are "hypothesis to test" or "nothing conclusive". Ticking "established effect" on thirty to sixty trades is wrong whatever figure came out — and that holds even if the figure is excellent. Especially if it is excellent.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.1', 'A hypothesis, not a hunch', 'HOOK:
"Sells work less well" is not testable. "On EUR/USD in H1, my sells have an average R at least 0.3 R below my buys" is. Three specifics separate the two sentences.

P: A usable hypothesis has a **scope** — which asset, which timeframe, under what conditions — a **measured quantity** — average R, hit rate, compliance rate — and a **numerical threshold**.

P: The threshold is the one people forget, and it is the only one that makes the test real. Without it, any result confirms: an improvement of 0.01 R will be enough for you to say it works.

P: You recognise the property. Chapter 4.1 of the Beginner track demanded that a scenario be contradictable by a specific price. It is the same demand, applied to a rule rather than a trade: a hypothesis no result can refute is not a hypothesis.

CASE: The same idea, three times
**"The RSI helps."** No scope, no quantity, no threshold. Nothing to test.
**"The RSI improves my results."** A vague quantity, no threshold. Any positive result will confirm it, including +0.01 R.
**"On EUR/USD in H4, filtering my buys by an RSI above 50 raises my average R by at least 0.25 R over 100 trades."** Scope, quantity, threshold, sample. Refutable, therefore testable.
The third wording takes twenty seconds longer to write. It is the only one that will produce information.

ERR: The classic mistake
Framing the hypothesis after looking at the data. It is the most discreet error at this level: you look at your journal, you notice something, you frame it, then you "test" it — on the very data that suggested the idea. The test can only confirm. It measures nothing except your ability to spot a pattern you have just spotted.

KEY: Key points
- A testable hypothesis = scope + measured quantity + numerical threshold.
- Without a threshold, every result confirms.
- The hypothesis is written before you look at the data that will test it.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.2', 'The sample', 'HOOK:
Thirty trades, a hundred trades, five hundred. These numbers circulate without justification. Here is where they come from — and above all why the one you need depends entirely on the size of the effect you are looking for.

P: The logic is that of chapter 1.1, turned around. You know the uncertainty on an average is two standard errors. For an effect to be detectable, that effect must therefore exceed two standard errors.

P: That gives a simple condition: **n greater than (2 × standard deviation ÷ effect)²**. With the standard deviation of 1.9 R established in module 1, you can work it out in your head.

TABLE: 40,30,30 || Effect you are looking for | Trades needed | Time at 3 trades/week
0.5 R | 58 | 5 months
0.3 R | 160 | 1 year
0.2 R | 361 | 2 and a half years
0.1 R | 1,444 | 9 years

CASE: The row that should make you give up
An effect of **0.1 R** needs about **1,444 trades**. At three compliant trades a week, that is **nine years**.
That effect may well exist. It may even be real and stable. You will never verify it: the time it would take you to establish it exceeds the lifespan of most methods, and of most retail traders.
The conclusion is not discouraging, it is liberating: you can stop hunting for refinements. Only coarse effects are within your reach.

ERR: The classic mistake
Hunting for small edges. The intermediate level is drawn to fine-tuning — a filter that adds 0.1 R, an extra condition that improves things "a bit". Even if perfectly real, those effects are unverifiable at your scale. An edge you cannot measure is not an edge, it is a belief.

KEY: Key points
- n > (2 × standard deviation ÷ effect)². Remember the shape, not the formula.
- An effect of 0.3 R needs about 160 trades, that is a year at your pace.
- Below 0.2 R, nothing is measurable at your scale. Do not go looking.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.3', 'Cutting your data in two', 'HOOK:
You build your rule on some data. You test it on the same data. It works. Of course it works: you made it to.

P: The defence takes two words. The **build sample** is where you search, where you tune, where you are allowed to be wrong as many times as you like. The **control sample** is where you check — and you look at it once.

P: That once is the whole rule. If you go back and tune your rule after seeing the control, it stops being a control: it joins the build sample, and you have nothing left to check anything with.

P: The cut is made **by time**, never at random. Markets behave differently in different periods; a random split mixes the periods and systematically flatters the result, because every piece contains a bit of everything.

CASE: The gap that measures your tuning
200 replayed situations on EUR/USD, cut chronologically: the first 140 for building, the last 60 for control.
Rule tuned on the build sample: **+0.61 R**.
The same rule applied to the control: **+0.12 R**.
The gap between them is not an accident: it is the measure of what your tuning manufactured. Of the 0.61 R obtained, about 0.49 R was noise cut to fit.
That leaves 0.12 R. Over 60 trades, the standard error is 0.25 R. That residue is indistinguishable from zero.

ERR: The classic mistake
Starting again after a bad control. "I''ll adjust it slightly and retest." At that precise second your control is dead and you have no way left to check the new version. What you need then is new data, not new settings — and you have no data in reserve.

KEY: Key points
- Build and control. The cut is made by time, never at random.
- The control is looked at once. After that, it no longer exists.
- The gap between the two measures exactly what your tuning manufactured.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.4', 'Overfitting', 'HOOK:
Bailey and his co-authors established a figure that ought to appear on the splash screen of every backtesting program: with five years of data, forty-five attempts are enough to produce a brilliant and perfectly empty strategy.

P: **Overfitting** means tuning a rule to the noise of a sample rather than to its structure. The mechanism is mechanical: every configuration tried raises the probability that at least one of them looks excellent by pure chance.

P: The exact statement, from their work: *"If only five years of data are available, no more than forty-five independent model configurations should be tried or we are almost guaranteed to produce strategies with an annualized Sharpe ratio in-sample of 1 but an expected Sharpe ratio out-of-sample of zero."*

P: The practical consequence is brutal. **The number of attempts is part of the test''s data**, exactly like the result. A test where the number of configurations tried is unknown is not interpretable — not "less reliable": not interpretable at all.

P: Two other pieces of work confirm the order of magnitude. Bajgrowicz and Scaillet tested **7,846 rules** over 114 years of the Dow Jones: no investor could have picked the future best ones in advance, and the measured performance is entirely wiped out by even modest transaction costs. Harvey, Liu and Zhu, across 316 factors, show that a customary statistical threshold becomes inadequate as soon as the tests multiply.

CASE: Count your attempts, you will be surprised
You decide to test "a moving average". A single idea, apparently.
Periods tried: 20, 50, 100, 200. → **4**
Timeframes: H1 and H4. → × 2 = **8**
Filter above or below the average. → × 2 = **16**
Two assets: EUR/USD and BTC/USD. → × 2 = **32**
You have tested "only a moving average", and you have just made **32 attempts**. Bailey''s limit for five years of data is 45. You are nearly there, and you have not yet added a single other tool.

ERR: The classic mistake
Not counting the attempts you abandoned. Every configuration you tried and then set aside counts, without exception. It is precisely because they were set aside that the one left standing looks good — it is the winner of a competition whose entrants you forgot to count.

KEY: Key points
- The number of configurations tried is part of the test''s data. Write it down before you start.
- Five years of data, forty-five attempts: past that, the result is dressed-up noise.
- An abandoned configuration counts as much as a retained one.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, '2.5', 'The abandonment criterion', 'HOOK:
Write down what would make you give up, before you start. Without that line you are testing nothing: you are looking for a reason to carry on, and you will end up finding one.

P: The **abandonment criterion** is the value, set in advance, below which the idea is thrown away. Its function is to make the test symmetrical: without it, only favourable results trigger a conclusion, and the others trigger another round of tuning.

P: It covers three things at once, and all three are decided beforehand: the **result threshold**, the **sample size**, and the **number of attempts allowed**. Exceeding any one of the three voids the test.

P: It is the invalidation from chapter 4.1 of the Beginner track, moved up a level. There, you wrote the price that would prove you wrong on a trade. Here, you write the figure that will prove you wrong on an idea.

CASE: Four lines worth more than the test
**Hypothesis** — on EUR/USD H4, filtering buys by a 50-period moving average raises the average R by at least 0.3 R.
**Sample** — 200 situations, cut 140 / 60 in chronological order.
**Attempts allowed** — 4 periods maximum. Past that, the test is void and not restarted.
**Abandonment criterion** — if the control gives less than +0.15 R of improvement, the idea is thrown away and not retried for six months.
Those four lines take three minutes. They are worth more than the two hours of testing that follow, because they alone stop the test turning into a hunt for confirmation.

ERR: The classic mistake
Loosening the criterion when the result comes close to it. "0.14 R is nearly 0.15 R." A criterion loosened once will never constrain anything again, and you have just spent 200 irreplaceable situations for nothing. The threshold was set in cold blood precisely so that this argument would not happen in the heat of the moment.

KEY: Key points
- Write the threshold, the sample and the number of attempts allowed before you start.
- A test with no abandonment criterion is not a test.
- Note the date you abandoned an idea. That is what stops you retrying it in three weeks.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 2, 'EX', 'The test you do not rig', 'EXF: Skill assessed
Goals 15, 16, 17 and 18: frame a testable hypothesis, separate build from control, count your attempts, write and respect an abandonment criterion.

EXF: Instructions
**Step A.** Frame your hypothesis: scope, measured quantity, threshold.
**Step B.** Set the sample, the number of attempts allowed and the abandonment criterion.
**Step C.** The simulator replays 140 situations. You apply your rule to each one.
**Step D.** The simulator replays the 60 control situations. Once only.
**Step E.** Conclude: I keep it, or I abandon it — with the figure.
Then the platform compares your result to what chance would have produced on the same sample.

EXF: What the platform must provide
- A hypothesis form with three constrained fields. The submit button stays **disabled as long as the numerical threshold is empty**.
- An attempt counter shown at all times, incremented automatically on every parameter change and **never resettable**.
- The replay of 140 build situations: for each, the user decides "I take it / I don''t take it", and the result in R appears after the answer.
- The replay of the 60 control situations, available **once only**, permanently locked after being viewed.
- **The comparison to chance**, which is the heart of the exercise: the platform replays the same control sample with a random decision, 200 times, and displays the distribution of average R obtained. The user''s result is placed within that distribution.
- **Fallback** if the interactive replay of 200 situations is too heavy: a set of 200 pre-computed results, the user deciding on static situations presented in series. The comparison to chance must be kept in every case — without it the exercise loses all of its teaching.

EXF: Worked correction
The control gives a result clearly below the build sample. It is built that way, and it is representative.
The turning point is the comparison to chance. Across the 200 random draws, the distribution of average R typically spreads from −0.4 to +0.4 R. The user''s result almost always falls inside it — meaning it is indistinguishable from a decision taken at random on the same situations.
The expected conclusion is **I abandon it**. Most users nevertheless write "I keep it", for two reasons that add up: the figure is positive, and the exercise cost them time. That is exactly the bias the abandonment criterion exists to neutralise — and that criterion had been written at step B, by the user, twenty minutes earlier.
The second lesson is in the counter. Most users reach step D with more than twenty attempts on it, without having noticed. The platform reminds them on the final screen, alongside the limit of 45 from chapter 2.4.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.1', 'What an indicator calculates', 'HOOK:
Three indicators, three formulas, three lines. You are about to see that none of them contains information you have not had in front of you since module 3 of the Beginner track.

P: A **moving average** of period n is the average of the last n closes. An **RSI** of period n compares the average of the rises to the average of the falls over those n periods and maps the ratio onto a 0 to 100 scale. An **ATR** — *average true range* — is the average true range of the last n candles.

P: What they have in common is obvious the moment you write them down: each is a function of the four numbers from chapter 3.1 of the Beginner track. None reaches any extra data, and each loses some — that is the definition of a summary.

P: What separates them matters more. The moving average and the RSI claim to say something about the direction to come. The ATR claims nothing: it measures a past distance. That is what makes it the only one of the three usable without a protocol.

CASE: A moving average''s lag, in hours
A 50-period moving average on H4 candles sums up 50 × 4 = **200 hours**, about eight trading days.
Price moves; the average follows it with a structural lag of roughly half its period, that is **about four days**.
Direct consequence: a moving average **cannot** signal a reversal. It can only confirm that a move has been going on for a while.
This is not a setting problem a better parameter would fix. It is the definition of an average.

ERR: The classic mistake
Hunting for the right setting. The question "50-period or 200-period?" assumes there is an answer that holds over time. What it mostly does is generate attempts — and chapter 2.4 has just told you what each attempt costs against the credit of your final result.

KEY: Key points
- Moving average, RSI and ATR are functions of the same four numbers. None adds information.
- A moving average lags by about half its period. That is structural, not adjustable.
- A tool that measures and a tool that claims to predict are not used the same way.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.2', 'Measuring is not predicting', 'HOOK:
The ATR will never tell you where price is going. It tells you how much it usually moves — and that piece of information you can use today, with no test first.

P: Chapter 2.4 of the Beginner track put the stop below the last low. That placement is still correct and is not revised. It simply ignores one variable: the same distance in pips does not carry the same risk of being hit depending on how volatile things are at the time.

P: The ATR supplies that variable. The rule of use fits in one comparison: a stop less than **1 ATR** away will be hit by ordinary noise; a stop beyond **3 ATR** pays for an invalidation that is too far off. Between the two, the distance is consistent with what the market is currently doing.

P: A word about **volume**, since you will see it everywhere else. On BTC/USD, traded volume is real data, measured by the exchanges. On spot EUR/USD there is no centralised volume at all: what your chart shows is **tick volume**, that is, the number of price changes recorded by your broker alone. It is a measure of activity at one intermediary, not a market volume. This track builds nothing on it, and you now know why.

CASE: The same stop, two different markets
EUR/USD in H1, **ATR 14 = 22 pips**.
Stop 12 pips away = **0.55 ATR** — it will be hit by an ordinary candle, without any invalidation having occurred.
Stop 32 pips away = **1.45 ATR**, placed below the last low. Consistent with both criteria.
Stop 80 pips away = **3.6 ATR** — the structure does not justify it; you are paying for somebody else''s uncertainty.
Three weeks later the ATR falls to 11 pips. That same 32-pip stop is now worth **2.9 ATR**: too wide for the context. Your distance has not moved, the market has.

ERR: The classic mistake
Fixing a stop distance once and for all. "I always use 30 pips" ignores that 30 pips is 1.4 ATR one day and 3 ATR another. The Beginner track taught you not to set your stop by your budget; this level adds one prohibition: do not set it by habit either.

KEY: Key points
- The ATR measures a usual distance. It predicts nothing, and that is exactly its virtue.
- Always compare your stop to the current ATR: between 1 and 3, or justify it.
- The volume shown in forex is not a market volume. Build no rule on it.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.3', 'The filter', 'HOOK:
An indicator does not tell you what to take. At best it tells you what not to take — which is already considerable, since chapter 4.5 of the Beginner track showed that selectivity is a performance variable in its own right.

P: A **filter** is a condition that removes trades from a set your reading has already produced. It never creates a trade, and that constraint is not decorative: it is what stops the tool turning back into a signal.

P: The correct sequence is fixed, and the filter comes last in it. Reading the structure (Beginner 3.3), then scenario and invalidation (4.1), then checklist (4.4), then filter. Nothing moves up that order.

P: That position has a methodological consequence people forget every time. A filter cannot be judged on the winning trades it brings in — it brings in none. It is judged on what it **removes**: were the deleted trades worse than average?

CASE: What a filter removes, and what it costs
Sample of 100 trades, average R **+0.40 R**.
The filter removes **30** of them.
The 30 removed trades had an average R of **−0.10 R**. The 70 remaining: **+0.61 R**.
So the filter worked on this sample. Whether that result survives chapter 2.3 remains to be seen, and it is not a given.
Note the price too: 30% of the opportunities gone. At three compliant trades a week you drop to 2.1 — and the time needed to measure anything at all rises by a third.

ERR: The classic mistake
Using a filter to enter. The moment you catch yourself thinking "the RSI has just crossed back above 50, I''m buying", you have reversed the sequence. The filter has become a trigger, and you have just contradicted everything module 3 of the Beginner track established. The reversal is easy to spot: it happens when the tool gives you an idea instead of taking one away.

KEY: Key points
- A filter subtracts. It never adds a trade.
- It is judged on the quality of what it removes, not on what it lets through.
- It costs opportunities, therefore measuring time. Count that cost before adopting it.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.4', 'Putting a tool through the protocol', 'HOOK:
Here is the complete test, from first step to last, on a real case. It takes an hour. It is the only hour in this track that will tell you whether a tool deserves to stay on your screen.

P: The protocol takes module 2 whole, in order: hypothesis, sample and cut, attempts allowed, abandonment criterion, build, control looked at once, written decision. Seven steps, none optional.

P: What follows is a real test in its full unfolding, including its conclusion — which is the most frequent conclusion of all tests of this kind.

CASE: A test, end to end
**Hypothesis** — on EUR/USD H4, taking buys only when price is above its 50-period moving average raises the average R by at least 0.3 R.
**Sample** — 200 situations, 140 for building, 60 for control, cut by time.
**Attempts allowed** — 3 periods: 20, 50, 100.
**Abandonment criterion** — less than +0.15 R on the control and the idea is thrown away, not retried for six months.
**Build** — 20-period: +0.18 R · 50-period: **+0.44 R** · 100-period: +0.31 R. Three attempts spent, the 50 is kept.
**Control**, looked at once: **+0.09 R**.
**Decision** — below the criterion. **Thrown away**, with the date, in the test log.

ERR: The classic mistake
Keeping it anyway, "because 0.09 is still positive". Over 60 control trades the standard error is about 0.25 R: a result of +0.09 R is rigorously indistinguishable from zero. The criterion was set at 0.15 R precisely so that this argument would not happen now, just after you have spent an hour on the test.

KEY: Key points
- Seven steps, in order, before a tool stays on your screen.
- Most ideas die at the control. That is normal operation, not failure.
- Note the date of abandonment. That is what stops you retesting the same thing on a loop.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, '3.5', 'What each tool costs', 'HOOK:
Every tool you add has a price, and it is not paid in euros. It is paid in opportunities, attempts and attention — three currencies you hold in very limited quantity.

P: **Cost in opportunities.** A filter that removes 30% of trades lengthens the time needed to reach a given sample by about 43%. Chapter 2.2 showed you what that time amounts to.

P: **Cost in attempts.** Every tool multiplies the number of configurations to explore. Two tools with four settings each do not make eight combinations, they make sixteen — and the counter from chapter 2.4 rises accordingly.

P: **Cost in attention.** A crowded screen lengthens the decision and weakens the checklist, which chapter 4.4 of the Beginner track established is only worth anything if it applies mechanically. One more tool is one more question to answer under pressure.

CASE: The second filter you will not add
You have one filter in place. You are considering a second.
**Opportunities** — the first removes 30%, the second removes 25% of what is left. You are down to 52.5% of the trades: at three a week, that is **1.6**.
**Attempts** — 4 settings × 4 settings = **16 configurations**, against 4 before.
**Sample needed** to measure the second one''s effect: 160 trades for an effect of 0.3 R. At 1.6 trades a week, that is **two years**.
The second filter is not a bad idea. It is simply unverifiable at your scale — which, per chapter 2.2, comes to the same thing.

ERR: The classic mistake
Piling up because each addition looks reasonable on its own. No tool taken separately seems expensive. It is the product of the three costs that is, and that product stays invisible as long as you decide one addition at a time.

KEY: Key points
- Three costs: opportunities, attempts, attention. All three can be quantified.
- One tool at a time. Tested, then kept or thrown away, before considering another.
- If measuring an addition''s effect would take two years, you do not add it.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 3, 'EX', 'The tool you throw away', 'EXF: Skill assessed
Goals 19 and 20: describe what an indicator calculates and what it cannot do; put a filter through the full protocol and conclude.

EXF: Instructions
**Step A.** Choose one filter out of three and set its parameter.
**Step B.** Fill in the test sheet — hypothesis, sample, attempts allowed, abandonment criterion — before any access to the data.
**Step C.** Apply the filter to the build sample.
**Step D.** Look at the control. Once.
**Step E.** Decide, holding your result against the criterion you wrote at step B.

EXF: What the platform must provide
- Three filters on offer — moving average, RSI, position of price within the ATR — each with one parameter adjustable within a closed range.
- A four-field test sheet. The "run" button stays **disabled as long as the abandonment criterion is empty**.
- A visible attempt counter, incremented on every parameter change, not resettable.
- A sample of 200 pre-computed situations on EUR/USD H4, cut 140 / 60 in chronological order. The control locks after one viewing.
- A final screen showing, side by side: build average R, control average R, **standard error of the control**, and the criterion the user wrote at step B, copied out unchanged.

EXF: Worked correction
All three filters are calibrated to produce a control between +0.05 and +0.15 R — so at or below any reasonable criterion, and in every case indistinguishable from zero with a standard error of 0.25 R over sixty trades.
The right answer is **I abandon it**, for all three. This is not a trick: it is the real survival rate of ideas of this kind, and chapter 3.4 said so explicitly.
Two errors are expected. The first: keeping the filter that returned exactly +0.15 R, by rounding the criterion mentally in the convenient direction. The second, more serious: **running again with another parameter after a bad control**. The platform deliberately allows it, increments the counter, and points it out on the final screen — by that stage the control has been viewed, it no longer exists, and the second test is worth precisely nothing. It is the most effective demonstration of chapter 2.3, because the user has just produced it themselves.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.1', 'The trade does not stop at the entry', 'HOOK:
The Beginner track taught you to enter and to place a stop. It deliberately left aside everything that happens between the two. And yet a considerable share of your average R lives there.

P: With a position open, three interventions are possible: do nothing, reduce the position, move the stop. Each changes the expectancy, and none is neutral — including the first, which is a choice exactly like the others.

P: The principle governing this module fits in one sentence: **every intervention during a trade is paid for**. The question is never whether it costs, but whether what it earns exceeds what it costs. That question has a quantifiable answer, and the next four chapters quantify it.

P: One difficulty is peculiar to the subject: the intervention is decided with a position open, under pressure. Module 5 of the Beginner track documented what your judgement is worth at that moment. The conclusion follows on its own — the management rule is written **before** entry, along with the stop and the target.

CASE: The same trade, three managements
EUR/USD, entry 1.0852, stop 1.0838 — that is 14 pips, so 1 R — target 1.0895, that is 43 pips, so 3.1 R.
What happens: price rises to 1.0880, falls back to 1.0845, then reaches 1.0895.
**Management A, do nothing**: the initial stop is never hit, the target is reached. **+3.1 R**.
**Management B, exit half at +1.5 R**: (0.5 × 1.5) + (0.5 × 3.1) = **+2.3 R**.
**Management C, stop moved to entry as soon as +2 R is reached**: the return to 1.0845 passes below 1.0852. Hit. **0 R**.
Same trade, same reading, same market. From +3.1 R to zero.

ERR: The classic mistake
Judging a management style on this trade. Here, doing nothing wins. On the next trade — where price falls back to the initial stop without ever reaching the target — management C would have saved 1 R. A management style is judged over a series, never on one case, and that is precisely what the following chapters measure.

KEY: Key points
- Three possible interventions: nothing, reduce, move. None is neutral.
- The management rule is written before entry, exactly like the stop and the target.
- A management style is judged over a series. One trade proves nothing, however spectacular.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.2', 'The partial exit', 'HOOK:
Taking half off halfway. The gesture looks prudent, it justifies itself effortlessly, and its effect on your average R can be calculated exactly.

P: A **partial exit** means closing a fraction of the position before the target. It reduces variance and reduces expectancy: it is a trade-off, not an improvement.

P: What it buys: comfort, and a markedly higher share of trades finishing positive. What it sells: the right-hand side of your distribution, that is, the trades that were going a long way and that pay for everything else.

P: You recognise the mechanism. It is the disposition effect from chapter 5.1 of the Beginner track, in institutionalised form. The difference lies in one decisive detail: here the decision is taken in cold blood and applied uniformly, which makes it measurable.

CASE: What comfort costs, exactly
100 trades, stop at 1 R, target at 3 R, 40% hit rate.
**Without a partial exit**: (0.40 × 3) − (0.60 × 1) = **+0.60 R** per trade.
**With half taken off at +1.5 R**, given that a winner necessarily passes through 1.5 R before reaching 3 R, and assuming a quarter of the losers touch 1.5 R before returning to the stop:
winners: 0.40 × [(0.5 × 1.5) + (0.5 × 3)] = **+0.90**
losers that touched 1.5 R: 0.60 × 0.25 × [(0.5 × 1.5) + (0.5 × −1)] = **+0.04**
losers that touched nothing: 0.60 × 0.75 × (−1) = **−0.45**
Total: **+0.49 R** per trade.
The price of comfort: **18% of the expectancy**. What it buys: the share of trades finishing positive goes from 40% to 55%.

ERR: The classic mistake
Adopting the partial exit to "lock things in", without having done this calculation. The choice is perfectly defensible — if you know it costs you 18% of your expectancy and you judge the drop in variance more valuable. What is not defensible is adopting it in the belief that it improves the result.

KEY: Key points
- The partial exit swaps expectancy for comfort. It is a trade-off, not a gain.
- In a standard case it costs 18% of the average R and takes the share of positive trades from 40% to 55%.
- If you adopt it, apply it to every trade. Otherwise you are no longer measuring anything at all.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.3', 'The trailing stop', 'HOOK:
Kaminski and Lo established a counter-intuitive result: under a random walk, a stop rule always reduces expectancy; in the presence of momentum, it adds to it. So the trailing stop is neither good nor bad. It is conditional.

P: A **trailing stop** is a stop that moves in the direction of the trade, never the other way. Not to be confused with moving a stop in the direction of the loss, which chapter 2.4 of the Beginner track forbids and which stays forbidden without exception.

P: Kaminski and Lo''s result, transposed to your scale: if price behaves like a random walk, cutting a position part-way through removes expectancy, mechanically. If the market is in a persistent trend, the trailing stop captures that persistence and adds to it.

P: The operational consequence is clear. The trailing stop is applied according to the **regime**, not the mood. In a trend readable in the sense of chapter 3.3 of the Beginner track, it has a chance of adding. With no trend, it removes — and there is no setting that corrects that.

CASE: The value is in the condition, not in the tool
100 trades, two regimes.
**60 trades with no trend**: the trailing stop cuts at an average of +0.4 R trades that would have finished at +0.6 R. Cost: −0.2 R × 60 = **−12 R**.
**40 trades in a trend**: it lets them run and captures +2.8 R on average, against +2.2 R at the fixed target. Gain: +0.6 R × 40 = **+24 R**.
**Applied everywhere**: −12 + 24 = **+12 R** over 100 trades.
**Applied only in a trend**: **+24 R**, twice as much, for the same tool and the same setting.
The value does not lie in the trailing stop. It lies in the condition under which it is applied.

ERR: The classic mistake
Applying it in all circumstances because it "protects gains". On the 60 no-trend trades in the example it protected nothing: it converted average gains into small gains, which is the exact definition of the disposition effect — automated this time, and therefore applied without even the remorse that usually goes with it.

KEY: Key points
- The trailing stop adds in a trend and removes without one. That is not a preference, it is a result.
- It never moves in the direction of the loss. The Beginner track''s rule is unchanged.
- Its value rests on the condition under which it is applied, not on its setting.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.4', 'Moving the stop to break-even', 'HOOK:
Moving the stop up to your entry price as soon as the trade is in profit. It is called "getting safe", it seems to cost nothing, and it is the most expensive gesture in this module.

P: **Moving to break-even** puts a stop exactly where the market''s noise will come looking for it. The reason is structural: your entry price is a level the market has just passed through. It has no meaning for anyone but you, and price comes back to it very often before setting off again.

P: Chapter 2.4 of the Beginner track put the stop at the invalidation, that is, at a level justified by the structure. Moving to break-even replaces it with an arbitrary level — and it does so at the precise moment the trade starts working.

P: What it buys is real: the disappearance of loss risk on this trade. What it sells is just as real: a share of the trades that were going to the target.

CASE: Twenty-one losses avoided, twelve targets lost
100 trades, starting expectancy +0.60 R. Break-even triggered at +1 R.
Of the 40 winners, **30% come back through the entry price** before reaching the target: 12 trades go from +3 R to **0 R**.
Of the 60 losers, **35% reach +1 R** before falling back: 21 trades go from −1 R to **0 R**.
New count: 28 winners × 3 = +84 · 12 winners cut = 0 · 21 losers saved = 0 · 39 losers × (−1) = −39.
Total: **+45 R** over 100 trades, that is +0.45 R per trade, against +0.60 R doing nothing.
The feeling is excellent: 21 losses avoided and a third of trades finishing at zero. The count is **25% lower**.

ERR: The classic mistake
Validating this gesture on the memory of the losses avoided. You will remember the 21 times the break-even stop saved you — they produced clean, dated relief. You will not remember the 12 times it cost you 3 R, because those trades closed at zero and left no emotional trace. The journal, though, counted them.

KEY: Key points
- Your entry price has no structural meaning. Putting a stop there is putting it in the noise.
- In a standard case, moving to break-even costs about 25% of the expectancy.
- It leaves a favourable memory and an unfavourable statement. The statement is right.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, '4.5', 'Choose one and hold to it', 'HOOK:
Three management styles, three figures. None is the right answer. The one certain mistake is changing between them every fortnight.

P: Alternating management styles makes the sample uninterpretable. Three styles applied over sixty trades produce three samples of twenty, and chapter 2.2 showed you that at that size nothing is measurable — neither separately nor together.

P: So the rule is: one management style, written down, applied to **every** trade, over a sufficient sample, then measured. To compare two styles you do not alternate them: you apply the first over a hundred trades, you measure it, then the second.

P: There is a shortcut, though, and it is an excellent one. Add an eighth field to the Beginner track''s journal: the **highest point the trade reached before it closed**, expressed in R. With that one number you can recompute after the fact what any management style would have produced, without having had to live through it.

CASE: The field worth three hundred trades
Beginner track journal: seven fields, one of them the result in R.
Add the eighth: **highest point reached, in R**, noted at closing. Three seconds per trade.
Over a hundred trades already taken, that field lets you recompute the expectancy that would have come from a partial exit at 1.5 R, a break-even stop at 1 R, and a trailing stop 1 R away.
Three management styles compared on a sample you already own, instead of three hundred extra trades and a two-year wait. It is the best effort-to-information ratio in the whole track.

ERR: The classic mistake
Changing management style after an unfavourable run. This is chapter 6.2 of the Beginner track applied to management: a short run says nothing, and the change resets your sample counter to zero. A year later you will have tried four styles and will know which one worked for none of the four.

KEY: Key points
- One management style, applied to every trade, measured over a sufficient sample.
- Add the highest point reached in R to the journal: it makes every management style testable after the fact.
- Alternating styles does not produce a comparison. It produces noise in three pieces.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 4, 'EX', 'Three management styles, one series', 'EXF: Skill assessed
Goals 21 and 22: calculate the effect of a partial exit on the average R; decide whether to apply a trailing stop according to the observed regime.

EXF: Instructions
**Step A.** On one replayed trade, watch the three management styles applied in parallel and note the R each one obtains.
**Step B.** Choose **one** style, then apply it to the 40 trades of a replayed series. The choice is locked for the whole series.
**Step C.** The platform recomputes what the other two would have produced on exactly the same series.
**Step D.** Name the regime of the series, and say whether the ranking obtained was predictable.

EXF: What the platform must provide
- Step A: a single replay with the three management styles computed in parallel and displayed side by side, R by R.
- Step B: 40 short replays at speed. The style is chosen before the first trade and **locked** until the last. This is the central teaching constraint of the exercise: without it the user alternates and the exercise teaches nothing.
- Automatic recording, for every trade, of the **highest point reached in R** — the eighth field from chapter 4.5.
- Step C: automatic recomputation of the two styles not chosen from the recorded highs, displaying the three expectancies **and the standard error over 40 trades**.
- Step D: a multiple choice for naming the regime — trend, no trend, mixed — then a question on whether that regime is consistent with the ranking obtained.

EXF: Worked correction
The series of 40 is built in a **mixed** regime: 24 trades with no trend, 16 in a trend.
Expected results: do nothing ≈ +0.58 R · trailing stop ≈ +0.61 R · break-even ≈ +0.44 R.
The ranking is not the point of the exercise. The point is the gap between the first two — 0.03 R — set against the standard error over 40 trades, which is about **0.30 R**. None of the three styles is distinguishable from the other two on this sample. Break-even trails, but even that gap stays inside the noise.
So the right answer at step D is: the regime was mixed, and 40 trades are not enough to settle it. Most users conclude that the style that came top is the best — reproducing, on management, the exact error module 1 diagnosed on the average R. That is deliberate: the same mistake, made twice three modules apart, is what makes it memorable.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.1', 'Three positions at 1%, a 3% risk', 'HOOK:
You have three positions open, each sized at 1% using the formula from chapter 2.3 of the Beginner track. You believe you are risking 1%. Depending on what you have opened, you are risking between 1% and 3%.

P: The Beginner track''s size calculation is correct. It covers one trade in isolation, and it becomes insufficient the second a second position opens. That is not a flaw in the previous track: a beginner holds one position at a time, and talking portfolios to them would have been premature.

P: **Cumulative exposure** is the loss you would take if all your open positions hit their stops in the same market move. It is a different quantity from the sum of the displayed risks, and often a very different one.

P: The question that settles it fits on one line: **can your positions lose together?** If the answer is yes, they are only one position, however your platform counts them.

CASE: Three portfolios, one display
**A** — long EUR/USD 1%, long GBP/USD 1%, long AUD/USD 1%. Three bets against the dollar. A rising dollar hits all three. Real exposure: close to **3%**.
**B** — long EUR/USD 1%, long BTC/USD 1%, short USD/JPY 1%. Three apparently different markets — and three positions that lose if the dollar rises. Real exposure: still high.
**C** — long EUR/USD 1%, short GBP/USD 1%. The two bets largely oppose each other. Real exposure: well below 2%, and so is the potential gain.
In all three cases your platform displays "risk: 1% per position". It is right position by position, and it does not answer the question being asked.

ERR: The classic mistake
Adding positions in the belief that you are diversifying. Opening three major pairs against the dollar is not diversification: it is tripling the stake on a single idea. The Beginner track established that the number of orders correlates with loss; this chapter supplies one precise mechanism for it.

KEY: Key points
- The Beginner track''s size formula is right for one isolated trade, insufficient as soon as there are two.
- Cumulative exposure is what you lose if all your positions hit their stops together.
- Three positions that lose in the same scenario count as one.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.2', 'Correlation', 'HOOK:
EUR/USD and GBP/USD move together with a coefficient commonly measured between +0.81 and +0.95. That figure alone turns two trades into one — and two 1% risks into a risk of almost 2%.

P: **Correlation** is a measure between −1 and +1 of how far two assets move together. At +1 they move identically. At 0 they are independent. At −1 they move in opposite directions.

P: The major pairs are correlated by construction, not by accident: EUR/USD and GBP/USD share the dollar as counterpart, so any move in the dollar shows up mechanically in both. On the crypto side, most pairs run between +0.6 and +0.9 with bitcoin — a portfolio of ten cryptocurrencies is a portfolio of one.

P: You do not need a coefficient to three decimals. Three categories are enough, and they save you from the order-of-magnitude error, which is the only one that costs real money.

CASE: The rule in three lines
**Above +0.7** — a single group. Two 1% trades on EUR/USD and GBP/USD lose together, so their risks **add up**: they count as **2%**, that is your whole limit. To open both and keep some room, cut each to 0.5%.
**Between +0.3 and +0.7** — the second counts half. Two 1% trades count as **1.5%**.
**Below +0.3** — add them normally. Two 1% trades count as **2%**.
And one correction that overrides everything: if the positions are in **opposite directions**, a high correlation **reduces** exposure instead of raising it.
This is not exact in the mathematical sense. It is enough never to be wrong by a factor of three.

ERR: The classic mistake
Chasing precision. Computing a coefficient over a rolling window gives a flattering impression of mastery — and that coefficient changes with the period chosen anyway, sometimes by a factor of two. Three categories applied systematically are worth more than an exact number applied one time in three.

KEY: Key points
- Above +0.7: one group, risks add up. Between +0.3 and +0.7: the second counts half. Below: add them.
- The major pairs share the dollar. They are correlated by construction.
- Opposite directions with a high correlation: exposure falls. Always look at the direction before the coefficient.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.3', 'Session risk, portfolio risk', 'HOOK:
The Beginner track''s seven rules cap what you lose during a session. None of them caps what you lose while you sleep with four positions open.

P: Two limits, two distinct objects. **Session risk** — two losses and the session is over — caps **sequential** losses, the ones that follow one another in time because you keep trading.

P: **Portfolio risk** caps **simultaneous** losses, the ones that arrive together without your having decided anything further. The Beginner track did not cover it because it was addressing someone who opened one position at a time.

P: Both are necessary and neither replaces the other. A perfectly respected session rule protects you not at all if your four positions hit their stops at three in the morning.

CASE: The hole in the seven rules
A perfectly compliant session: you open three positions at 1%, none hits its stop, you close your session. Zero loss, zero rule broken, nothing to reproach yourself with.
Overnight, an announcement pushes the dollar up. Your three positions — all long on pairs against the dollar — hit their stops.
Loss: **3%**. Not one of the seven rules was violated, because not one of the seven was built for this case.
So you need an eighth rule, and it covers what is **open simultaneously**, not what was decided in succession.

ERR: The classic mistake
Believing the seven rules cover everything. They covered the practice of a beginner with one position. Your practice has changed — that is what this level is — and a rule that does not evolve with the practice it governs stops protecting without warning.

KEY: Key points
- Session risk: losses that follow one another. Portfolio risk: those that arrive together.
- The Beginner track''s seven rules cover only the first.
- Your practice has changed. Your rules have to change with it.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, '5.4', 'The cumulative exposure rule', 'HOOK:
One rule, one number, checkable in five seconds before every order. It is the eighth, and it completes the seven from chapter 5.4 of the Beginner track without modifying any of them.

CARD: The eighth rule
**Maximum cumulative exposure: 2%.**
It is worked out by applying the three correlation categories to every open position, plus the one you are considering, and taking the direction of each into account.

P: The choice of 2% is not arbitrary. It allows two independent positions at 1%, or four correlated positions at 0.5%, and it caps the simultaneous loss at twice the loss of a single trade — an order of magnitude the drawdown of chapter 2.5 of the Beginner track makes bearable.

P: The calculation is done **before** the order, like the position size. It becomes the seventh question on your checklist, and it obeys the same rule as the other six: no answer, no trade.

CASE: Four positions, a five-second calculation
Open: long EUR/USD 0.5% · long GBP/USD 0.5% · long BTC/USD 0.5%.
EUR/USD and GBP/USD, correlation above +0.7, same direction: one group, whose risks add up — **1%** for the two of them.
BTC/USD, weakly correlated with both: adds **0.5%**.
Current exposure: **1.5%**.
You are considering a long AUD/USD at 1%. Correlated above +0.7 with the first two and in the same direction, it joins their group: that group would go to 2%, and total exposure to **2.5%**.
Decision: either you take it at **0.5%** — the group goes to 1.5%, exposure to exactly 2% — or you do not take it. There is no third option.

ERR: The classic mistake
Working out the exposure after opening. As with position size in chapter 2.3 of the Beginner track, the order of operations is half the rule: an exposure checked after the order protects nothing, it observes.

KEY: Key points
- Maximum cumulative exposure: 2%. That is the eighth rule.
- Apply the three correlation categories to everything open, plus what you are considering.
- The calculation is done before the order. It becomes the seventh question on your checklist.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 5, 'EX', 'What you are actually risking', 'EXF: Skill assessed
Goal 23: calculate the cumulative exposure of a set of open positions, taking their correlation and their direction into account.

EXF: Instructions
**Step A.** You are shown a portfolio of four open positions. Calculate its cumulative exposure.
**Step B.** A fifth trade is offered. Say whether it passes the 2% rule and, if not, at what size it would.
**Step C.** You are given three portfolios all displaying "1% per position". Rank them from most to least exposed.

EXF: What the platform must provide
- A portfolio screen listing four positions with asset, **direction**, and risk as a percentage. The direction must be as visible as the amount: that is where the exercise''s trap lies.
- A correlation matrix displayed **in three colours** — above +0.7, between +0.3 and +0.7, below — and not as numerical coefficients. The exercise assesses applying the rule, not reading a table of numbers.
- An input field for the calculated exposure, with a tolerance of ±0.25 points.
- Step B: two fields — "passes / does not pass" and "maximum acceptable size".
- Step C: three portfolios to rank by drag and drop, all displaying the same risk per position.

EXF: Worked correction
**Step A.** The trap is the short position. A short GBP/USD in among long EUR/USD **reduces** exposure, even though the matrix shows a high correlation between the two pairs. Strong correlation plus opposite directions equals reduced exposure. It is the most frequent error in the exercise, and it comes from applying the colour rule without looking at the "direction" column.
**Step B.** The fifth trade does not pass at 1% and does pass at 0.5%. Answering "does not pass" without giving the size is incomplete: the skill assessed is precisely knowing what size it would pass at, because that is the answer that lets you take the trade instead of giving it up.
**Step C.** The three portfolios display the same risk per position and have real exposures of **1%, 2% and 3.5%**. The ranking is the only result that matters here, and its lesson fits in one sentence: your platform''s display does not answer the question you have to ask.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.1', 'What a system is', 'HOOK:
A system fits on one page. If yours takes five, it is not a system: it is a collection of exceptions, and you will never be able to test it.

P: A **system** is a set of rules small enough to be applied identically across a whole sample, and precise enough that two people reading it take the same decision in front of the same chart.

P: The quality test is empirical and final: give your system to somebody else. If they cannot take the same decisions as you, your system is not written down — it is in your head, and what is in your head cannot be measured.

P: Six elements make it up: scope, entry condition, invalidation, management, exposure, abandonment criterion. What it does not contain matters just as much: no exceptions, no "unless", no appeal to judgement.

CASE: The transmissibility test
**Version A** — *"I buy when the H4 structure is bullish and price comes back to a zone."*
Two readers, two outcomes. Which zone? How close? With what confirmation? Each will fill the gaps their own way, and you first of all, differently depending on the day.
**Version B** — *"EUR/USD and BTC/USD, structure in H4, entry in H1. I buy if the last two H4 lows are rising and price comes back within 10 pips of a zone that has produced at least two reactions. Invalidation below the low. Stop between 1 and 3 ATR. Management: no intervention. Maximum cumulative exposure 2%."*
Two readers, the same decisions in the great majority of cases. Version B is no longer. It is more precise.

ERR: The classic mistake
Confusing precision with complexity. Adding rules does not make a system more precise: most often it multiplies the situations where two of them contradict each other, and your mood at the time settles it — which is exactly what the system existed to prevent.

KEY: Key points
- A system is transmissible: another reader takes the same decisions as you.
- Six elements: scope, entry, invalidation, management, exposure, abandonment criterion.
- Precision and complexity are not the same thing. Aim for the first.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.2', 'The system document', 'HOOK:
One page, six sections, a date. This document is the only deliverable of the Intermediate track, and it is worth more than everything you have read so far.

UL:
- **Scope** — assets, timeframes, times of day when you operate.
- **Entry** — the condition, worded so that a third party can check it.
- **Invalidation and stop** — where, and within what ATR range.
- **Management** — one only, applied to every trade.
- **Exposure** — the cumulative limit and the correlation categories.
- **Abandonment criterion** — the average R below which the system is reviewed, and over what sample.

P: To those six sections are added two pieces of header information that turn a descriptive document into a measuring instrument: the **date last modified** and the **number of trades since**.

P: Without them you do not know how many trades your current version has been applied over — and module 2 established that with no known sample, no figure is interpretable.

CASE: The header that changes everything
*Version 4 · Modified 12/03 · 47 trades since the last modification · Abandonment criterion: average R below +0.10 R at 100 trades.*
That single line answers three questions immediately: what am I measuring on, since when, and from what point do I start worrying.
Without it, a system modified three times in two months produces a journal of 120 trades that measures **none** of the three versions. The figure exists, it describes nothing.

ERR: The classic mistake
Modifying the document without incrementing the version or resetting the counter. It is the system-level equivalent of the unrecorded trade: the change did happen, it is untraceable, and you will never be able to say what it produced.

KEY: Key points
- Six sections, one page, plus a modification date and a trade counter.
- Every modification increments the version and resets the counter to zero.
- With no counter, your journal measures no particular version.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.3', 'The monthly review', 'HOOK:
Once a month, market closed, three questions and one decision. It is short because that is the only way it gets done every month.

P: **First question: what is my compliance rate?** Below 90%, the review stops here and the decision is about discipline. The average R is not even examined — chapter 6.3 of the Beginner track established that it measures nothing while compliance is low.

P: **Second question: how many trades since the last modification?** Below 100, no modification of the system is allowed, whatever figure is showing. That rule is the hardest to hold to and the most profitable.

P: **Third question: is the average R below my abandonment criterion?** If yes, the system is reviewed. If no, nothing changes. And in every case, re-read the log of abandoned ideas from chapter 3.4 to check that none of them is quietly climbing back in through the window.

CASE: Three months, one revision
**Month 1** — compliance 78%, 40 trades, average R +0.31 R. → *Fix the discipline.* The average R is not discussed; it measures nothing at that level of compliance.
**Month 2** — compliance 94%, 71 trades, average R +0.08 R. → *Change nothing.* The figure is poor and the sample is insufficient. This is by far the hardest of the three decisions.
**Month 3** — compliance 96%, 112 trades, average R +0.04 R, criterion set at +0.10 R. → *Review the system.* Then, and only then, for the first time.
Three months of work, one revision, arriving after 112 trades. That is the normal pace.

ERR: The classic mistake
Revising in month 2. The figure is discouraging, the sample insufficient, and the temptation at its peak precisely because the two combine. Revising at that moment destroys the 71 trades accumulated and starts again from zero — for a system you will now never know worked or not.

KEY: Key points
- Three questions in order: compliance, sample, result. No step is skipped.
- Below 100 trades since the last modification, no modification. No exceptions.
- A review produces one written decision, never two.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.4', 'When to modify, when to do nothing', 'HOOK:
The question is not whether your system should evolve — it should. The question is which event authorises a modification, and there are only three.

P: **First trigger**: the abandonment criterion is met on a sufficient sample. That is the anticipated case, the one the criterion was written for.

P: **Second trigger**: a hypothesis has passed the module 2 protocol, control included. That is the rare case — most hypotheses die before it.

P: **Third trigger**: your practice has changed to the point that the rules no longer cover it. The cumulative exposure of module 5 is the exact example: it did not exist while you had only one position open.

P: Everything else — a run of losses, an article you read, an idea you heard, a disappointing month — authorises nothing at all. And every modification resets the counter to zero: that is the price, and it must be paid knowingly.

CASE: What a modification costs, in weeks
At three compliant trades a week, a hundred trades take **33 weeks**.
A system modified **every two months** never reaches its measuring sample. After a year: six versions, zero measurements, and the sincere conviction of having worked hard.
A system modified **once a year** produces about 78 trades per version. Still insufficient, but the order of magnitude is finally right.
Conclusion: the highest modification frequency compatible with measurement is on the order of **once a year**. That figure surprises everyone, and it comes out of a simple division.

ERR: The classic mistake
Modifying "just one small parameter". A small change resets the counter exactly like a large one: the system applied afterwards is no longer the one from before, and the trades from the two periods do not add up. There is no such thing as a modification that preserves the sample.

KEY: Key points
- Three legitimate triggers: criterion met, hypothesis validated, practice changed.
- Every modification resets the counter and costs 33 weeks.
- One modification a year is the maximum frequency compatible with measurement.', 32);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, '6.5', 'What awaits you in the Experienced track', 'HOOK:
You have a written system, a method for testing it and a rule for revising it. What is missing now is no longer knowledge: it is contact with an environment that does not forgive approximations.

P: The Experienced track deals first with **going live with real money**: slippage, execution quality, the gap between the price asked and the price obtained, and the protocol for reducing size at the start. These are problems simulation cannot set you.

P: It then deals with what real money brings back all at once: the whole of module 5 of the Beginner track — disposition effect, overtrading, the spiral after a loss — this time under conditions where the error costs immediately.

P: What the Intermediate track has not covered, so that you know where to look: choosing a broker, taxation, products other than currency pairs and spot cryptocurrencies, and managing a portfolio beyond three positions.

P: The entry condition for the Experienced track is not a formality: a written system, **100 compliant trades on the current version**, and an average R above your abandonment criterion. Without those three, the Experienced track would be dealing with problems you do not have yet.

CASE: The honest calendar, extended
The Beginner track put **10 weeks** on reaching 30 compliant trades.
The Intermediate track asks for 100 trades on a stable version, so **33 further weeks** at least — and that calculation assumes no revision happens in between, which is optimistic.
From the first chapter of the Beginner track to the end of a properly practised Intermediate: **about a year**.
That duration is not a teaching pose meant to make you wait. It is the result of dividing chapter 2.2 by your rate of trades.

ERR: The classic mistake
Moving to the next level by reading rather than by practice. You can read the Experienced track tomorrow morning, nothing stops you. It will be of no use to you until you have the 100 trades on a stable version — for exactly the same reason the module 2 protocol is of no use without a sample.

KEY: Key points
- Entry condition for the Experienced level: written system, 100 compliant trades, average R above the criterion.
- Going live brings all the behaviour back, under harsher conditions.
- Beginner and Intermediate properly practised: about a year.', 33);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('intermediaire', 'en', 6, 'EX', 'Write your system', 'EXF: Skill assessed
Goal 24: write a one-page system document and run a monthly review ending in a written decision.

EXF: Instructions
**Step A.** Write your system document: six sections, one page.
**Step B.** You are shown three situations. For each, re-read your own document and say what decision it imposes on you.
**Step C.** You are given a month of journal. Run the review: three questions, one decision.

EXF: What the platform must provide
- Step A: a six-section form, **250 characters maximum per section**. That limit is pedagogical, not technical: it makes the system-with-exceptions materially impossible. An automatic header generates version, date and trade counter.
- Step B: three chart situations, with the user''s document **shown permanently alongside**. For each, two buttons — "I take it", "I don''t take it" — and a third, essential one: "**my document does not settle this**".
- Step C: a supplied month of journal showing compliance, number of trades since modification and average R, then three possible decisions of which only one is selectable.
- If the user''s Beginner journal is available, step A pre-fills scope and management from their real trades. **Fallback**: empty sections and an example document available at all times.

EXF: Worked correction
**Step B.** The three situations are chosen so that at least one is not settled by a typical document. So the expected outcome is not a right answer: it is the third button. The correction then asks the user to complete the document on that precise point — and that is the real deliverable of the exercise. A user who never presses "my document does not settle this" has probably answered from intuition rather than from their text.
**Step C.** The supplied month shows compliance 94%, 71 trades since modification, average R +0.08 R, criterion at +0.10 R. The right decision is **change nothing**, because the sample is below 100.
It is an exact reproduction of "month 2" from chapter 6.3, and it is the decision most users refuse to take: the figure is below the criterion, and everything pushes towards acting. The sample rule exists to cover this case and no other — it is never needed when the figures are good.', 34);

commit;
