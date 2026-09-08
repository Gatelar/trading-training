-- ============ CONTENU DES CHAPITRES ============
-- GENERE AUTOMATIQUEMENT — ne pas modifier a la main.
-- Source : formation/contenu*/ · Regenerer : python formation/push_chapitres.py
-- Les memes fichiers produisent les PDF : les deux ne peuvent pas diverger.
-- Les dossiers suffixes '-en' fournissent la version anglaise du parcours.
-- Partie 4 sur 5 : parcours debutant, langue en.
-- A executer dans l'ordre : la partie 1 vide la table.
-- Requiert la migration 011 : la colonne langue doit exister.

begin;

insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.1', 'What you are actually buying', 'HOOK:
You open the app. EUR/USD shows 1.0850. You click "Buy". Simple question, and almost nobody can answer it on day one: what exactly did you just buy?

P: Not euros. There is no vault, no banknotes, nothing that belongs to you. You have just entered into a contract with your broker: if the euro rises against the dollar, he owes you money; if it falls, you owe him. That is all.

P: Two words you will read hundreds of times. A **position** is that contract for as long as it is open. A **trade** is the whole operation: the entry, the wait, the exit. A trade is judged once it is closed, never while it is running.

P: The price on the screen is not a value either. It is the last agreement struck between a buyer and a seller, a fraction of a second ago. You are not "taking a view on the euro": you are betting that another human being, later, will accept a different price.

P: And there is not one price, there are two. A price at which you can buy, another at which you can sell, always a little lower. The gap between them is called the **spread**. You always enter on the wrong side of it.

CASE: What the first second costs
EUR/USD shows 1.08495 to sell and 1.08505 to buy. You buy, so at 1.08505.
You change your mind within the second and sell back: at 1.08495. The market has not moved a hair, and you have lost **1 pip** — the pip is the fourth decimal of a currency pair, that is 0.0001 on EUR/USD. It is the unit distances are counted in on this market.
On a position of 10,000 units, 1 pip is worth about $1. Twenty round trips in a day: $20. Twenty trading days: **$400**.
On capital of $1,000, you have to make 40% in the year just to cover your costs.

ERR: The classic mistake
The beginner watches *the* price, not *the two* prices. He believes he is level as soon as his order is filled. In reality every trade starts at a loss equal to the spread — and he never adds up what that comes to over a month.

KEY: Key points
- You hold nothing: you have a contract against your broker.
- There are always two prices. You buy at the higher one, you sell at the lower one.
- Every trade starts at a loss. The more you open, the more that loss piles up.', 1);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.2', 'Who is on the other side', 'HOOK:
Your broker gives you a platform, real-time charts, sometimes a welcome bonus and someone at the end of a phone. Nobody does that out of philanthropy. So: where does the money come from?

P: From three places. Commissions taken on every transaction. The spread, that gap between the two prices. And overnight financing charges, billed for every night you keep a position open.

P: None of that is illegitimate: it is a service, and it is paid for. What matters is the shape of the cost. It is **certain and regular**, while your gain is uncertain and irregular. The broker earns when you trade. Not when you win.

P: Now, a distinction you will hear nowhere else, and one that takes away your favourite excuse before you have even invented it. The AMF measured the share of fees in client losses: **14.2%**. The rest — the other 85.8% — comes from the client''s own decisions. Your broker is not your main problem. You are.

CASE: What waiting costs
You keep a $10,000 position open for 30 nights. The overnight charge is 0.02% a night, that is $2.
30 nights × $2 = **$60**.
On capital of $1,000, that is 6% of the account. The market has not moved. You have done nothing wrong. You have just waited.

ERR: The classic mistake
Holding a losing position "until it comes back". Every night adds a cost, and the position whose recovery you are hoping for is the one you pay for longest. In leveraged trading, time is not neutral: it is billed.

KEY: Key points
- Your broker is paid for activity, not for your performance.
- Fees explain 14.2% of losses. The rest is decisions.
- A position held for a long time costs money every night, even standing still.', 2);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.3', 'The numbers nobody shows you', 'HOOK:
Before you learn anything at all, you need to know which statistic you have just joined. This chapter is the most unpleasant in the track. It is also the only one I ask you never to forget.

P: In 2014 the AMF did what nobody had done before: it asked brokers licensed in France for their clients'' actual results. Not fraudulent brokers — legal, regulated firms, the ones whose adverts you see.

P: 14,799 active clients. Four years. The result: **89% lose money**. Average loss per client: €10,887. Total loss across the sample: €161 million.

P: The average lies a little, and in a direction that concerns you. It is dragged down by a few disasters. The figure to remember is the **median: €1,843**. That is the fate of the ordinary client — the one who did nothing crazy, who simply played for a few months and stopped. You are far more likely to be that one.

CASE: The shape of the distribution
Out of the 14,799 clients in the study:
722 clients (4.9%) lost **more than €50,000** each, for a total of €102 million.
121 clients (0.8%) made **more than €24,000** each, for a total of about €10 million.
The tail of losses weighs **ten times** the tail of gains. This is not an even game whose side you pick at random: the rare big winners do not come close to offsetting the rare big losers.

ERR: The classic mistake
"Those people didn''t know what they were doing. I''m going to learn properly." The study isolated the 1,881 clients who were active *every year* for four years — the most experienced in the sample. Result: 87.56% losing, with an average loss of €26,745. The longer they lasted, the more they lost. The AMF concludes that there is no learning effect.

KEY: Key points
- 89% of French clients lose. The median client loses €1,843.
- Experience on its own improves nothing: that is measured, not assumed.
- This track does not claim to reverse those numbers. It gives you the few variables you can actually act on.', 3);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.4', 'Leverage', 'HOOK:
A broker offers to let you deposit €1,000 and move €30,000 on the market. Put like that, it sounds like a gift. It is an accelerator — and an accelerator works in both directions.

P: **Leverage** is the ratio between the size of your position and the money you have actually deposited. Leverage 30: €1,000 drives €30,000. The consequence is pure arithmetic, there is nothing to interpret: a 1% move in the market becomes 30% of your capital.

P: Here is the point almost everyone misses. Leverage does not change the probability that you are right. It makes your analysis neither better nor worse. It changes one thing only: **how fast you are wiped out when you are wrong**.

P: In Europe, your broker closes your positions automatically when your account falls below a regulatory threshold. That mechanism does not protect you from loss. It protects you from debt. An important distinction.

P: Look at what exactly the same market move — a 1% fall — produces at different levels of leverage, on capital of €1,000.

TABLE: Leverage | Position for €1,000 | Loss if the market falls 1%
×1 | €1,000 | €10, or 1% of capital
×5 | €5,000 | €50, or 5%
×30 | €30,000 | €300, or 30%
×100 | €100,000 | €1,000, or all of it

CASE: The order of magnitude that matters
EUR/USD covers on average **0.5% to 0.7% in an ordinary day**. Not a crash, not a surprise announcement: a dull session.
At ×100 leverage, that dull session is 50% to 70% of your capital.
So you need neither an analytical error nor an exceptional event to disappear. A Tuesday is enough.

ERR: The classic mistake
Picking maximum leverage because it is available. Leverage is not a performance setting you push to the top like the volume on a speaker. It is the **result** of a calculation you will learn in the next module — never a default, never a preference.

KEY: Key points
- Leverage ×30: 1% of market becomes 30% of your capital.
- Leverage does not change how right you are, only how fast you are wiped out.
- You never choose a leverage. You calculate a position size, and the leverage follows from it.', 4);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, '1.5', 'What this track will — and will not — teach you', 'HOOK:
In the pages that follow you will find no signals, no winning setup, no indicator said to be secret. So let me tell you straight away what is going to replace all that.

