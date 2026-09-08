-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Les dossiers suffixes '-en' fournissent la version anglaise du parcours.
-- Partie 6 sur 6 : parcours experimente, langue en.
-- A executer dans l'ordre : la partie 1 vide la table.
-- Requiert la migration 011 : la colonne langue doit exister.

begin;

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.1', 'What simulation never charged you for', 'HOOK:
Your statement shows 140 compliant trades and a positive average R. It rests on an assumption you have never had the chance to check: that the price asked and the price obtained are the same number.

P: **Slippage**, or **execution gap**, is the difference between the price at which you request a transaction and the price at which it is concluded. In simulation it is zero by construction. In real trading it is whatever it is, and nobody can tell you in advance how much.

P: The Beginner track made you pay two costs: the spread in chapter 1.2, the overnight charges in chapter 1.4. A third was missing, invisible for as long as a simulation engine hands you the displayed price. That one cannot be deduced from any fee schedule: it has to be measured.

P: A **market order** executes at the best price available the instant it arrives, whatever that price is. Your stop-loss is a market order with a trigger attached. The price you write on it is where it wakes up, not where it serves you.

CASE: What one pip is worth on your trade
Capital €1,000, risk 1%: **1 R = €10**. EUR/USD, stop 20 pips from the entry.
Size = €10 ÷ 0.0020 = **5,000 units**.
One pip on 5,000 units is worth 5,000 × 0.0001 = **€0.50**, that is **0.05 R**.
One pip lost on entry and one pip lost on exit therefore cost **0.10 R per round trip**. Over 100 trades: **10 R**, that is €100.
If your simulated average R is +0.15 R, your 100 trades were worth +15 R. That leaves **+5 R**.
This calculation does not estimate your slippage: it measures your **sensitivity** to it. Replace "one pip" with whatever you measure in chapter 1.2.

ERR: The classic mistake
Thinking in percentage of price. One pip on EUR/USD is about 0.009% of the rate — a reassuring figure, and unrelated to the question being asked. What matters is the gap relative to your stop, not to the price: with a 20-pip stop, one pip is **5% of your risk**. The same gap, on a 100-pip stop, would be 1%.

KEY: Key points
- The execution gap is counted as a fraction of your stop, never as a percentage of the price.
- Stop at 20 pips: one pip is 0.05 R. Ten pips are half a losing trade.
- A stop is a market order with a trigger, not a guarantee of price.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.2', 'Measure it instead of believing it', 'HOOK:
You will find the figure neither here nor anywhere else: the only public measurements come from firms that sell their execution. Yours takes twenty-five trades to obtain, and it is the only one that concerns you.

P: Add a **ninth field** to the journal: the execution gap in R, signed. It is worked out from two prices your platform already knows — the one you asked for, the one you got — and it is recorded like everything else, in R.

P: Measure entry and exit **separately**. They are not the same events: on entry you choose your moment and nothing is waiting for you. At the stop, you are executed at the precise second price moves against you, in a queue that leans entirely one way.

P: That asymmetry is a consequence of the mechanics, not the result of a study. Do not take it on trust: your two columns will tell you within twenty-five trades whether it shows up for you, at your hours, at your size.

CASE: Six executions, one figure
Same system, 20-pip stop, so 1 pip = 0.05 R.
**On entry** — gaps recorded: 0, −1, +1, 0, −1, +1 pip. Sum: **0 pips**.
**On the stop exit** — gaps recorded: −1, −4, 0, −2, −1, −9 pips. Sum: **−17 pips**, that is −0.85 R over six trades, so **−0.14 R per trade**.
Your simulated average R of +0.20 R becomes **+0.06 R** (0.20 − 0.14).
Now take out the −9: the other five exits cost −8 pips, that is −0.08 R per trade. **One trade in six carries half the total cost.**

ERR: The classic mistake
Taking the median. It is −1.5 pips in this record and gives a comfortable, false picture. Expectancy is a mean: it is the mean that goes into its calculation. The median serves another purpose, and a useful one — it tells you your usual cost is not your average cost, and therefore that a month without a bad fill proves nothing at all.

KEY: Key points
- Ninth journal field: the execution gap in R, signed, entry and exit separately.
- The mean goes into the expectancy. The median only tells you what an ordinary day looks like.
- Twenty-five trades are enough for that figure. Chapter 2.1 explains why so few.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.3', 'The moments when price jumps', 'HOOK:
A stop protects you from a movement. It does not protect you from a hole. The difference between the two turns up once or twice a year, and it is settled in one second.

P: A **price gap** is a range of prices in which no transaction took place: the market quotes 40,000, then 38,800, and nothing in between. Your stop sitting in the middle was not ignored. It was triggered, then executed at the first available price.

P: This is no exotic market accident. Andersen, Bollerslev, Diebold and Vega established in 2003 that macroeconomic announcement surprises produce conditional mean jumps in spot exchange rates, within minutes, with a more pronounced effect for bad news.

P: Three families cover almost every case: scheduled announcements, whose timing you know in advance; the weekly foreign-exchange open, which digests a weekend of news; the quiet hours in crypto, where the market stays open without staying liquid.

CASE: The stop that did not serve
BTC/USD at 40,000. Capital €1,000, risk 1%: 1 R = €10. Stop 400 below the entry.
Size = 10 ÷ 400 = **0.025 BTC**. At that size, 400 of movement is indeed worth 1 R.
In a quiet hour, price goes from 40,000 to 38,800 with no transaction in between. Your stop at 39,600 is triggered, then executed at 38,800.
Loss = 0.025 × 1,200 = **€30**, that is **3 R**.
Three times the calculated risk, on a perfectly compliant trade. The Intermediate track''s eighth rule caps cumulative exposure at 2%: this one trade has just cost 3%.

ERR: The classic mistake
Believing the stop bounds the loss. It bounds it when price passes through every level, which is the case the overwhelming majority of the time — and that is exactly why the belief survives so well. The days when it bounds nothing are, by construction, the days when the move is large. The protection disappears at the precise moment it would be useful.

KEY: Key points
- A price gap goes straight through your stop without stopping. Your loss is no longer bounded by your calculation.
- Three families: scheduled announcements, the weekly open, quiet hours in crypto.
- Cumulative exposure and price gaps are two distinct risks. No rule covers both.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, '1.4', 'Your expectancy, recalculated', 'HOOK:
You have an average R, an abandonment criterion and 140 trades. What you are missing is one subtraction — and it is enough to move your system from the good to the bad side of your own criterion.

P: **Net expectancy** is your gross expectancy less the average execution cost you have measured. It, and it alone, describes what your system would produce with real money. The gross figure describes what it produced in an environment that charges nothing.

P: The abandonment criterion in chapter 2.5 of the Intermediate track was written on the gross quantity, for want of anything else. It has to be rewritten on the net one, and that rewriting is a modification of the system document: it increments the version and resets the trade counter to zero.

CASE: The same system, twice
**Gross expectancy**: +0.18 R over 140 compliant trades. Abandonment criterion: +0.10 R. The system passes.
**Measured execution cost**: 0.14 R per trade, entry and exit together.
**Net expectancy**: 0.18 − 0.14 = **+0.04 R**. The system no longer passes.
**And the uncertainty**: with a standard deviation of 1.2 R over 140 trades, the standard error is 1.2 ÷ √140 = **0.10 R**.
+0.04 R give or take 0.10 R is not distinguishable from zero. So the conclusion is not "my system is bad". It is **"I don''t know"**, which chapter 1.4 of the Intermediate track describes as the most frequent result of an honest analysis.

