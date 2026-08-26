import * as React from 'react';
import { Progress } from './progress';
import { TrendingUp, Target, Award, ShieldCheck, Zap } from 'lucide-react';

interface MetricGoal {
  id: string;
  title: string;
  category: string;
  current: number;
  target: number;
  unit: string;
  icon: React.ReactNode;
}

const TRADING_GOALS: MetricGoal[] = [
  {
    id: 'portfolio',
    title: 'Portfolio Challenge Target',
    category: 'Funding Phase 1',
    current: 7420,
    target: 10000,
    unit: '$',
    icon: <TrendingUp className="w-4 h-4 text-[#CDFC8A]" />,
  },
  {
    id: 'curriculum',
    title: 'Price Action & Candlestick Mastery',
    category: 'Course Completion',
    current: 18,
    target: 24,
    unit: 'Modules',
    icon: <Award className="w-4 h-4 text-[#CDFC8A]" />,
  },
  {
    id: 'winrate',
    title: 'Monthly Win Rate & Edge',
    category: 'Risk Management',
    current: 68,
    target: 100,
    unit: '%',
    icon: <ShieldCheck className="w-4 h-4 text-[#CDFC8A]" />,
  },
];

export function TraderProgressWidget() {
  const [activeTab, setActiveTab] = React.useState<string>('portfolio');
  const [animatedValue, setAnimatedValue] = React.useState<number>(0);

  const activeGoal = TRADING_GOALS.find((g) => g.id === activeTab) || TRADING_GOALS[0];
  const targetPercent = Math.min(100, Math.round((activeGoal.current / activeGoal.target) * 100));

  React.useEffect(() => {
    setAnimatedValue(0);
    const timer = setTimeout(() => {
      setAnimatedValue(targetPercent);
    }, 100);
    return () => clearTimeout(timer);
  }, [activeTab, targetPercent]);

  return (
    <div className="w-full max-w-xl mx-auto rounded-2xl bg-[#10140f]/90 border border-[#CDFC8A]/15 p-6 backdrop-blur-xl shadow-[0_20px_50px_rgba(0,0,0,0.8),0_0_30px_rgba(205,252,138,0.06)]">
      {/* Header Tabs */}
      <div className="flex gap-2 p-1 mb-6 rounded-xl bg-[#090c09] border border-white/5">
        {TRADING_GOALS.map((goal) => {
          const isSelected = goal.id === activeTab;
          return (
            <button
              key={goal.id}
              onClick={() => setActiveTab(goal.id)}
              className={`flex-1 flex items-center justify-center gap-2 py-2 px-3 rounded-lg text-xs font-mono transition-all duration-200 ${
                isSelected
                  ? 'bg-[#CDFC8A] text-[#061208] font-bold shadow-[0_0_12px_rgba(205,252,138,0.3)]'
                  : 'text-[#8A938B] hover:text-[#F4F5F6] hover:bg-white/[0.02]'
              }`}
            >
              {isSelected && <Zap className="w-3 h-3 animate-pulse" />}
              <span>{goal.category}</span>
            </button>
          );
        })}
      </div>

      {/* Goal Overview */}
      <div className="flex justify-between items-end mb-4">
        <div>
          <span className="text-[11px] font-mono tracking-widest text-[#CDFC8A] uppercase">
            LIVE METRIC
          </span>
          <h3 className="text-lg font-semibold text-[#F4F5F6] mt-0.5 flex items-center gap-2">
            {activeGoal.icon}
            {activeGoal.title}
          </h3>
        </div>
        <div className="text-right font-mono">
          <div className="text-xl font-bold text-[#CDFC8A] tracking-tight">
            {activeGoal.unit === '$' && activeGoal.unit}
            {activeGoal.current.toLocaleString()} {activeGoal.unit !== '$' && activeGoal.unit}
          </div>
          <div className="text-xs text-[#8A938B]">
            Goal: {activeGoal.unit === '$' && activeGoal.unit}
            {activeGoal.target.toLocaleString()} {activeGoal.unit !== '$' && activeGoal.unit}
          </div>
        </div>
      </div>

      {/* Animated Progress Bar */}
      <Progress value={animatedValue} className="h-3.5" />

      {/* Footer Details */}
      <div className="flex justify-between items-center mt-4 pt-4 border-t border-white/[0.04] text-[11px] font-mono text-[#8A938B]">
        <div className="flex items-center gap-2">
          <span className="w-2 h-2 rounded-full bg-[#CDFC8A] shadow-[0_0_6px_#CDFC8A] animate-ping" />
          <span>REAL-TIME ENGINE</span>
        </div>
        <div className="text-[#CDFC8A]">
          {activeGoal.target - activeGoal.current > 0
            ? `${(activeGoal.target - activeGoal.current).toLocaleString()} ${activeGoal.unit} REMAINING`
            : 'TARGET REACHED'}
        </div>
      </div>
    </div>
  );
}