P: Five skills, and every one of them is checkable. Work out what you are risking before you click. Read a bare chart. Write a scenario that a specific price can disprove. Turn down a trade and name the rule that turned it down. Keep a journal and pull a process error out of it.

P: What you will not find: a method that wins, technical indicators, exotic chart patterns, or the slightest opinion on what you should buy. Indicators arrive in the Intermediate track, together with the only thing that makes them useful — a way to test them.

CASE: Look at how the time is split
Of the 70 minutes in this track: **13 minutes** go to reading a chart, and **35 minutes** to risk, decision and behaviour.
That is the exact opposite of the average course, which spends most of its volume on entering a position — that is, on the one moment in the process that has never separated a surviving account from a dead one.

ERR: The classic mistake
Jumping straight to module 3 because "charts are the real trading". The data in chapter 1.3 says otherwise, and it says so across 14,799 people: what separates the survivors from the rest is not the sharpness of their analysis, it is the size of their positions.

KEY: Key points
- No indicators in this track. The bare chart first.
- The order of the modules *is* the content: risk, then reading, then decision.
- Everything happens in simulation. The only capital at stake here is your attention.', 5);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 1, 'EX', 'The cost of starting', 'EXF: Skill assessed
Goals 1 and 2: explain what a price, a spread and a contract against the broker are; calculate the impact of a 1% market move at three levels of leverage.

EXF: Instructions
**Part A.** Six statements are shown to you one at a time. For each: true or false.
**Part B.** Your capital is €1,000. For three levels of leverage, calculate the loss in euros and as a percentage of capital if the market falls 1%.

EXF: What the platform must provide
- A screen with no chart. This exercise must contain no market data at all: it is about mechanisms, not about reading.
- Part A: six true/false cards shown in sequence, no going back, with the correction displayed after each answer.
- Part B: a three-row table (leverage ×5, ×30, ×100) and two numeric input columns — loss in €, loss in %. Validation with a tolerance of ±€1 and ±0.5 points.
- The €1,000 capital is shown at all times in a top bar, and cannot be edited.

EXF: Worked correction
**Part A.** The six statements and their answers:
- *"By buying EUR/USD, I own euros."* — False. You hold a contract against your broker. Tempting because the platform''s vocabulary says "buy".
- *"If the market does not move, I lose nothing."* — False. The spread is taken at entry, the financing charge every night.
- *"The broker wins when I lose."* — False in the general case, and this is the one most often got wrong. The broker is paid for activity: commissions, spread, overnight charges. Your result concerns him only indirectly.
- *"Fees explain most of clients'' losses."* — False: 14.2% according to the AMF. Tempting because it is the most comfortable explanation.
- *"The most experienced clients lose markedly less."* — False. 87.56% losing among clients active four years running.
- *"Leverage improves my chances of being right."* — False. It acts on size alone, never on probability.
**Part B.** Leverage ×5: €50, or 5%. Leverage ×30: €300, or 30%. Leverage ×100: €1,000, or 100%.
The third row is the only one that really counts. Plenty of users compute it correctly and draw exactly the wrong conclusion: "so I just need to not be wrong". No. It means that an **ordinary day** on EUR/USD — no crash, no surprise — is enough to wipe out the account. The question is not how to avoid being wrong. It is how to survive the normal.', 6);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.1', 'The only question that matters', 'HOOK:
Two people take exactly the same trade. Same asset, same second, same price. Six months later one has doubled the account and the other has emptied it. They had the same analysis. They did not have the same position size.

P: The beginner asks "where is it going?". That question has no reliable answer: nobody, anywhere, knows. And yet it takes up 95% of the content you will find on the subject.

P: The professional question is a different one: **"how much do I lose if I am wrong?"**. It has an exact answer, known before you click, independent of anything the market does. It is the only thing you genuinely control.

P: You control exactly three variables: the amount you risk, the level at which you give up, and whether you enter or stay out. You control nothing else. Least of all the price: that one does not belong to you.

P: We call **R** the sum you lose if your scenario is wrong. It is your unit of account for the rest of this track.

CASE: Your unit of measurement
Capital: €1,000. Chosen risk: 1% per trade.
1 R = **€10**.
Whether you trade EUR/USD or BTC/USD, whether the leverage is 5 or 30, whether it is your first trade or your hundredth: a trade puts €10 at stake. Not 9, not 40.
It is the one constant in this track. Everything else adjusts around it.

ERR: The classic mistake
Thinking in position size — "I''ll put in €500" — instead of thinking in risk — "I''m risking €10". Those two sentences have nothing to do with each other. A €500 position with a stop 2% away risks only €10. The same position with no stop risks €500. Size tells you nothing about risk.

KEY: Key points
- The question is not "where is it going", but "how much do I lose if I am wrong".
- Your risk is expressed as a percentage of capital, never as a position size.
- 1 R = the loss accepted on one trade. Count in R from now on.', 7);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.2', 'The 1% rule', 'HOOK:
Everyone repeats "never risk more than 1%". Almost nobody explains where that figure comes from. It comes out of a multiplication you can do yourself, and it takes two minutes.

P: Starting point: even a sound method strings losses together. That is not an accident, it is arithmetic. With a one-in-two chance of winning, a run of seven consecutive losses comes up roughly once every 128 trades — several times a year for someone who trades regularly.

P: So the question is not "how do I avoid losing runs" — you cannot. It is: **"what size of risk makes a losing run survivable?"**

TABLE: 30,35,35 || Risk per trade | Capital after 10 losses | Cumulative loss
1% | €904 | −9.6%
2% | €817 | −18.3%
5% | €599 | −40.1%
10% | €349 | −65.1%

CASE: The trap in the last row
The 10% row does not merely require you to win back the €651 you lost.
To get back to €1,000 starting from €349, you have to make **+186%**.
The 1% row needs +10.6% to break even. The difference at the start was nine points of risk. The difference at the finish is 176 points of performance to produce.

ERR: The classic mistake
Increasing the risk after a losing run, to "win it back". The arithmetic runs exactly the other way: it is precisely when capital is low that every euro risked weighs most heavily as a percentage. Doubling up after four losses is accelerating just as the road narrows.

KEY: Key points
- A run of seven losses is normal. It tells you nothing about your method.
- At 1% per trade, ten losses cost 9.6% of capital. At 10%, they cost 65%.
- The deeper the loss, the more disproportionate the gain needed to erase it.', 8);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.3', 'Calculating a position size', 'HOOK:
This is the one compulsory calculation in the track. Three numbers go in, one number comes out, and that number decides your survival more surely than all the analysis you will do this year.

P: The formula fits on one line:

CARD: The formula
**Position size = (Capital × Risk in %) ÷ Distance to the stop**
The result is a quantity — a number of currency units, a fraction of a bitcoin. Not an amount in euros.

P: You first have to translate the distance to the stop into money. On EUR/USD the unit is the **pip**: the fourth decimal, that is 0.0001. For a position of 10,000 units, 1 pip is worth about $1. On BTC/USD there is no pip: you work directly in dollars per unit of bitcoin.

CASE: Two markets, one calculation
**EUR/USD.** Capital €1,000, risk 1% = €10. Entry at 1.0850, stop at 1.0820: the distance is **30 pips**.
€10 ÷ 30 pips = €0.33 per pip, that is a position of about **3,300 units**.
**BTC/USD.** Capital €1,000, risk 1% = €10. Entry at 62,000, stop at 61,000: the distance is **$1,000**.
€10 ÷ $1,000 = **0.01 BTC**, that is a position of about $620.
Two markets with nothing in common. Same risk: €10.

ERR: The classic mistake
Choosing the size first and the stop afterwards. That is the right order reversed. The beginner decides "I''ll put in €200", places his stop wherever looks reasonable, and discovers his risk after the fact — often after the loss. Size is a **result**, not a decision.