ERR: The classic mistake
Subtracting the cost and keeping the criterion. That criterion was written for a gross quantity; applying it unchanged to a net one tightens it at a stroke, without your having decided or dated the change. It is a system modification disguised as a calculation — the most discreet form of the untracked modification from chapter 6.2 of the Intermediate track.

KEY: Key points
- Net expectancy = gross expectancy − measured execution cost. That is what is compared to the criterion.
- Rewrite the criterion on the net figure, increment the version, reset the counter.
- A net result contained within its standard error concludes nothing, in either direction.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 1, 'EX', 'The same trade, two prices', 'EXF: Skill assessed
Goals 25 and 26: measure the gap between price asked and price obtained and express it in R; recalculate a system''s expectancy with that cost included, and conclude.

EXF: Instructions
**Step A.** Twelve decisions are shown to you and executed in perfect simulation. Note the average R of the record.
**Step B.** The same twelve decisions are replayed, identically, with degraded execution. For each, note the gap between price asked and price obtained, on entry then on exit, and convert it into R.
**Step C.** Calculate the net expectancy, compare it to the supplied abandonment criterion, and choose your conclusion from three set wordings.

EXF: What the platform must provide
- A configurable degraded-execution engine, **asymmetric** between entry and stop exit, drawing gaps from a fat-tailed distribution: at least one of the twelve trades must carry a gap far larger than the other eleven.
- Two columns shown at all times, **price asked** and **price obtained**, and a third computed automatically in R.
- An input field for the average gap in R, tolerance ±0.02 R, and a second one for the net expectancy.
- Step C: three selectable conclusions — "passes the criterion", "does not pass the criterion", "concludes nothing" — with the standard error displayed alongside.
- **Fallback** if degraded execution is not available: two pre-computed records shown side by side, the subtraction left to the user. The instructions must then say explicitly that the gap is read rather than lived, and that this is a teaching loss.

EXF: Worked correction
**Step B.** The trap is the trade with the extreme gap. Many users treat it as an anomaly and remove it from the calculation — a natural gesture, and a wrong one: it is a cost genuinely incurred, and setting it aside amounts to measuring your execution while excluding the moments when it is bad. The record is built so that this single trade carries about half the total cost.
**Step C.** The right answer is **"concludes nothing"**. The net expectancy computed is positive, but smaller than its standard error. "Passes the criterion" is tempting because the number is on the right side; "does not pass" is just as tempting for cautious readers. Both commit the same error — concluding on a figure smaller than its uncertainty — and module 1 of the Intermediate track has forbidden it for the last 100 trades.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.1', 'The first size is not the system''s size', 'HOOK:
Your system document says 1%. It was written by someone who had never paid an execution gap in their life. That someone is you, a few months ago.

P: A **starting stage** is an initial period during which the risk per trade is deliberately below that of your written system, for the sole purpose of measuring your execution cost. It has one question, only one, and it ends when that question has its answer.

P: It is not a trial period, not a warm-up, not a way of easing in. What those three phrasings have in common is that they suggest the stage is preparing something. It prepares nothing: it measures a quantity, and that quantity may perfectly well conclude that there is no next step.

P: The choice of question is not free. It follows from an unpleasant arithmetical fact, which module 2 of the Intermediate track already established in another form: some quantities can be measured in a few weeks, others will never be measured at all.

CASE: Twenty-five trades, or one thousand six hundred
The standard error is the dispersion divided by the square root of the number of observations. To bring it down to a wanted value you therefore need **the square** of the ratio between the two.
**Measuring your execution cost** — dispersion of the gaps: 0.15 R. Precision wanted: 0.03 R. n = (0.15 ÷ 0.03)² = **25 trades**.
**Measuring your expectancy** — dispersion of results: 1.2 R. Same precision wanted: 0.03 R. n = (1.2 ÷ 0.03)² = **1,600 trades**.
Sixty-four times more, for the same precision. At three compliant trades a week: **eight weeks** in the first case, **more than ten years** in the second.
The stage measures the first quantity. It will never measure the second.

ERR: The classic mistake
Expecting the stage to tell you whether the system works with real money. That is the question everyone asks and the one twenty-five trades will not answer — nor two hundred, nor five hundred. A stage that claims to answer it is no longer a measurement: it is an observation period with no criterion, and module 2 of the Intermediate track has a name for that.

KEY: Key points
- The stage measures execution: 25 trades. It does not measure expectancy: that would take 1,600.
- A stage has a single question and an end defined by that question.
- What ends a stage is a measurement obtained, never an impression acquired.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.2', 'The starting stage', 'HOOK:
Four lines, written before the first order, dated. Written afterwards they are no longer rules: they are commentary on what happened.

P: Four elements, not one more. **The fraction** of your system''s risk. **The minimum number of trades**. **The quantity measured**, named precisely. **What ends the stage**, worded so that a third party can see the end without asking you.

P: The fraction is your choice, but it is not free for all that: it has to pass a test. The stage''s worst case — every trade a loser — must stay below the stop threshold the Beginner track''s seventh rule already imposes on you. A fraction that fails that test would turn the measurement into an incident.

CASE: The stage written down, and its worst case
System: 1% risk per trade, so 1 R = €10. **Stage at a quarter**: €2.50 per trade.
Length: **25 compliant trades minimum**, that is about eight weeks.
Quantity measured: execution gap on entry and at the stop, in R, recorded separately.
Worst case bounded: 25 trades all losing would cost 25 × €2.50 = **€62.50**, that is **6.25% of capital**.
The Beginner track''s seventh rule stops everything at 10% monthly drawdown. The stage''s worst case therefore falls **below** your own stop threshold. That is the criterion that validates a fraction, and it is the only one.

ERR: The classic mistake
Choosing the fraction from the amount you feel ready to lose. The reasoning looks prudent, and it is back to front. The fraction is deduced from a threshold you have already written and dated; the amount that feels bearable, on the other hand, changes with the week, with tiredness, with the last result. You spent a year giving yourself rules precisely so as to stop deciding that way.

KEY: Key points
- Four lines: fraction, number of trades, quantity measured, end of the stage.
- The stage''s worst case must stay below your drawdown threshold. That is what validates the fraction.
- The end of the stage authorises nothing. It dates a recalculation.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.3', 'What this stage measures, and what it does not', 'HOOK:
Twenty-five trades will give you one solid figure and one illusion. The figure is your execution cost. The illusion is absolutely everything else.

P: What it really measures: the execution gap on entry, the gap at the stop, how the spread behaves at the hours you operate, and one thing no documentation will tell you — whether your platform does what you think it does when price moves fast.

P: What it does not measure: your expectancy, which the previous chapter put at 1,600 trades. Nor your system''s decay, which is the subject of module 5. Nor your behaviour under real loss, and that is the most serious of the three gaps, because it is the one you will believe you have filled.

CASE: What twenty-five trades do not contain
System with 45% winning trades. Probability that five consecutive trades all lose: 0.55⁵ = **5.0%**.
Over a sequence of 25 trades, the probability of at least one such run appearing is **43%**.
In other words: **more than one stage in two runs its course without your meeting your ordinary worst run.**
And if it does appear, it costs 5 × €2.50 = €12.50, that is 1.25% of capital. You will not really have felt it either.
Over a full year at three trades a week — 156 trades — that same run has a **98%** chance of occurring. It is waiting for you. It simply was not in the sample.

ERR: The classic mistake
Concluding from a calm stage that the move went well. Twenty-five trades at a quarter size produce an emotional experience close to zero, and that is intended: the stage is designed to be bearable. Taking it as proof that real money suits you is like judging a vaccine on the absence of illness during the week of the booster.

