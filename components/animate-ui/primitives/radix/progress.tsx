import * as React from 'react';

export interface ProgressProps extends React.HTMLAttributes<HTMLDivElement> {
  value?: number;
  max?: number;
  getValueLabel?(value: number, max: number): string;
}

export const Progress = React.forwardRef<HTMLDivElement, ProgressProps>(
  ({ className, value = 0, max = 100, children, ...props }, ref) => {
    return (
      <div
        ref={ref}
        role="progressbar"
        aria-valuemin={0}
        aria-valuemax={max}
        aria-valuenow={value}
        data-state={value === max ? 'complete' : 'loading'}
        data-value={value}
        data-max={max}
        className={className}
        {...props}
      >
        {children}
      </div>
    );
  }
);
Progress.displayName = 'Progress';

export interface ProgressIndicatorProps extends React.HTMLAttributes<HTMLDivElement> {}

export const ProgressIndicator = React.forwardRef<HTMLDivElement, ProgressIndicatorProps>(
  ({ className, style, ...props }, ref) => {
    return (
      <div
        ref={ref}
        data-state="indeterminate"
        className={className}
        style={style}
        {...props}
      />
    );
  }
);
ProgressIndicator.displayName = 'ProgressIndicator';