KEY: Key points
- Size = (Capital × Risk) ÷ Distance to the stop. No exceptions, no asset exempt.
- The stop is chosen before the size, never the other way round.
- A wider stop does not increase your risk: it reduces your size.', 9);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.4', 'Where to put a stop', 'HOOK:
You put your stop €20 away, because €20 is what you are willing to lose today. The market does not know your budget. It just passed through, and took you out on the way.

P: A **stop-loss** is an automatic order that closes your position at a level set in advance. Its function is not to cap an amount: it is to mark the point beyond which **your scenario is wrong**. If price reaches it, your reason for being in the trade has gone.

P: Two symmetrical errors. The stop that is too tight: you are taken out by the market''s normal breathing, when your idea was good. The stop that is too wide: your scenario died long ago and you are still paying.

P: A useful order of magnitude: on EUR/USD in H1, an ordinary candle covers 15 to 25 pips. A stop placed 5 pips away will be hit by **noise** — movement with no meaning — not by an invalidation.

CASE: Two stops for the same idea
You buy at 1.0850. The last low visible on the chart is at 1.0822.
**Stop at 1.0845 (5 pips).** Hit within the hour by an unremarkable swing. You were right about the direction and you were taken out anyway. Loss: €10.
**Stop at 1.0818 (32 pips, below the low).** Hit only if the market''s structure genuinely breaks. Matching size: €10 ÷ 32 = €0.31 per pip, that is 3,100 units. Loss if hit: €10.
The second stop is six times wider and **no riskier**. Size absorbed the difference.

ERR: The classic mistake
Moving the stop when price approaches it. That single gesture is what turns a €10 loss into a €200 loss. It always justifies itself beautifully in the moment — "the level was badly placed", "it''ll bounce right after". A stop that has been moved is no longer a stop. It is hope with an order''s name.

KEY: Key points
- The stop goes where your scenario becomes wrong, not where your budget runs out.
- Below the last low for a buy, above the last high for a sell.
- A stop is never moved in the direction of the loss. Never.', 10);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, '2.5', 'Drawdown', 'HOOK:
Your account does not rise in a straight line, and it does not fall in one either. In between there is a trough. It is in that trough that most people give up, or do something stupid.

P: **Drawdown** is the gap between the highest level your capital has reached and where it stands now, as a percentage. It measures what you endure, not what you produce.

P: Its unpleasant property is asymmetry. Losing 50% does not require making 50% to get back: it requires making 100. Loss and recovery are not symmetrical, and the gap between them widens fast.

TABLE: 50,50 || Drawdown endured | Gain needed to break even
−10% | +11%
−20% | +25%
−33% | +50%
−50% | +100%
−65% | +186%

CASE: What the 1% really buys you
At 1% risk per trade, it takes about **69 consecutive net losses** to reach a −50% drawdown.
At 10% risk per trade, it takes **7**.
Seven. That is the number of losses in a row a sound method produces regularly, as we saw in chapter 2.2. At 10% risk, the normal run becomes a terminal event.

ERR: The classic mistake
Measuring your progress solely by the account balance. Two accounts both showing €1,100 are in no way comparable if the first never went below €980 and the second passed through €400. The second got lucky, and worse: it does not know it. It will credit that result to its method.

KEY: Key points
- Drawdown measures what you endure. The balance measures what you show.
- −50% demands +100% to get back. The asymmetry is the real opponent.
- Set your drawdown limit before you need it, not during.', 11);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 2, 'EX', 'Three positions, one risk', 'EXF: Skill assessed
Goals 5 and 6: calculate a position size from a capital, a 1% risk and a stop distance; place a stop at a level justified by the structure of the chart.

EXF: Instructions
**Part A.** You are given three situations. For each one, calculate the position size that corresponds to 1% risk on capital of €1,000.
**Part B.** You are shown a EUR/USD H1 chart with three proposed stop levels. Choose one, then select the reason for your choice.

EXF: What the platform must provide
- Part A: a calculator with four fields — capital (pre-filled at €1,000, locked), risk in % (pre-filled at 1, locked), entry price, stop price — and a free input field for the size. Validation with a tolerance of ±5%.
- The intermediate calculation (distance in pips or dollars) is displayed automatically as soon as entry and stop are entered. The user must see the distance, not guess it.
- Part B: a bare EUR/USD H1 chart, no indicators, showing about thirty candles with one clearly identifiable low. Three stop levels A, B and C drawn as dotted lines. Single selection, then a three-option multiple choice for the justification.
- No display of the market''s future outcome until the answer has been submitted.

EXF: Worked correction
**Part A.**
- *Case 1 — EUR/USD, entry 1.0850, stop 1.0820.* 30 pips. Size: 3,300 units.
- *Case 2 — EUR/USD, entry 1.0850, stop 1.0790.* 60 pips. Size: 1,650 units. This is the case that counts: the stop doubled, the size was halved, and the risk did not move by a cent. Most users expect the risk to double.
- *Case 3 — BTC/USD, entry 62,000, stop 61,000.* $1,000. Size: 0.01 BTC.
**Part B.** The right answer is the stop placed **below the low**.
Why the other two are tempting: the tight stop allows a much bigger position, which makes the trade more exciting, and it shows a smaller loss figure on screen — two immediate rewards for a bad decision. The very wide stop, for its part, feels safe: you feel "protected from being taken out". In reality it pays for an invalidation that has already happened. In both cases the feeling and the arithmetic point in opposite directions.', 12);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.1', 'The candlestick', 'HOOK:
A candlestick does not tell you where price is going. It tells you who won the last battle, and by how much. That is infinitely less seductive, and infinitely more useful.

P: Each candlestick sums up four values and nothing else: the **open**, the **close**, the **high** and the **low** reached during the period. The central rectangle — the body — represents the distance between the open and the close. The lines sticking out of it — the wicks — mark the extremes.

P: The useful reading is in what the wicks say. A wick marks a place price went to and **was pushed back from**. It is a refusal, not a passage. The market tested a level there and failed to settle on it.

P: The body, for its part, measures conviction. A full body means one side held from the beginning of the period to the end. A tiny body framed by two long wicks means the opposite: plenty of movement, no decision.

CASE: One hour of market, read properly
H1 candle on EUR/USD. Open 1.0840 · high 1.0872 · low 1.0836 · close 1.0842.
Price rose **32 pips**, then gave the whole move back to close 2 pips above its open.
Range covered: 36 pips. Net progress: 2 pips.
Reading: the buyers spent a full hour for almost nothing, and they left behind a 30-pip upper wick. That level, 1.0872, has just been refused. It will serve as a marker.

ERR: The classic mistake
Naming the patterns before reading the numbers. The beginner learns "hammer", "doji", "engulfing", then hunts for those shapes on the chart — and finds them, inevitably, because they are everywhere. A single candle predicts nothing: it describes. The productive question is not "which pattern is this?" but "where was price refused?".

KEY: Key points
- Four numbers are enough: open, high, low, close.
- A wick marks a refusal. Price went there and did not stay.
- Describe the candle before you name it. The description is richer than the label.', 13);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.2', 'The timeframe', 'HOOK:
The same market, at the same second, can be in an uptrend and a downtrend at once. All it takes is a change of timeframe. That is not the market contradicting itself, it is a question of the scale you observe it at.

P: The **timeframe** is the length of time each candle sums up. In H1 a candle covers one hour; in H4, four hours. The underlying data is rigorously identical: only the level of aggregation changes.

P: What does change is the ratio between signal and noise. The shorter the timeframe, the more movements you watch that will have no consequence at all. You are not seeing more things: you are seeing the same things sliced more finely, and therefore more apparent occasions to act.