KEY: Key points
- The stage measures execution, the spread at your hours, and how your platform actually behaves.
- It measures neither your expectancy, nor the system''s decay, nor your behaviour under loss.
- A calm stage is not information. It is the outcome expected by construction.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, '2.4', 'Staying in simulation is an answer', 'HOOK:
Of the three possible outcomes of a stage, two are written "not now". That is not a quirk of teacherly caution: it is what the arithmetic of the two previous chapters produces.

P: A decision to do nothing is a decision. It is dated, it is written down, it names the measurement it rests on, and it says what would have to change for it to be reviewed. Without those four elements it is not a decision: it is a postponement, and a postponement gets reopened every week.

P: Across 14,799 French clients tracked for four years by the AMF, **89% lose money**. Nothing you have just measured takes you out of that proportion. You measured your execution — a technical parameter, over twenty-five trades. You measured nothing else.

CASE: Three records, three decisions
**Record A** — gross +0.12 R, measured execution cost 0.16 R, net **−0.04 R**. The system loses once executed. Decision: **back to simulation**. The stage did exactly its job, for €62.50 at worst.
**Record B** — gross +0.22 R, cost 0.09 R, net **+0.13 R** over 25 trades. Standard error: 1.2 ÷ √25 = **0.24 R**. The figure is half the size of its uncertainty. Decision: **nothing is concluded**.
**Record C** — same net result, but over 140 trades. Standard error: 1.2 ÷ √140 = **0.10 R**. The sign is established. Decision: the measurement **does not stand in the way** of your committing money. It does not advise it, and it says nothing about what you can afford to lose — that question does not belong to this document.

ERR: The classic mistake
Reading the end of the stage as a green light. A stage issues no authorisation; it removes one objection out of the five or six you ought to have. The others — your savings, your outgoings, your horizon, what losing the whole sum would change in your life — are neither technical nor measurable here, and no course has the material to judge them for you.

KEY: Key points
- Two outcomes out of three, at this stage, are written "not now". That is the normal proportion.
- A favourable measurement lifts one objection among several. It lifts no others.
- Staying in simulation is decided, dated and written down like any other decision.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 2, 'EX', 'The stage you write', 'EXF: Skill assessed
Goal 27: define a reduced-size starting stage and write the measurement criterion — not a result criterion — that authorises its reassessment.

EXF: Instructions
**Step A.** From your system document, write your stage: fraction, number of trades, quantity measured, end of the stage.
**Step B.** Three fractions are offered along with your drawdown threshold. Say which ones pass the worst-case test, and for those that fail, give the maximum number of trades that would make them acceptable.
**Step C.** Three end-of-stage records are shown to you. Choose one of the three decisions for each, and justify it by naming the quantity that settles it.

EXF: What the platform must provide
- Step A: a four-field form, **120 characters maximum** each, with the user''s system document shown permanently alongside. The "end of the stage" field refuses any entry containing a result word — "if it works", "if I''m comfortable", "if I''m winning" — and says why.
- Step B: three fractions, the drawdown threshold taken from the profile, and a worst-case calculator that is visible but **not pre-filled**.
- Step C: three records showing gross expectancy, execution cost, number of trades and computed standard error, with three selectable decisions — "back to simulation", "nothing is concluded", "the measurement does not stand in the way".
- If the user''s system document exists, step A pre-fills the reference risk. **Fallback**: empty fields and an example stage available at all times, with a complete fictional system document.

EXF: Worked correction
**Step B.** The largest fraction fails, and many users validate it anyway because the amount in euros stays modest. That is the back-to-front reasoning of chapter 2.2: the test is not about what feels bearable, it is about a threshold already written down. The second part of the question — the number of trades that would make the fraction acceptable — is what separates a rule understood from a rule learned.
**Step C.** Record B is the one that traps people. Its net expectancy is clearly positive and the reader wants to conclude; its standard error is twice as large. Answering "the measurement does not stand in the way" on record B is the most frequent error in this whole module, and it is exactly the error of chapter 1.1 of the Intermediate track, committed a year later with something real at stake.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.1', 'What 1 R becomes when it is money', 'HOOK:
Ten euros is nothing. Except that it is no longer ten euros: it is the first dated proof that your method can cost you something, and it has your name on it.

P: In simulation, R was a unit of account. It made results comparable and emotions absent — that was its very purpose, and the Beginner track introduced it for that in chapter 2.1. With real money the same unit becomes a signal, and a signal gets processed whether you like it or not.

P: Module 5 of the Beginner track described three documented behaviours to you, which you then spotted in your journal, one at a time, in cold blood, several days later. That was the only way simulation could have you meet them. It is not the way they present themselves.

CASE: The run that is waiting for you
System with 45% winning trades. Probability that five consecutive trades all lose: 0.55⁵ = **5.0%**.
Over the 25 trades of a stage: a **43%** chance of meeting one.
Over 156 trades — a year at three a week: **98%**.
Five consecutive losses at 1% cost **5 R**, that is €50 on capital of €1,000. The amount is small and the event is ordinary.
The amount is not the problem. The problem is that it arrives accompanied by the conviction that something has just broken — and that conviction was not in your simulation.

ERR: The classic mistake
Treating the first real run as information about the system. It is not: module 1 of the Intermediate track established that a run of that length is variance and is distinguishable from nothing at all. What it teaches you is elsewhere — about you — and it appears in no statement.

KEY: Key points
- Five consecutive losses: a 5% chance at every trade, 98% over a full year.
- The run is anticipated by your system. What was not anticipated is its effect on you.
- A run of that length says nothing about the system. The Intermediate track put numbers on that in module 1.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.2', 'The three biases do not come back separately', 'HOOK:
The three biases arrive together, in the same session, and in an order that has its own logic. You had met them one at a time in your journal, in cold blood, several days after the fact.

P: The chain always starts the same way. A compliant loss, no fault. The next trade starts well, and you close it early to "lock it in" — that is the disposition effect, and it looks reasonable since it turns a floating gain into a realised one.

P: Except that a gain of 0.4 R does not offset a loss of 1.0 R. The remaining gap calls for a third trade, which was not in the session''s plan: that is overtrading. And when that one fails in turn, the size of the fourth becomes the only variable that can still close the gap before the close.

P: Every link presents itself as the reasonable repair of the one before. That is what makes them hard to see from the inside: at the moment you commit them, you are not giving in, you are correcting.

CASE: One session, four trades
**Trade 1** — compliant, no fault. Result: **−1.0 R**.
**Trade 2** — compliant entry, target written at +2.0 R, closed at **+0.4 R** to lock it in. Disposition effect.
**Trade 3** — outside the checklist, taken to get back to even. **−1.0 R**. Overtrading.
**Trade 4** — size doubled. **−2.0 R**. The spiral.
Session: −1.0 + 0.4 − 1.0 − 2.0 = **−3.6 R**, that is 3.6% of capital.
What your rules anticipated: "two losses, the session is over" closed the day after trade 3, at **−1.6 R**.
Gap between the session lived and the session planned: **2.0 R**, which is what a system at +0.18 R produces on average over eleven trades.

ERR: The classic mistake
Asking which of the three errors cost the most. The question is badly put: they do not add up, they chain together. Trade 4 exists only because trade 3 failed, and trade 3 exists only because trade 2 returned 0.4 R instead of 2.0 R. Fixing the last link only moves the breaking point back one notch.

