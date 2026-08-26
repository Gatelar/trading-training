import * as React from 'react';
import {
  Progress as ProgressPrimitive,
  ProgressIndicator as ProgressIndicatorPrimitive,
  type ProgressProps as ProgressPrimitiveProps,
} from '../animate-ui/primitives/radix/progress';
import { cn } from '../../lib/utils';

type ProgressProps = ProgressPrimitiveProps & { value?: number };

function Progress({ className, value = 0, ...props }: ProgressProps) {
  return (
    <div className="w-full space-y-2">
      <div className="flex justify-between items-center text-xs font-mono text-[#CDFC8A]">
        <span className="tracking-wider">PROGRESS</span>
        <span className="font-semibold">{Math.round(value)}%</span>
      </div>
      <ProgressPrimitive
        className={cn(
          'relative w-full h-3 overflow-hidden rounded-full bg-[#10140f] p-[2px] border border-[#CDFC8A]/20 shadow-[inset_0_1px_3px_rgba(0,0,0,0.6)]',
          className
        )}
        value={value}
        {...props}
      >
        <ProgressIndicatorPrimitive
          className="h-full rounded-full bg-[#CDFC8A] transition-all duration-500 ease-out shadow-[0_0_12px_#CDFC8A]"
          style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
        />
      </ProgressPrimitive>
    </div>
  );
}

export { Progress, type ProgressProps };