P: The working convention adopted in this track gives each timeframe a distinct role. **H4 sets the context** — where the major zones are, what the dominant direction is. **H1 places the execution** — where to enter, where to put the stop. The two do not vote: they answer two different questions.

CASE: The same day, two slicings
**In H1**: 24 candles, average range around 18 pips, roughly ten alternations between up candles and down candles.
**In H4**: 6 candles, average range around 45 pips, most often a single readable direction.
The data is the same to the decimal. The number of moments at which you might feel obliged to act has been divided by four.

ERR: The classic mistake
Dropping to a lower timeframe when you are undecided. The reflex looks reasonable — look closer to see better. The result is mechanical: more candles, more movement, more available justifications for entering. And the AMF study is unambiguous on this point: the more orders a client places, the more he loses.

KEY: Key points
- H4 sets the context, H1 places the execution. Two roles, never two opinions.
- A shorter timeframe adds no information: it adds noise.
- When in doubt, go up a timeframe. Never the other way.', 14);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.3', 'Highs, lows and structure', 'HOOK:
Strip everything off the chart. You are left with highs and lows. That is enough to answer the one question that comes before any decision: is this market going somewhere, or round in circles?

P: A **high** is a candle whose top exceeds that of the candles around it. A **low** is its mirror image downwards. These are observable facts, with no room for interpretation.

P: From the way they follow one another come three states, and only three. The **uptrend**: higher highs *and* higher lows. The **downtrend**: lower highs *and* lower lows. And **no trend**, the moment that double condition is not met.

P: That third state deserves particular attention, because it is the most frequent and the most badly handled. No trend is not an in-between phase to be read subtly while waiting for the direction to firm up: it is a state in its own right, and it is where the beginner loses most, precisely because he goes looking for a direction that does not exist yet.

CASE: A structure read with nothing but numbers
Sequence recorded on EUR/USD in H4:
low 1.0790 · high 1.0865 · low 1.0812 · high 1.0898 · low 1.0844.
The lows are rising: 1.0790 < 1.0812 < 1.0844. The highs are rising: 1.0865 < 1.0898.
The double condition is met: **uptrend structure**, unambiguously and without a single tool.
What follows can be read in advance: a next low above 1.0844 confirms the structure; a low below it opens the door to doubt.

ERR: The classic mistake
Forcing the reading. On a chart with no structure you can always find two points that rise — provided you choose which ones carefully. The test is binary and not negotiable: if you have to hesitate over which points to keep, the answer is "no trend". The hesitation is the information.

KEY: Key points
- Three possible states: up, down, none. The third is the most common.
- A trend requires the highs *and* the lows to point the same way.
- If the reading takes an effort of interpretation, there is nothing there to read.', 15);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.4', 'Support and resistance zones', 'HOOK:
A line drawn on a chart exerts no power over the market. What does exert power is the fact that thousands of participants are watching the same zone and have left orders in it.

P: A **support** is a zone below price where buyers have already stepped in in the past. A **resistance** is its mirror image above. The important word is *zone*: price does not react to an exact number but to a band a few pips wide, because participants do not all place their orders in the same spot.

P: Three criteria decide a zone''s credibility: how many times price reacted there, how clean the rejection was — that is, how long the wicks left behind are — and how fresh it is. A zone that has not been visited for six months describes a market that no longer exists.

P: One clarification that saves a lot of disappointment: a zone does not stop price. It marks a place where something *may* happen, which has nothing to do with a place where something *will* happen. The difference between those two phrasings is exactly the difference between a marker and a prediction.

CASE: A zone wearing out
EUR/USD in H4, zone between 1.0800 and 1.0812. Price has come down into it three times.
**First visit**: 18-pip lower wick — clean rejection.
**Second visit**: 12-pip wick.
**Third visit**: 4-pip wick.
The zone is still holding, but the reaction weakens with every visit: sellers are meeting less and less opposition there. A zone tested too often eventually gives way, and the shrinking wicks are the leading signal of that wear.

ERR: The classic mistake
Drawing ten zones. A chart covered in lines guarantees there will always be one near price, and therefore always a justification available at the moment the urge to enter turns up. Two zones per timeframe are enough: the nearest above, the nearest below. Past that, you are no longer building a reading, you are manufacturing permissions.

KEY: Key points
- A zone, not a line. A few pips wide, never an exact number.
- Its credibility rests on how many past reactions there were and how clean they were.
- Two zones per timeframe, maximum.', 16);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, '3.5', 'Why no indicators', 'HOOK:
You have just read four chapters on reading charts without meeting a single moving average. That is not an oversight, and it is not an ideological stance. It is a question of order.

P: A **technical indicator** is a formula applied to the four numbers you now know how to read. A moving average computes an average of closes; an oscillator compares recent ranges. Neither reaches any data the chart does not already contain. By construction an indicator therefore cannot add information: it removes some, since its job is to summarise.

P: The problem is not the tool, which has its place. The problem is the order in which it arrives. Laid on top of a solid reading, an indicator filters: it removes setups you would have taken wrongly. Laid on top of nothing, it **replaces** the reading with a colour, and turns a hard question into a reassuring binary answer.

P: On top of that comes a documented and systematic effect: piling on tools does not produce better decisions, it produces better justifications. With enough indicators on screen, there is always one that approves of what you already wanted to do.

CASE: The arithmetic of justification
Take three indicators, each in one of two possible states — in favour of buying or of selling. That produces **eight combinations**.
Exactly one is full agreement to buy. Exactly one is full agreement to sell. The **other six** are disagreements.
In other words, in 75% of cases the tooling does not settle anything. In practice, the trader who wants to buy keeps the two indicators that agree with him and describes the third as "lagging".
The three tools settled nothing. They supplied the raw material for the justification.

ERR: The classic mistake
Hunting for the combination of indicators and settings that would have read the last six months correctly. That combination always exists — on any given history you are bound to find one in the end — and it almost never survives the following month. The Intermediate track comes back to this question with the only thing that makes it serious: a way to test instead of hope.

KEY: Key points
- An indicator creates no information: it summarises, so it loses some.
- The bare chart first. Tools afterwards, on a reading that already stands up.
- More tools means more available justifications, not more accuracy.', 17);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 3, 'EX', 'Cold reading', 'EXF: Skill assessed
Goals 3, 4 and 7: read a candlestick, justify the choice of a timeframe, identify a structure and two zones on a bare chart.

EXF: Instructions
You are shown a EUR/USD chart in H4, with no tools at all.
**1.** Name the structure — up, down, or none — and place the two points that justify your answer.
**2.** Draw the nearest zone above price, and the nearest one below.
**3.** Answer this: in H1, would you see the same thing?

EXF: What the platform must provide
- A bare 60-candle H4 chart on EUR/USD, showing a readable uptrend structure with a pullback on the right-hand side. No indicators, no pre-existing annotations.
- A "mark a point" tool limited to two uses, and a "draw a zone" tool limited to two uses, with adjustable width. Those limits are deliberate and are part of the teaching: the tool must refuse the third zone.
- An H1 / H4 toggle **locked** until questions 1 and 2 have been submitted. The user must not be able to go looking in H1 for confirmation of what he could not read in H4.
- A three-option multiple choice for question 3.