KEY: Key points
- The three biases from module 5 of the Beginner track form a chain, not a list.
- Every link presents itself as the reasonable repair of the one before.
- The rule that cuts the chain is the oldest one: two losses, the session is over.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.3', 'The stopping protocol: threshold, duration, resumption', 'HOOK:
Your eight rules close a session. None of them closes an account. As long as everything happened in simulation, that difference had no consequence.

P: A **stopping protocol** is a rule written in advance that suspends all real activity beyond a threshold, for a fixed duration, with a resumption condition a third party could check. Three elements, all of them numerical or dated, none left to judgement in the moment. It is the **ninth rule**, and it completes the seventh without replacing it: the seventh says when to stop, the ninth says for how long and on what condition you resume.

P: The threshold is the hard part, and the error there is systematically in the same direction: too tight. A threshold set inside your system''s ordinary dispersion will fire on a perfectly healthy system, regularly, and you will end up going round it — and then deleting it.

CASE: Two thresholds, only one that holds
System whose results have a standard deviation of 1.2 R per trade. Over a window of 20 trades, the standard deviation of the **sum** is 1.2 × √20 = **5.4 R**.
**Threshold A — stop at −5 R.** It sits inside one standard deviation of ordinary dispersion. It will fire on noise, often, and signal nothing.
**Threshold B — stop at −10 R**, that is 10% of capital: the threshold the Beginner track''s seventh rule already imposes on you. At close to two standard deviations, it no longer responds to noise.
And the cost of stopping: the fixed duration, plus the resumption condition. Twenty compliant trades in simulation, at three a week, is **nearly seven weeks**.
A threshold that is too tight leaves you permanently stopped. It is the stop-in-the-noise of chapter 2.4 of the Beginner track, transposed to the scale of the account.

ERR: The classic mistake
Writing the resumption condition in terms of an inner state. "I resume when I feel clear-headed again" is not checkable, and will be checked favourably the very next morning. A resumption condition is an act observable from outside: a number of compliant trades in simulation, a written review, a date. Exactly the transmissibility criterion of chapter 6.1 of the Intermediate track.

KEY: Key points
- Three elements: a threshold, a duration, a resumption condition checkable from outside.
- A threshold less than one standard deviation from the dispersion fires on noise.
- The resumption condition is a dated act, never a felt state.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, '3.4', 'The rules real money forces you to rewrite', 'HOOK:
Of the eight rules you apply, six pass into real trading without a comma changing. The other two stop protecting without warning — and they are not the ones you would think.

TABLE: 56,44 || Rule | What real money does to it
Fixed risk of 1% per trade | Unchanged
Three trades maximum per session | Unchanged
Two losses: the session is over | Unchanged, and becomes the most useful of the eight
Thirty minutes'' wait after any loss | **To be re-quantified**: the trigger changes
No order without the checklist answers | Unchanged — the checklist itself goes to eight questions
Target and stop not renegotiable | Unchanged
Drawdown of 10% on the month: full stop | **Completed** by the ninth rule, chapter 3.3
Maximum cumulative exposure of 2% | Unchanged, and still blind to price gaps

P: The thirty-minute rule was written for a loss that cost nothing. Its trigger is the fact of losing. With real money, what determines the time you need is not the fact of losing: it is the amount lost, and that varies by a factor of three within a single day.

CASE: The thirty-minute rule, measured
Take from your journal the delay between closing a losing trade and the next order.
**In simulation**: median delay of 34 minutes. The rule is respected effortlessly, because nothing pushes you to get round it.
**In real trading, on two-loss days**: median delay of 9 minutes. The rule was not abandoned — it was got round once, and then every time.
The fix is not to lengthen the duration, which would be got round just the same. It is to change the trigger: **thirty minutes after a loss of 1 R, the whole session after 2 R lost in the day.**
You only get that figure by recording the delay. It is a tenth journal field — and that one is optional, unlike the ninth.

ERR: The classic mistake
Rewriting all eight rules at once when you make the move. A rule rewritten before it has been found wanting is a rule written on a supposition. Six of the eight hold as they are; changing them all together amounts to altering the system on eight points with no sample, which chapter 6.4 of the Intermediate track already forbids for a single one.

KEY: Key points
- Six rules out of eight pass into real trading unmodified. Leave them alone.
- The thirty-minute rule changes trigger: the amount lost, not the fact of losing.
- The seventh rule is completed by the ninth: threshold, duration, resumption condition.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 3, 'EX', 'Your session, degraded', 'EXF: Skill assessed
Goals 28 and 29: recognise in your own journal a behaviour from module 5 of the Beginner track reappearing under real constraint and name the rule that covers it; write a stopping protocol and apply it to a degraded session.

EXF: Instructions
**Step A.** A four-trade session runs under time pressure, with degraded execution and a running result displayed in euros, not in R. At each decision, you choose. The session does not pause.
**Step B.** Once the session is over, your own Beginner-track journal opens beside the session record. Identify the same behaviour in both, and name the rule that covers it.
**Step C.** Write your stopping protocol — threshold, duration, resumption condition — then replay the step A session with that protocol active.

EXF: What the platform must provide
- Step A: a **non-interruptible** session, timed, with the running result displayed **in euros**. It is the only screen in the whole track where R disappears, and that is deliberate: module 3 is about what that conversion does.
- Degraded execution active, with one of the four trades taking a marked gap on the stop exit.
- Step B: import of the user''s Beginner journal, highlighting trades whose result departs from the written target. **Fallback** if the journal is missing or holds fewer than 30 compliant trades: a supplied journal, presented as another user''s, with the same mechanics — the exact fallback from exercise 1 of the Intermediate track.
- Step C: a three-field form, the "resumption" field refusing state-based wordings, and a calculator for the standard deviation of the sum over 20 trades, displayed but not pre-filled.
- **Fallback** if degraded execution is unavailable: the session runs with perfect execution, timer and euro display kept. The essentials of module 3 survive; the execution gap on trade 4 does not.

EXF: Worked correction
**Step A.** The session is built so that closing trade 2 early is **rewarded immediately**: price does indeed come back against the position right afterwards. That is the central trap, and it is an honest one — the disposition effect is not stupidity, it is a gesture that is right often and costs anyway. The record then shows price reaching the target forty minutes later.
**Step B.** The frequent error is to name the spiral, which is spectacular and comes last. The behaviour present **in both journals** is the disposition effect, far more discreet, and it is the first link. A user who finds nothing in their Beginner journal has probably looked for a serious fault where they should have looked for a 0.3 R gap repeated fifteen times.
**Step C.** A threshold below 6 R fires the stop during the step A session, which looks like the right result and is not: the calculator shows that at 1.2 R of standard deviation, that threshold would also fire on an ordinary run. The right answer stops the session by the two-loss rule, not by the protocol. The protocol is never what serves within a single session.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.1', 'When three categories are no longer enough', 'HOOK:
With three positions you have three pairs to examine and you do it in your head in five seconds. With seven you have twenty-one — and you no longer do it at all.

P: Chapter 5.2 of the Intermediate track gave you three correlation categories and a rule that applies to a pair. It was sufficient because at two or three positions the number of pairs stays below the number of positions. That property stops at three, and it stops abruptly.

P: What replaces examining pairs is not a finer calculation. An **exposure group** brings together the positions that lose in the same scenario — it is the question asked in chapter 5.1 of the Intermediate track, turned into a sorting tool. A scenario, unlike a coefficient, does not change value while you are looking at it.