EXF: Worked correction
**Question 1.** Uptrend structure. The two expected points are the **last two lows**, not the highs.
This is the central teaching point of the exercise: most users mark the highs, because the highs are what the eye notices. But an uptrend does not break at its highs, it breaks at its lows — and that is exactly where the stop calculated in module 2 will go. Marking the highs means looking at the part of the chart that enters into no decision at all.
**Question 2.** One zone above, one below, with a tolerance of ±10 pips. Any attempt to draw a third is refused by the tool, with no error message beyond the limit already shown.
**Question 3.** In H1 the right-hand part of the chart looks neutral, even bearish. That is the intended trap, and the right answer is not "H1 is wrong". The right answer is: **H1 does not answer that question**. A pullback inside an uptrend always looks like a downtrend when you look at it too closely. The two timeframes are not in disagreement: they were not asked about the same thing.', 18);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.1', 'Scenario, invalidation, target', 'HOOK:
"I think it''s going up" is not a scenario. It is an opinion — and an opinion cannot be wrong, it can only be disappointed. The difference is not rhetorical: it decides what you will do two hours from now.

P: A usable scenario has three elements, all of them written down **before** you enter. What you expect, stated in terms of price and not of intention. The level that will prove you were wrong, called the **invalidation**. The level where you take your profit, called the target.

P: What separates a scenario from an opinion is falsifiability: there must be a specific price whose being reached means "I was wrong". Without that price you have written nothing usable, and you will discover your position is losing without ever being able to say when it stopped being valid.

P: The practical consequence is a chain, and the order of its links is not negotiable. The invalidation determines the stop. The stop determines the size — that is the formula from module 2. The target determines the ratio in the next chapter. Everything follows from three lines written in cold blood.

CASE: A complete scenario, from the first number to the last
EUR/USD in H4, uptrend structure, last low at 1.0844. Current price: 1.0868.
**Scenario**: price comes back into the 1.0844–1.0850 zone and sets off again towards the last high, 1.0898.
**Invalidation**: an H4 close below 1.0838, that is, below the low holding the structure up.
**Entry**: 1.0852. **Target**: 1.0895.
Risk: 14 pips. Gain sought: 43 pips.
Size for 1% on €1,000: €10 ÷ 14 = €0.71 per pip, that is about **7,100 units**.
Not one of these numbers was chosen for comfort. Each follows from the one before.

ERR: The classic mistake
Writing the target first. The beginner decides how much he wants to make, then looks for the entry that would make that gain possible. The correct order starts from the invalidation, the only element the market supplies — the other two come from you, and one of them comes mostly from what you want.

KEY: Key points
- Three lines written before entry: expectation, invalidation, target.
- A scenario no price can contradict is not a scenario.
- The invalidation comes from the chart. The target is deduced from it. Never the reverse.', 19);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.2', 'Reward-to-risk and the break-even hit rate', 'HOOK:
Being right often is not enough. You can win seven trades out of ten and end the year down. Two minutes of arithmetic are enough to see why — and to stop ever judging a method by its hit rate.

P: The **reward-to-risk ratio**, written R/R, compares the gain sought to the risk accepted. A trade risking €10 to aim for €30 is a 3R trade. It is a figure known before entry, unlike the outcome.

P: From that ratio comes a far more interesting value: the minimum hit rate below which you lose money. The formula is short.

CARD: The break-even hit rate
**Minimum hit rate = 1 ÷ (1 + R/R)**
Below that rate a method loses. Above it, it wins. The calculation is done before entering, not after a hundred trades.

TABLE: 40,60 || Reward-to-risk ratio | Hit rate needed to break even
1R | 50%
1.5R | 40%
2R | 33%
3R | 25%
5R | 17%

CASE: What the table really means
At **3R** you can be wrong three times out of four and still break even. That is a considerable margin for error, and it is handed to you by the structure of the trade, not by your insight.
At **0.5R** you need a 67% hit rate — a level almost nobody sustains over time.
And these thresholds are **gross**: they ignore the spread and the overnight charges from module 1. Once those costs are folded in, a trade that breaks even in theory is a losing trade in fact.

ERR: The classic mistake
Aiming small to "lock it in". Systematically taking 5 pips of profit while risking 20 produces a long run of winning trades and an account that goes down. The feeling is excellent — you are right almost every time — and the statement is bad. It is the most comfortable trap in the business, because nothing in the lived experience flags the error.

KEY: Key points
- Minimum hit rate = 1 ÷ (1 + R/R). Work it out before you enter.
- Below 1.5R, costs eat the edge.
- A high hit rate with a low R/R is a slow way to lose.', 20);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.3', 'Expectancy', 'HOOK:
Someone who is right 40% of the time can make money every year. Someone who is right 70% of the time can go broke. The difference lies in a multiplication you can do in thirty seconds.

P: **Expectancy** is the average result a trade produces, winners and losers taken together. It brings together the two variables beginners look at separately: how often the gains come and how big they are.

CARD: The formula
**Expectancy = (hit rate × average gain) − (miss rate × average loss)**
Expressed in R, it gives you directly what a trade returns on average. It is the only figure that describes a whole system.

CASE: Two profiles, two opposite conclusions
**Profile A** — 40% hit rate, average gain 3R, average loss 1R.
(0.40 × 3) − (0.60 × 1) = 1.20 − 0.60 = **+0.60 R per trade**.
**Profile B** — 70% hit rate, average gain 0.4R, average loss 1R.
(0.70 × 0.4) − (0.30 × 1) = 0.28 − 0.30 = **−0.02 R per trade**.
Over 200 trades: A is wrong 120 times and makes about 120 R. B is right 140 times and loses, before the spread is even counted.
The profile that feels better day to day is the one that empties the account.

ERR: The classic mistake
Judging a method by its hit rate. It is the most visible figure, the easiest to tell a story about, and the least informative of them all. On its own it says strictly nothing: it only means something alongside the average R.

KEY: Key points
- Expectancy = (hit rate × average gain) − (miss rate × average loss), in R.
- A small positive expectancy repeated beats a brilliant, rare method.
- Never judge a system on its hit rate alone.', 21);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.4', 'The pre-order checklist', 'HOOK:
The moment you are least able to judge is exactly the moment your finger is on the button. The checklist exists so that the decision is already made when that moment arrives.

P: Its job is not to improve your trades: it is to remove the ones you take on reflex. It moves the decision out of an emotionally loaded instant and into a cold one, where the criteria were set with nothing at stake.

UL:
- Is the structure readable in H4? If the answer is "no trend", I do not enter.
- Where is my invalidation, in price?
- What size does that stop impose for a 1% risk?
- What is the reward-to-risk ratio? Below 1.5, I do not enter.
- Does this trade look like my previous trades, or is it an exception?
- How many trades have I already taken today?

P: The rule of use is brutal, and that is what makes it work: **a single missing answer cancels the trade**. No weighting, no trading one criterion off against another, no "almost".

CASE: A good trade turned down
Assessment of a real setup, question by question.
H4 structure readable: **yes**, up. Invalidation: **yes**, 1.0838. Size for 1%: **yes**, 7,100 units. Reward-to-risk: **yes**, 43 ÷ 14 = 3.1. Consistent with previous trades: **yes**.
Trades already taken today: **4**, against a limit set at 3. **No.**
Result: **trade refused**.
That trade might well have won. The rule does not exist to optimise this one: it exists to remove the thirty trades of the same kind that will follow, most of which will be worth nothing.

ERR: The classic mistake
Adapting the checklist to the trade. As soon as an answer is missing, the temptation is to reword the question rather than give up. A checklist modified during a session no longer filters anything: it merely records what you had decided to do.

KEY: Key points
- Six questions, all compulsory. One missing answer cancels the trade.
- It is filled in before the click, not during.
- It is only ever modified outside market hours.', 22);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, '4.5', 'The trade you do not take', 'HOOK:
The AMF study measured a disarmingly simple relationship across 14,799 clients: the more orders they placed, the more they lost. No threshold, no exception, no category spared. A straight line.

P: Not entering is a decision, not the absence of one. It costs nothing and has a measurable value: it avoids the negative expectancy of average setups, which make up the overwhelming majority of what you will see.

P: Selectivity is therefore a performance variable in exactly the same way as R/R. Out of twenty or so setups spotted in a week, three or four genuinely pass the checklist. The other sixteen are not missed opportunities: they are low-expectancy trades you were lucky enough not to take.

P: What remains is the real obstacle, and it is not technical. A session with no trade feels like a session where you did nothing. That is a complete illusion: selectivity *is* the work, and it is in fact the hardest part to hold to.

CASE: Two weeks, same method, same person
**Week 1** — 4 trades, all compliant: +2R, −1R, +3R, −1R. Result: **+3R**.
**Week 2** — 14 trades, 10 of them taken out of boredom. The 4 compliant ones produce the same +3R. The other 10 return an average of −0.2R each, that is −2R, plus the spread on ten round trips.
Result: **+1R at best**.
The ten extra trades cost two thirds of the week''s performance. They also took up most of the time spent in front of the screen.

ERR: The classic mistake
Measuring your day by the number of trades taken. Nobody feels productive after four hours of watching without a single order. And yet that is very often the most profitable session of the week — and the only one that leaves no trace in the statement.

KEY: Key points
- Not entering is a decision, and it is recorded like any other.
- Three to four compliant setups a week, not fourteen.
- A session with no trade is not a wasted session.', 23);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 4, 'EX', 'The plan before the click', 'EXF: Skill assessed
Goals 8, 9 and 10: calculate a reward-to-risk ratio, write a complete trade plan, turn down a trade by naming the rule that turns it down.

EXF: Instructions
You are shown a EUR/USD chart in H4 and in H1.
**1.** Fill in the trade plan: scenario, entry, invalidation, target.
**2.** Check the reward-to-risk ratio calculated automatically.
**3.** Go through the six-point checklist, then make your final decision.

EXF: What the platform must provide
- A split screen, H4 on top and H1 below, on the same asset over the same period.
- A four-field form: scenario as free text (200 characters), then entry, invalidation and target — those last three typed in or set by clicking directly on the chart.
- A live display of position size and R/R as soon as the three prices are filled in. The user must see the R/R change while he moves his target: that is the best way to make chapter 4.2 stick.
- The six checklist items as tick boxes, with a "trades taken today" counter **preset to 3** and not editable.
- A final decision button with two outcomes: "I take it" / "I don''t take it".

EXF: Worked correction
The expected R/R is at least 1.5 and the size must correspond to 1% risk on €1,000. Both are checked automatically and are not where the difficulty lies.
The difficulty is elsewhere, and it is deliberate. The counter stands at 3, so the sixth checklist question fails, so **the trade must be refused** — even though the other five answers are excellent, and they are.
Most users validate it anyway. Not out of carelessness, but because the trade is objectively good and the rule feels incidental at that particular moment. That is exactly the situation the rule exists to cover: it is of no use at all against bad trades, which you would discard anyway. It is only of use against the beautiful ones.
A good trade plan that is turned down is still a good trade plan. It goes into the journal marked "not taken", and it counts in your statistics in module 6.', 24);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.1', 'The disposition effect', 'HOOK:
You close a €12 gain with relief. You let a €40 loss run, telling yourself it will come back. That behaviour has a name, it has been measured across ten thousand accounts, and it applies to you — the question is not whether you will escape it, but which rule you will set against it.

P: The **disposition effect** is the tendency to realise your gains too early and to put off realising your losses. Terrance Odean established it in 1998 across ten thousand brokerage accounts: in comparable situations, investors sell their winning positions one and a half to two times more often than their losing ones.

P: The mechanism is asymmetrical and perfectly understandable. An open winning position is a permanent source of worry; closing it converts an unpleasant uncertainty into a pleasant certainty. An open losing position, on the other hand, is a loss "on paper" — closing it makes it final, and above all, makes it true.

P: The effect produced is mechanical: average gains systematically smaller than average losses. In other words a structural deterioration of the reward-to-risk ratio, independent of the quality of the analysis. Module 4 showed that a degraded R/R is enough to make a sound method lose. That is exactly what happens here.

CASE: A profitable method, made losing by its execution
Twenty trades, sound method, stop at 1R and target at 3R, 40% hit rate.
**Compliant execution**: 8 gains at 3R, 12 losses at 1R, that is 24 − 12 = **+12 R**.
**Execution with the disposition effect**: gains are cut at an average of 1.2R, and two losses are allowed to run to 2.5R.
8 × 1.2 = 9.6 R. Losses: 10 × 1 + 2 × 2.5 = 15 R. Result: **−5.4 R**.
The method has not changed one iota. The analysis was identical. Only the execution moved, and it turned +12 R into −5.4 R.

ERR: The classic mistake
Calling it prudence. "I''m locking in my gains" is the presentable name for a behaviour that, once measured, destroys expectancy. Prudence has every place in trading — it is exercised in the position size, decided before entry. Not in an early exit, decided under pressure.

KEY: Key points
- You will cut your gains and let your losses run. That is documented, not hypothetical.
- The disposition effect degrades the R/R without ever touching the analysis.
- The only reliable countermeasure: target and stop fixed before entry, not renegotiated afterwards.', 25);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.2', 'Overtrading and overconfidence', 'HOOK:
Across 14,799 French clients, those who placed the most orders lost the most. Across 66,465 American households, the most active underperformed the market by more than six points a year. Two samples, two continents, two decades apart, the same straight line.

P: Barber and Odean examined the accounts of 66,465 American households between 1991 and 1996. The average household returns 16.4% a year; the most active quintile, 11.4%; the market, 17.9%. The gap is not explained by poor stock picking: it is explained by the **volume of activity itself**.

P: The explanation the authors settle on is overconfidence. Everyone overestimates the quality of their information and underestimates the part luck played in their successes — which leads to acting more often than the information actually held would justify.

P: On top of that comes a self-reinforcing mechanism that is particularly hard to defuse. A gain is credited to skill; a loss, to circumstances. The sample of memories is therefore biased in one direction only, and confidence keeps rising even as the account statement falls. The two curves cross without ever meeting.

CASE: The AMF''s three measures all point the same way
Across the 14,799 clients tracked for four years:
Those who placed **at least 250 orders** make up 52% of the population studied and lose an average of **€18,741**.
Those whose **average order size exceeds €10,000** make up 62% of the population and lose an average of **€14,876**.
Number of orders, average size, cumulative volume: all three measures give the same result, and no sub-population escapes it.

ERR: The classic mistake
Reading a good run as a step up in level. That is the precise moment position sizes increase, "since it''s working". Statistically, that increase comes in just before the return to the mean — that is, at the worst possible moment, and for a reason that seems excellent.

KEY: Key points
- Activity itself is correlated with loss. The number of orders is a risk variable.
- A good run is not proof of skill: it is a short sample.
- Set your size and your number of trades outside the session, when nothing is at stake.', 26);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.3', 'The spiral after a loss', 'HOOK:
The €10 loss did nothing to you. What did something to you was realising you had been wrong. The twenty minutes that follow are, statistically, the most expensive of your day.

P: The sequence is stereotyped and unfolds in four beats. The loss. The need for immediate repair. The entry outside the checklist, on a setup that would not have passed the filter an hour earlier. And the increase in size, meant to "make it back in a single trade".

P: Each step is individually defensible. It is the chain that empties an account, and it is all the harder to break because every link looks reasonable taken on its own.

P: The tipping point is identifiable and it is **linguistic**. As long as you think "−1 R", you are inside the system: the loss has a unit, a place in a series, a statistical meaning. The moment you think "−€10, I need €10", you have left the system and you are chasing a sum. The change of unit always comes before the change of behaviour.