CASE: Three pairs, or twenty-one
Number of pairs to examine = n(n − 1) ÷ 2. **3 positions**: 3 pairs. **5 positions**: 10. **7 positions**: **21**.
At twenty seconds a pair, seven positions demand **seven minutes of checking before every order**. You will not do them, and you will be right not to.
The method that replaces it fits in three lines:
**1.** Group your positions by shared losing scenario.
**2.** Within a group, **risks add up** — three positions at 1% that lose together expose 3%, as chapter 5.1 of the Intermediate track already said.
**3.** Between groups, apply the categories: above +0.3 the smaller counts half, below that they add up, and opposite directions subtract.

ERR: The classic mistake
Extending the pairs rule to five positions by applying it pair after pair. You then get as many results as there are possible orders of examination, and the most flattering one ends up winning — not through bad faith, simply because it comes last and you stop when the figure passes. Grouping, by contrast, does not depend on the order you look in.

KEY: Key points
- The number of pairs grows as the square. Seven positions: twenty-one pairs.
- Within a group that loses together, risks add up. No exceptions.
- Between groups only, the three correlation categories apply.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.2', 'Correlation moves when the market moves', 'HOOK:
You classed your two positions at +0.15 when you placed the orders. They hit their stops within the same hour. Both statements are accurate, and that is the problem.

P: A correlation is measured over a window. It describes what happened in that window, and it will describe the previous regime for the whole duration of the next one. That is not a defect in the measurement: it is what an average does.

P: Mancini, Ranaldo and Wrampelmeyer established in 2013 that illiquidity episodes occur **simultaneously** across currency pairs, with strong commonality. In other words, the moment your diversification ought to serve is precisely the moment it is least present.

CASE: The classification that switches sides
**When the orders are placed** — long EUR/USD 1%, long BTC/USD 1%. Correlation measured over 90 days: **+0.15**. Two distinct groups, so add: exposure announced at **2%**.
**Three weeks later** — an episode of stress lifts the dollar and empties the books. Both positions hit their stops within the same hour. They were not two groups: they were two bets against the dollar.
Realised loss: **2%**. So the addition had given the right figure.
What would have been wrong is replacing it with a half-sum on the strength of that +0.15. The coefficient was not mistaken — the window it was computed over simply did not contain the episode.

ERR: The classic mistake
Lengthening the calculation window to get a "more stable" coefficient. A long window does not stabilise the correlation: it slows its estimate down, and will describe the previous regime to you throughout the next one. Chapter 5.2 of the Intermediate track already settled the question of precision; this chapter adds that slowness is paid for at the worst moment.

KEY: Key points
- A correlation describes the past of the window it is computed over.
- Illiquidity arrives simultaneously across pairs. Diversification is missing when it would serve.
- Group by shared scenario. A scenario is not re-estimated while the market moves.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.3', 'Refusing a position: the order of priority', 'HOOK:
Your limit is reached and a very good trade turns up. The question is not whether it is good: it is. It is which of the five you refuse — and that answer has to exist before the question.

P: Three refusal rules are defensible, and you have to choose exactly one. **The last to arrive**: the trade in front of you. **The worst ratio**: the one whose gain sought relative to risk is lowest. **The biggest group**: the one that would swell the most exposed block.

P: The first has an advantage the other two do not: it reopens no existing position. The other two force you to reassess trades that are already open, with their target and their stop, at the moment another trade appeals to you. That is where the Beginner track''s sixth rule dies, not anywhere else.

CASE: Five positions, one limit
Open: long EUR/USD 0.6% · long GBP/USD 0.6% · long BTC/USD 0.5% · short USD/JPY 0.4%.
Group "the dollar falls": EUR/USD, GBP/USD and the short USD/JPY are three identical bets. Sum: 0.6 + 0.6 + 0.4 = **1.6%**.
Group "crypto", weakly correlated with the first: **0.5%**.
Total exposure: **2.1%**. The 2% limit is exceeded **before** the fifth trade even turns up.
So the fifth is not up for discussion. What is up for discussion is what you do about the 0.1% too many — and if your answer is "I''ll cut an open position", read the previous line again.

ERR: The classic mistake
Making room by cutting an open position. The arithmetic looks neutral: same total exposure, one more trade. It is not. You have just renegotiated an open position in favour of a position that does not exist yet, and you did it with a calculation rather than an emotion — which makes it far harder to spot in your journal.

KEY: Key points
- The order of refusal is written beforehand, never at the moment a good trade turns up.
- By default: the last to arrive. It is the only refusal that reopens nothing.
- Cutting an open position to make room for another is renegotiating. Rule 6 forbids it.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, '4.4', 'The ceiling you can no longer check by eye', 'HOOK:
"Checkable in five seconds before every order," said the Intermediate track of its eighth rule. That was true at three positions. The rule says nothing anywhere about what to do when it stops being true.

P: An **exposure table** is a sheet you keep yourself, outside the platform, with one row per open position and four columns: asset, direction, risk as a percentage, group. Plus a total row. It is updated before the order, like the position size.

P: The eighth rule does not change and neither does the eighth checklist question. What changes is where the answer comes from: a table you keep, no longer a memory. At three positions memory was enough; at five it systematically produces the lowest figure.

CASE: The table, and what it costs
Four columns, one row per position, one total row.
Update before every order: **one row to write and one sum to redo**, about twenty seconds, whatever the number of positions.
Seven minutes for the pair-by-pair examination of chapter 4.1, twenty seconds for the table: a ratio of **1 to 21**.
And above all, a cost that does not grow. That is the only property that matters here: a check whose cost rises with the number of positions will be abandoned at exactly the moment it becomes necessary.

ERR: The classic mistake
Keeping the table inside the broker''s interface. It displays risk position by position and knows nothing of your groups — chapter 5.1 of the Intermediate track already established that. It has a second flaw, particular to real trading: it does not belong to you. The day you change provider, your table disappears, and with it the history that would tell you how long your limit has been exceeded.

KEY: Key points
- Four columns: asset, direction, risk, group. Plus a total row.
- Twenty seconds before every order, whatever the number of open positions.
- The table stays with you. What the broker''s platform holds does not belong to you.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 4, 'EX', 'Five positions, one limit', 'EXF: Skill assessed
Goals 30 and 31: calculate the exposure of a portfolio of more than three positions taking direction and groups into account; decide which position to refuse when the limit is reached, naming the rule that settles it.

EXF: Instructions
**Step A.** You are shown a portfolio of six positions. Form the groups, then calculate the total exposure.
**Step B.** The same portfolio is shown to you three weeks later, with a correlation matrix that has changed category on two pairings. Recalculate, and say whether your original decision would have been different.
**Step C.** A seventh trade turns up with the limit already reached. Apply your refusal rule, written at the previous step, and name the Beginner or Intermediate rule that forbids the other two solutions.

EXF: What the platform must provide
- A six-position portfolio screen with asset, **direction**, risk as a percentage, and a drag-and-drop grouping area — the user forms the groups themselves, the platform never proposes them.
- A correlation matrix in three colours, as in exercise 5 of the Intermediate track, and a "three weeks later" button that changes it without changing the positions.
- A field for total exposure, tolerance ±0.1 points, and a timer for step A, displayed only at the end.
- Step C: three solutions offered — refuse the last to arrive, cut an open position, refuse the worst ratio — and a field for naming the rule broken by the middle solution.
- **Fallback** if drag and drop is unavailable: groups formed by tick boxes, mechanics and correction identical.