CASE: Forty minutes
**Trade 1**, compliant, planned: **−1 R**.
**Trade 2**, six minutes later, outside the checklist, size doubled to catch up: **−2 R**.
**Trade 3**, fifteen minutes after that, size quadrupled: **−4 R**.
Total: **−7 R**, that is seven normal working sessions wiped out in forty minutes.
The only one of the three that was part of the plan is the one that cost the least.

ERR: The classic mistake
Believing you will recognise that state at the moment it happens. You do not recognise it — that is the very definition of the state. So the countermeasure cannot take the form of a decision made during. It has to be a mechanical rule, set beforehand, that applies without your having to judge whether it is appropriate at the time.

KEY: Key points
- After a loss the countermeasure is a delay, not an act of will: no orders for thirty minutes.
- Two losses in the session: the session is over. No exceptions, no assessment.
- If you are counting in euros rather than in R, you have already stopped trading.', 27);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, '5.4', 'Rules that hold', 'HOOK:
Every rule in this module shares one property: it is written when the market is closed and applied without judgement when it is open. A rule that requires an assessment at the moment it applies is not a rule — it is an intention.

P: The principle is easy to state and hard to hold to: move the decision outside the emotional state that distorts it. The rules that survive contact with use share three properties — they are **numerical**, **checkable without interpretation**, and **set in advance**.

UL:
- Fixed risk of 1% per trade, never adjusted mid-session.
- Three trades maximum per session.
- Two losses: the session is over.
- Thirty minutes'' wait after any loss.
- No order without all six answers on the checklist.
- Target and stop not renegotiable once the position is open.
- Drawdown of 10% on the month: full stop and review of the journal.

P: These seven rules are not a method. They make no claim to generate a profit. Their function is more modest and more decisive: to let a method, whatever it is, be tested on a large enough sample before the account disappears.

CASE: What the absence of the seventh rule costs
Capital €1,000, risk 1%, three trades per session, stop at two losses. The maximum loss in a session is therefore 2%.
**Without a monthly rule**: twenty consecutive losing sessions bring capital down to €667, a drawdown of **−33%**.
**With the 10% rule**: the stop triggers on the sixth losing session, drawdown contained at around **−11%**.
Same method, same run of bad luck, same risk per trade. The only difference is one line written on a Sunday evening.

ERR: The classic mistake
Writing the rules without writing what happens when you break them. A rule with no consequence attached is a wish. The consequence does not have to be punitive — recording the breach in the journal is quite enough, provided it is systematic and the count is read back at the end of the month.

KEY: Key points
- A useful rule is numerical, checkable, and written with the market closed.
- Seven rules are enough. Beyond that, none of them is genuinely applied.
- Attach a written consequence to every rule, however small.', 28);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 5, 'EX', 'Four situations, one rule', 'EXF: Skill assessed
Goals 10 and 12: turn down a trade by naming the rule that turns it down; recognise a documented bias in a concrete situation.

EXF: Instructions
Four situations are shown to you one after the other. For each: **I take it** or **I don''t take it**, then select from the list the rule that justifies your decision.

EXF: What the platform must provide
- Four sequential cards, with no going back. Not being able to go back is part of the exercise: it reproduces the real condition.
- Each card carries a small static H1 chart and a status bar permanently showing: capital, number of trades taken today, result of the current session, minutes elapsed since the last trade.
- Two decision buttons, then a drop-down list containing the module''s seven rules. The rule must be chosen **after** the decision, never before.
- No indication of what the market did next. This exercise assesses a decision, not an outcome.

EXF: Worked correction
- **Situation 1** — compliant setup, no trades taken, session flat. Answer: *I take it*. Rule cited: complete checklist. It is the only one of the four where entering is correct.
- **Situation 2** — compliant setup, two losses already taken in the session. Answer: *I don''t take it*. Rule: two losses, session over. The setup offered is objectively the best of the four, and that is entirely deliberate: a rule that does not hold up against a beautiful setup is useless, since that is the only moment it is ever tested.
- **Situation 3** — average setup, reward-to-risk at 1.2, no trades taken. Answer: *I don''t take it*. Rule: minimum ratio of 1.5. The trap here is the absence of any other obstacle: nothing in the status bar stands in the way of the trade, and you have to go looking for the single figure that disqualifies it.
- **Situation 4** — compliant setup, last trade lost eight minutes ago. Answer: *I don''t take it*. Rule: thirty minutes'' wait. Nothing rules this trade out on its merits; only the delay blocks it. It is the situation users validate most often, and it is precisely the second step in the sequence described in chapter 5.3.', 29);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.1', 'The trading journal', 'HOOK:
The AMF isolated 1,881 clients active four years running. Their loss rate did not fall: 87.56%. Experience on its own teaches nothing — that is measured. What teaches is the written record you keep of it.

P: Memory is not enough, and for a precise reason: it is reconstructed. You remember the conclusion, not the decision — and the conclusion retrospectively contaminates the memory of the decision. A winning trade becomes a good idea; a losing trade, a mistake. In both cases the reconstruction erases the useful information.

P: The account statement is no better: it gives the results, never the reasons. Seven fields, on the other hand, are enough — provided you fill them in at the right moment.

UL:
- Date and time of entry.
- Asset and timeframe.
- Scenario in one sentence, **written before entry**.
- Invalidation and target, in price.
- Position size and risk in R.
- Result in R, never in euros.
- Compliance: did the trade respect the six checklist questions? Yes or no.

P: The seventh field is the only one that produces learning. The first six describe; that one judges the process, independently of what the market did. It is also the easiest to skip, precisely because it is the only one that can tell you that you were wrong when you won.

CASE: A complete entry
*12/03, 2:20 p.m. · EUR/USD H1 · Pullback into the 1.0850–1.0844 zone in an H4 uptrend, resumption expected towards 1.0898 · Invalidation 1.0838, target 1.0895 · 7,100 units, 1 R = €10 · Result: −1 R · Compliant: yes.*
This trade is **losing and compliant**. It calls for no correction, no soul-searching, no adjustment of method.
That is the distinction the next chapter develops, and it is the hardest to accept in the whole track.

ERR: The classic mistake
Recording results in euros. "−€40" compares to nothing: not to your other trades, whose risk varied, nor to your capital six months ago, which was not the same. "−1 R" compares to everything. A journal in euros produces emotion; a journal in R produces statistics.

KEY: Key points
- Seven fields, only one of which is about the process. That is the one that counts.
- The scenario is written before entry, otherwise it is rewritten by the result.
- Everything is recorded in R. Never in euros.', 30);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.2', 'Decision and outcome', 'HOOK:
Four trades, four outcomes. Two deserve a correction, two deserve none — and they are not the two losers.

P: Crossing the compliance of the decision with the nature of the outcome produces four cases, two of which are counter-intuitive. It is this grid, and not the account balance, that tells you what to work on next month.

TABLE: 34,33,33 || | Winning outcome | Losing outcome
**Compliant decision** | Nothing to do. Repeat. | Nothing to correct. It is the normal cost of the activity.
**Non-compliant decision** | The dangerous case: the outcome rewards the breach. | The easy case: the pain and the error coincide.

P: The worst-handled cell is "compliant and losing". It represents the majority of your trades — a system with a 40% hit rate produces six out of ten — and it is the one everybody sets about correcting, because it hurts.

P: The most expensive cell is "non-compliant and winning". Nothing flags the error: the account rises, the feeling is good, and the behaviour settles into habit. Judging a decision by its outcome is called *resulting*. On a short sample, the outcome is mostly noise.

CASE: A month of forty trades
**Thirty compliant trades**: 12 winners at +3R, 18 losers at −1R, that is 36 − 18 = **+18 R**.
**Ten non-compliant trades**: 4 winners at +1.5R, 6 losers at −2.2R — the stops having been moved. That is 6 − 13.2 = **−7.2 R**.
Month''s total: **+10.8 R**.
The ten out-of-framework trades removed 40% of the performance. And the four winners among them are exactly why they will be repeated next month.