EXF: Worked correction
**Step A.** The trap is the short among the longs, as in the Intermediate track — but here it is inverted: the short USD/JPY **joins** the group of bets against the dollar instead of offsetting it, because the dollar is what is being sold in both cases. A user who mechanically applies "opposite directions, subtract" is out by 0.8 points. Direction is read off the scenario, not off the name of the pair.
**Step B.** The expected answer is that the original decision **does not change**, and that is counter-intuitive: two pairings changed category, so something ought to move. Nothing moves, because the groups were formed on scenarios and the scenarios have not changed. That is the whole teaching of chapter 4.2, and it can only be demonstrated by doing it twice.
**Step C.** "Cut an open position" is chosen by a large share of users, because it is the only solution that lets you take the good trade. The rule broken is the Beginner track''s sixth — target and stop not renegotiable — and the difficulty of the exercise is naming it when no target and no stop has been explicitly moved.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.1', 'Bad run or decay: the badly put question', 'HOOK:
Thirty trades without gaining anything. You want to know whether your edge has gone. That question has no answer — not because it is hard, but because it is asked afterwards.

P: **Decay** is the lasting disappearance of a system''s edge. A bad run is a sequence of negative results that comes down to variance. Both produce the same statement, the same feeling and the same urge to do something.

P: Nothing in your data separates them. That is an arithmetical fact, not a shortage of method, and it is not fixed by looking harder. What separates them is elsewhere: in whether a threshold was written beforehand, or was not.

CASE: Fifty trades that prove nothing
System at **+0.15 R** of net expectancy, standard deviation **1.2 R** per trade.
Over 50 trades, the expected sum is 50 × 0.15 = **+7.5 R**, and the standard deviation of that sum is 1.2 × √50 = **8.5 R**.
A sequence of 50 trades finishing at **0 R** therefore sits 0.9 standard deviations below expectation. Perfectly ordinary.
How many trades to detect a fall from +0.15 R to zero? Using the table from chapter 2.2 of the Intermediate track: about **640 trades**, that is more than **four years** at three trades a week.
The conclusion has to be accepted once and for all: **you will never statistically detect the disappearance of your own edge.** This module is about what you do knowing that.

ERR: The classic mistake
Looking for the answer in a slicing of the journal. Segmenting until you find the month it went wrong will always produce a date, since one necessarily exists. Chapter 1.3 of the Intermediate track named that gesture; here it is worse, because the date found then serves to justify a stop or a postponement, and both are paid for in cash.

KEY: Key points
- A run and decay explain the same data. Nothing in the statement separates them.
- Detecting the loss of a 0.15 R edge would take more than four years.
- What settles it is not in the data. It is the date the threshold was written.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.2', 'What the research establishes about the lifespan of an edge', 'HOOK:
Your edge is going to shrink. That is not a prediction about you: it is the best-documented result in the field, measured across hundreds of strategies, and it has an order of magnitude.

P: The loss of performance observed when a rule is applied to data that did not serve to build it is called the **out-of-sample decline**. McLean and Pontiff measured it in 2016 across the 97 variables the literature claimed predicted stock returns: **−26%** out of sample, **−58%** after publication.

P: Falck, Rej and Thesmar extended the work in 2021. The year of publication alone explains **30%** of the variance in that decline, with each year adding about five points. In other words, decay is neither rare nor accidental: it is the rule, and it is accelerating.

P: This work concerns published equity anomalies, not your system, and nothing licenses carrying their coefficient across as it stands. They give an order of magnitude — this is what an ordinary decline looks like when you move from yesterday''s data to tomorrow''s — not a value.

CASE: A decline applied, and what it is worth
Your system: measured gross expectancy **+0.18 R**, measured execution cost **0.14 R**.
Apply the out-of-sample decline of 26%: 0.18 × 0.74 = **+0.133 R**.
Subtract the execution cost: 0.133 − 0.14 = **−0.007 R**.
Three figures, two operations, and the result changes sign.
**This calculation is not a prediction.** It is a sensitivity test: it says that a decline of the order observed everywhere else would be enough to wipe out your edge. It does not say it will happen.

ERR: The classic mistake
Turning the sensitivity test into a forecast — or, just as often, dismissing the decline because "it isn''t about my market". Both gestures have the same cause: wanting a figure where there is only an order of magnitude. The first makes you stop a system that is fine, the second makes you keep one that is not.

KEY: Key points
- McLean and Pontiff, 2016: −26% out of sample, −58% after publication, across 97 variables.
- It is not a coefficient to apply to your system. It is an order of magnitude.
- An edge that does not survive a 26% decline has no margin at all.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.3', 'The test written before the observation', 'HOOK:
A stopping criterion with no false-alarm rate is not a criterion: it is a sentence. Working it out takes two minutes and almost always changes the threshold you were about to write.

P: Four elements, like the abandonment criterion of chapter 2.5 of the Intermediate track, but on a different object. **The quantity** measured. **The threshold**, numerical. **The window** it is measured over. **The action** triggered, written in the present indicative.

P: A criterion''s **false-alarm rate** is the probability that it fires while the system is healthy. It depends on the threshold, but also on the window — the one nobody ever thinks to write down — and the next chapter shows the second weighs more than the first.

CASE: The false-alarm rate of a threshold
Criterion under consideration: "if the net average R of the **last 100 compliant trades** falls below **0 R**, I stop."
Healthy system at +0.15 R net expectancy, standard deviation 1.2 R. Over 100 trades, the standard error of the mean is 1.2 ÷ √100 = **0.12 R**.
The threshold therefore sits (0.15 − 0) ÷ 0.12 = **1.25 standard errors** below the expectancy. The probability of crossing it by pure chance is about **10.6%**.
One chance in nine, **every time you look**. Looking every month on a rolling window, you will stop a perfectly healthy system roughly once a year.
The fix is not about the threshold. It is about the window.

ERR: The classic mistake
Writing the criterion at the moment you need it. A criterion drafted during a bad run is always calibrated not to fire straight away: that is what you are after at that moment, and that is what you get. The Intermediate track''s abandonment criterion is written before the test for exactly the same reason, and module 2 already refused to enable the button without it.

KEY: Key points
- Four elements: the quantity, the threshold, the window, the action.
- Every threshold has a false-alarm rate. Work it out before writing it, not after.
- A criterion drafted during a bad run is calibrated not to fire.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.4', 'The system stopping criterion', 'HOOK:
The abandonment criterion kills a hypothesis under test, and that costs nothing. The stopping criterion closes a system in production, and that costs thirty-three weeks. Confusing the two means paying the second price for the first decision.

P: The **system stopping criterion** applies to a system that is running, with money committed and a journal in progress. The abandonment criterion applied to an idea under evaluation, whose failure left only a dated line in the test log.

P: The difference in cost imposes a difference in calibration. An abandonment criterion can afford to be severe: throwing away a good idea costs one idea. A severe stopping criterion throws away a system and eight months of simulation before any resumption.

CASE: Windows that do not overlap
A **disjoint window** is an evaluation window that shares no trade with the previous one.
Same criterion, same threshold. One single change: it is evaluated **only once per batch of 100 new trades**, never on a rolling window.
At 156 trades a year, that makes **1.56 evaluations a year**.
Expected false alarms: 1.56 × 10.6% = **0.17 a year**, that is one unjustified stop roughly every **six years** — against one a year with the rolling window.
The threshold has not moved by a hundredth. The false-alarm rate has been divided by more than seven, purely because you stopped looking all the time.
And the price of a stop does not move either: 100 compliant trades in simulation before any resumption, that is the **33 weeks** of chapter 6.4 of the Intermediate track.

ERR: The classic mistake
Stopping the system and letting the open positions run. The stop applies to the decision to open, not to what is already committed — that is true, and it is insufficient. Three positions running under a stopped system produce exactly the situation of module 3: management decisions taken with no rule active, on trades you would no longer open today. The criterion has to say what becomes of them.

KEY: Key points
- Abandonment criterion: a hypothesis under test. Stopping criterion: a system in production.
- Evaluate on windows that do not overlap. The threshold does not change, the false alarm does.
- The criterion states what becomes of positions already open. Otherwise they decide alone.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, '5.5', 'Stopping is not failing', 'HOOK:
A stopped system can be retested next year. Lost capital does not come back by the same road, and the arithmetic of that return has been in the Beginner track''s appendices since your first day.

P: The two possible errors do not carry the same price, and it is that imbalance that must govern your threshold. Stopping wrongly costs weeks, a figure known and bounded in advance. Not stopping in time costs capital, and that expense has no written bound.

CASE: The price of hesitation
The table in the Beginner track''s appendices gives the gain needed to return to the starting point.
Stopping at **−10%**: you then need **+11%**. The return is almost symmetrical.
Waiting for **−33%**: you need **+50%**. Waiting for **−50%**: you need **+100%**.
Between the first two rows, the difference is not 23 points of loss. It is the shift from an almost symmetrical return to one that demands half the capital again.
An unjustified stop costs 33 weeks of simulation, roughly every six years. A stop that comes too late costs capital that no rule restores.

ERR: The classic mistake
Treating a stop as a repudiation of the year gone by. The stopped system left you a dated document, a complete journal and an execution measurement that are yours to keep — chapter 6.4 of the Intermediate track calls that precisely a legitimate trigger. What would be lost is not stopping, and no longer being able to say, a year from now, what worked.

KEY: Key points
- The two errors do not carry the same price: one costs weeks, the other costs capital.
- An unjustified stop: 33 weeks, every six years or so. That is a known, bounded price.
- Going back to simulation after a stop is the anticipated course, not a mishap.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 5, 'EX', 'The system you stop', 'EXF: Skill assessed
Goals 32 and 33: distinguish a bad run from decay by means of a test written before the observation; write and date a system stopping criterion, distinct from the abandonment criterion.

EXF: Instructions
**Step A.** Two sequences of 60 trades are shown to you, unlabelled. One comes from a healthy system going through a bad run, the other from a system whose expectancy has genuinely fallen. Say which is which.
**Step B.** Write your stopping criterion: quantity, threshold, window, action. The calculator displays the false-alarm rate of what you write, live.
**Step C.** Your own record — or the fallback one supplied — is run through the criterion you have just written, first on a rolling window then on disjoint windows. Compare the two answers.

EXF: What the platform must provide
- Two sequences of 60 trades generated with genuinely different expectancies, displayed as an equity curve and as a record. No labels, no clues, and an "I cannot know" button.
- Step B: four fields, plus a false-alarm-rate calculator that takes the standard deviation of the user''s system and updates on every keystroke. The "window" field offers rolling or disjoint, with no default value.
- Step C: the user''s real statistics — net average R, standard deviation, number of trades on the current version. **Fallback** if they are missing or cover fewer than 100 trades: a supplied record of 240 trades, presented as another user''s, with the exercise running identically.
- An export of the drafted criterion, dated, ready to add straight to the Intermediate track''s system document.

EXF: Worked correction
**Step A.** The right answer is **"I cannot know"**, and it is the only exercise in the whole track whose right answer is a refusal to answer. The two sequences are built to be indistinguishable over 60 trades: chapter 5.1 showed it would take about 640. A user who picks one has necessarily picked on something other than the data — most often on the shape of the curve, which is exactly what module 1 of the Intermediate track was already teaching them not to read.
**Step B.** The threshold written spontaneously is almost always too high, and the calculator then shows a false-alarm rate above 25%. The correction does not say which threshold to write: it asks you to lower it until the rate is acceptable **to you**, and to note the value chosen. Your tolerance is the free parameter, not the statistic.
**Step C.** The two windows give different answers on the same record in a majority of cases. That is the expected result and it is unsettling: it shows that part of your stopping decision comes down to how often you look, and not to what your system is doing. Choosing the disjoint window is not a trick for stopping less often — it is refusing to let the frequency of observation enter the decision.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.1', 'The broker: what you can check yourself', 'HOOK:
No name appears in this chapter, and that is not a legal precaution. It is that the right criterion was never the provider''s identity: it is what you can verify about them without taking their word for it.

P: Seven checks, all of them doable before you open anything, all of them documentary. None calls for an opinion, none calls for a comparison site, and each ends in a yes or a no.

UL:
- **Licence**: the regulator and the number, checked in the public register kept by that regulator — not on the provider''s own site.
- **Segregation of client funds**: which contractual document states it, and in exactly what wording.
- **Negative balance protection**: contractual or merely regulatory, and for which client status.
- **Standardised warning**: the percentage of losing accounts the provider publishes itself.
- **Execution policy**: is it published, and what does it say about stop orders in the event of a price gap.
- **Overnight charges**: where are they published, in what form, and with what notice of change.
- **History**: how long the statement stays viewable and exportable after a position is closed.

P: What you cannot check before opening is execution quality. It appears in no document, and the figures published on the subject come from firms that sell that execution. That is the other function of the module 2 stage: its twenty-five trades also measure your provider.

ERR: The classic mistake
Choosing on the displayed spread. It is the one figure pushed everywhere, and chapter 1.1 showed it is only part of the cost. A tight advertised spread with a wide execution gap costs more than an average spread well executed — and that comparison you can only make after opening the account, never before.

KEY: Key points
- Seven documentary checks, all doable before opening, all answered yes or no.
- The licence is checked with the regulator, never on the provider''s site.
- Execution quality cannot be checked in advance. It is measured, and that takes 25 trades.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.2', 'The regulatory protections, and what they do not cover', 'HOOK:
There is a European rule that automatically closes your positions to protect you. On capital of €1,000, it fires once you have lost 91.7% of that capital.

P: In 2018 ESMA adopted four measures applying to leveraged contracts offered to retail clients, subsequently carried into national law. They are not alike and they do not protect against the same thing.

UL:
- **Capped leverage**: 30:1 on major currency pairs, 20:1 on non-majors, 5:1 on shares, **2:1 on cryptocurrencies**.
- **Automatic close-out** of positions when account funds fall to 50% of the minimum required margin.
- **Negative balance protection**, account by account: you cannot owe more than you deposited.
- **Standardised warning**: every provider publishes the percentage of its retail client accounts that lose money.

P: The third is no abstract precaution. On 15 January 2015, the abandonment of the floor between the euro and the Swiss franc left client accounts in debit: FXCM announced $225 million of negative balances, and Alpari UK was placed in administration four days later.

CASE: The protection that arrives afterwards
Capital €1,000. EUR/USD, a position of 5,000 units — the one from chapter 1.1.
Margin required at the maximum 30:1 leverage: 5,000 ÷ 30 = **€166.67**.
Automatic close-out at 50% of that margin: **€83.33**.
So your account is closed for you when €83.33 is left, that is after losing **€916.67** — that is **91.7% of the capital**.
In R: **91.7 R**. Your 1% rule will have fired ninety-one times before the regulatory protection shows up once.

ERR: The classic mistake
Reading these measures as risk management. They bound what you can **owe**, not what you can **lose**, and they were calibrated to avoid a market-wide catastrophe, not to preserve your capital. The only rules that protect your capital are the nine you apply yourself, and every one of them fires far earlier.