ERR: The classic mistake
Revising your method after a run of compliant losses. It is the most frequent and most destructive reaction there is: it replaces a system with positive expectancy by an untested one, at the precise moment the first was passing through its normal variance. Two months later the same thing starts again with the new one.

KEY: Key points
- Compliant and losing: no correction. It is the cost of the activity.
- Non-compliant and winning: deal with it first, despite the outcome.
- Never change method on the basis of a short run.', 31);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.3', 'Reading your own statistics', 'HOOK:
After thirty trades, your journal holds more information about you than any course. You just have to know which three numbers to pull out of it, and in what order to read them.

P: Three numbers, and not one more.

UL:
- **The compliance rate** — compliant trades divided by total trades. The only measure you control entirely, and therefore the first to fix. Aim for above 90%.
- **The average R per trade** — the expectancy from module 4, calculated exclusively on compliant trades. It measures your method, provided it is computed on trades that actually applied it.
- **The longest losing run** — to be compared with your drawdown limit. If it comes close, the method is not what is at fault: your risk per trade is too high for it.

P: The order of reading is not negotiable, and it follows from the first point: as long as compliance is low, the average R does not measure your method, it measures your indiscipline. Below **30 compliant trades**, none of the three values can be interpreted — it is the limit beginners ignore most systematically.

CASE: A statement of forty-five trades
Compliance: 31 / 45 = **69%**.
Average R across all 45 trades: **+0.05 R** — that is, near enough nothing.
Average R across the 31 compliant trades: **+0.52 R**.
Longest losing run: 6.
Reading: the method has a clearly positive expectancy, and fourteen out-of-framework trades brought it back to zero. So next month''s work is not about the method — it works. It is entirely about the fourteen.

ERR: The classic mistake
Calculating your statistics across all trades. Mixing compliant and non-compliant produces an average that describes no existing system: neither the one you designed, nor the one you applied. You then conclude that "the method doesn''t work", when it has never actually been tested.

KEY: Key points
- Three measures: compliance, average R on compliant trades, longest losing run.
- Nothing can be interpreted below 30 compliant trades.
- Fix compliance before touching the method.', 32);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.4', 'Deliberate practice', 'HOOK:
Repeating a thousand trades teaches nothing: that is measured, over four years in France and over three years of cohorts in Brazil. What teaches is repetition with immediate correction and a narrow objective. The difference between the two lies in the organisation, not in talent.

P: **Deliberate practice** means repeating a specific task, sitting at the edge of your current competence, with immediate feedback on the execution rather than the outcome. It is the only training regime whose effectiveness is established in complex disciplines.

P: Applied to trading, that definition rules out two extremely widespread practices: trading "to see", and working on several skills at once. In both cases the feedback becomes unusable, since you no longer know what it is assessing.

UL:
- One skill per session — spotting lows, *or* calculating a size, never both.
- Twenty repetitions minimum on replayed historical data.
- Correction after each repetition, never at the end of the session.
- No scorekeeping in euros during training.
- One written note at the end of the session: what was difficult, in a sentence.

P: The simulator is what makes that structure possible. It compresses into an hour a sample of situations that would take months to occur in real time — and it allows error, which no real account does.

CASE: Two ways to spend ten hours
**Option A** — ten hours of simulated trading, all skills mixed together. About **25 decisions**, each judged on its outcome, none isolated.
**Option B** — ten one-hour sessions, one skill per session. About **200 repetitions**, each corrected immediately.
The same time invested. Eight times as many repetitions, and feedback that bears on the execution rather than on luck.
That is the difference between playing and training.

ERR: The classic mistake
Confusing screen time with training. Watching a market for four hours with no defined task produces no measurable learning, however serious the observer. Duration is not the variable that counts: the density of corrections is.

KEY: Key points
- One skill per session, twenty repetitions minimum, immediate correction.
- The simulator is there to concentrate repetitions, not to simulate profits.
- Screen time and training are not the same thing.', 33);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, '6.5', 'After this track', 'HOOK:
You now know how to calculate a risk, read a structure and turn down a trade. You are missing the one thing no text can ever give you: a sample.

P: **Step 1 — thirty compliant trades in simulation, with no profit objective.** The only figure tracked is the compliance rate. The result does not matter at this stage, and looking at it would be actively counterproductive.

P: **Step 2 — measure the average R across those thirty compliant trades.** If it is negative, the method gets revised. If it is positive, the sample extends to a hundred trades before any conclusion, because thirty is not enough to tell a method from a lucky run.

P: **Step 3 — the Intermediate track**, which introduces technical indicators together with the only thing that makes them usable: a way to test them. The question left open in chapter 3.5 finds its answer there.

P: And what this track has deliberately not covered, so that you know what is left to look for elsewhere: choosing a broker, taxation, the conditions for any move to real money, and every product other than currency pairs and spot cryptocurrencies.

CASE: The calendar, with no favourable rounding
At three compliant trades a week — the pace the selectivity of module 4 imposes — thirty trades take about **ten weeks**. A hundred trades take **thirty-three**.
Any promise of competence in thirty days is in direct contradiction with that division. This is not a moral position on how serious courses are: it is the result of 30 ÷ 3.

ERR: The classic mistake
Going live as soon as the simulation becomes profitable. Profitability observed over thirty trades is mostly noise. And execution with real money brings the whole of module 5 back at a stroke — disposition effect, overtrading, the spiral after a loss — which has strictly nothing to do with the quality of your analysis.

KEY: Key points
- Thirty compliant trades before any conclusion, a hundred before any confidence.
- The only figure to track at the start is the compliance rate.
- Ten weeks minimum. The calculation is arithmetic, not moral.', 34);
insert into public.formation_chapitres (parcours, langue, module, numero, titre, corps, ordre) values
  ('debutant', 'en', 6, 'EX', 'The trade you will not correct', 'EXF: Skill assessed
Goals 11 and 12: record a trade and pull a process error out of it, distinct from a bad outcome.

EXF: Instructions
You are shown four trades that have already been executed, with their chart and their result.
**1.** Complete the missing journal fields for each one.
**2.** Place each trade in the compliance / outcome grid.
**3.** Name the one trade that requires a correction, and write that correction in a single sentence.

EXF: What the platform must provide
- Four short replays of 30 H1 candles, with the entry, stop, target and actual exit drawn on the chart.
- A seven-field journal form, five of them pre-filled and read-only. Two fields remain to be entered: compliance (yes / no) and the result in R.
- A 2 × 2 drag-and-drop grid for the classification.
- A 150-character text field for the correction, and only one — part of the exercise is naming only one.

EXF: Worked correction
- **Trade A** — compliant, losing, −1 R. No correction. This is the trade the vast majority of users want to correct, and it is the heart of the exercise: nothing failed. The stop worked exactly as intended, the scenario was contradicted by the market, the process was intact.
- **Trade B** — compliant, winning, +3 R. No correction. Easy.
- **Trade C** — non-compliant, stop moved after entry, losing, −2.4 R. Everyone finds this one: the fault and the pain coincide.
- **Trade D** — non-compliant, fourth trade of the day when the limit is three, **winning, +2 R**. This is the only right answer to the third question.
The result is positive, so nothing flags the error: not the balance, not the feeling, not the chart. That is exactly why it will be repeated — and why it will eventually land on an unfavourable run. The expected correction is about the rule that was broken, never about the result obtained.
If you named trade C, you found a real error, but an already obvious one. If you named trade D, you have just used the journal for what it is for.', 35);

commit;