KEY: Key points
- Four measures: capped leverage, close-out at 50% of margin, negative balance, published warning.
- They bound what you can owe. They do not bound what you can lose.
- On €1,000, automatic close-out comes at −91.7%. Your rules act at −10%.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.3', 'Record keeping: what your journal is not enough to produce', 'HOOK:
Your journal is there for learning. It is not there to answer somebody who asks you, three years from now, what you did in March.

P: A **record** is the exhaustive, dated statement of all your operations, kept for a third party: a tax authority, an accountant, or yourself in three years. It does not replace the journal, and the journal does not replace it.

P: Three differences separate them. The record is **exhaustive** — it also contains the non-compliant trades your journal filters out. It is **factual** — no scenario, no compliance, no commentary. And it is **exportable**, which is its whole reason for being.

UL:
- Date and time opened, date and time closed.
- Asset and direction.
- Position size.
- Opening price obtained.
- Closing price obtained.
- Costs: spread, commissions, overnight charges.
- Result, in the account currency.

CASE: What three years amounts to
Three trades a week for three years: **468 trades**.
Seven fields per trade: **3,276 values**, not counting account movements.
Reconstructing that after the fact, with no export, is not difficult — it is impossible.
And your provider is under no obligation to keep a viewable history indefinitely. That duration is among the seven checks of chapter 6.1: verify it beforehand, not on the day you need it.
A monthly export costs two minutes. Over thirty-six months, one hour twelve. It is the best ratio in the whole track.

ERR: The classic mistake
Keeping only one of them, thinking the other follows from it. A journal filtered on compliant trades is unusable as a record: it leaves out exactly the operations that are most painful to reconstruct. The record is unusable as a journal: it contains neither scenario nor compliance, that is, neither of the two fields that have produced learning since chapter 6.1 of the Beginner track.

KEY: Key points
- The record is exhaustive, factual and exportable. The journal is filtered, interpreted and private.
- Seven fields, exported once a month. Two minutes.
- How long the history is kept is checked before opening, not after.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.4', 'Tax: the questions, never the answers', 'HOOK:
This chapter contains no rate, no threshold and no regime: a tax rule quoted in a document and read two years later is false information. What it does contain are the seven questions that make a consultation useful, and the document to take with them.

P: Three reasons make any answer impossible here. The rules change, sometimes from one year to the next. They depend on your country of tax residence. And they depend on personal circumstances — status, other income, whether the activity is occasional or habitual — that no course can know.

WARN: What follows is dated
This page is current as of September 2026, and its only stable assertion is this: **the applicable tax rules change and depend on your country.** Any list of rates or thresholds, here or anywhere else, must be treated as out of date until checked with a professional or the relevant authority.

P: What this chapter can give you, on the other hand, are the questions. They are asked once, of a professional, with your chapter 6.3 record under your arm — and a prepared consultation costs less than an improvised one.

UL:
- Which regime applies to these instruments, in my country of tax residence, this year?
- Does tax fall due when each position closes or at the end of the tax year?
- Are losses offsettable? Against what, and for how many years?
- What reporting obligations, on which forms, by what deadlines?
- Does an account opened outside my country of residence create an additional obligation?
- What supporting documents must I keep, and for how long?
- At what point does my activity stop being treated as occasional?

ERR: The classic mistake
Looking for the answer on a forum. The answers there are sincere, often accurate for whoever wrote them, and worthless to you: they depend on a country, a year and a personal situation that are not yours. The cost of a consultation is known in advance; the cost of an inaccurate return is not.

KEY: Key points
- No rate, no threshold: they change and depend on your country. This page is dated.
- Seven questions, one consultation, your record under your arm.
- A prepared consultation costs less than an improvised one.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, '6.5', 'What you decide now', 'HOOK:
This document has never told you to commit money, and it will not in the lines that remain. And yet you are reaching the end of three tracks and about a year of practice.

P: The only deliverable of this track is a dated decision. It fits in five lines, it goes into the system document like any other decision, and it names what would have to change for it to be reviewed.

CASE: The decision, written down
**1.** Gross expectancy measured, and over how many compliant trades.
**2.** Execution cost measured, and over how many trades.
**3.** Net expectancy, and its standard error.
**4.** What my criterion says: above, below, or inside the uncertainty.
**5.** My decision, and what would have to change for me to review it.
Filled in: gross +0.18 R over 140 trades · cost 0.14 R over 25 trades · net **+0.04 R**, standard error 0.10 R · **inside the uncertainty** · *I am staying in simulation, I will review this decision at 300 compliant trades.*

P: Across 14,799 French clients tracked for four years by the AMF, **89% lose money**. That figure opened the Beginner track, it closes this one, and nothing in the three documents has taken you out of it: they taught you to measure, not to win.

P: Staying in simulation is not this track''s consolation prize. For most readers who get here it is its correct conclusion — and it needs no justification beyond line 3 of the sheet above.

ERR: The classic mistake
Treating reading this document as a step completed. Nothing has been completed: you have read six modules, and you hold at best six more measurements than before. Nowhere in these three tracks does anyone tell you that you are ready, and the absence of that moment is the most deliberate thing in the whole work.

KEY: Key points
- The deliverable of this track is a dated decision, not an account opened.
- Five lines: gross, cost, net and its uncertainty, what the criterion says, the decision.
- "I am staying in simulation" is a complete answer. It is the most frequent one, and it is right.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('experimente', 'en', 6, 'EX', 'Your decision, dated', 'EXF: Skill assessed
Goals 34, 35 and 36: list the checkable criteria for choosing a provider; build a record and the questions to put to a professional; state a dated decision argued from measurements.

EXF: Instructions
**Step A.** Three anonymised provider sheets are shown to you. For each, say which of the seven checks from chapter 6.1 are possible with the material supplied, and which are not.
**Step B.** You are given a raw statement export. Build the seven-field record, then draw up the list of questions that record lets you put to a professional.
**Step C.** Write your decision in five lines, from your own measurements, and date it.

EXF: What the platform must provide
- Three **entirely fictional** sheets, with no name, no logo, no link: only the documentary items listed in chapter 6.1, some of them deliberately missing. No sheet must be "the right one".
- Step B: a realistic raw export — rows out of order, surplus columns, costs in a separate column — and a seven-field grid to fill by dragging the columns.
- Step C: a five-line form, pre-filled with the user''s real measurements from exercises 1, 2 and 5, and a dated export button to their system document.
- **Fallback** if the user''s measurements are unavailable: the three sets of measurements from records A, B and C of chapter 2.4, the user choosing which one to work on. The decision produced is then marked "exercise" and is not added to the system document.
- No screen in this track may offer a link, a button or a suggestion leading to opening a real account. That prohibition is a design element, not a preference.

EXF: Worked correction
**Step A.** None of the three sheets allows all seven checks, and that is the expected result. The most attractive sheet — tightest spread, smartest presentation — is also the one where the execution policy is missing. Users who rank it first have reproduced, on an exercise screen, exactly the error of chapter 6.1.
**Step B.** The trap is the costs column, separated from the result in the raw export. A record that leaves it out looks complete and is not: it is the one column that will be missing the moment somebody asks for a net figure. The questions for the professional are not marked — their existence is enough.
**Step C.** There is no right decision, and the correction does not judge the one taken. It checks one thing only: that line 5 names a measurable fact that would make you review it. "I''ll review when I feel more comfortable" is refused, for the exact reason of chapter 3.3 — a condition nobody can observe from outside will be observed favourably as soon as you want it to be.', 32);

commit;
