import React, {forwardRef, ReactElement} from 'react';
import clsx from 'clsx';
import {ButtonSize, getButtonSizeStyle} from './button-size';
import {ButtonBase, ButtonBaseProps} from './button-base';

export interface IconButtonProps extends ButtonBaseProps {
  children: ReactElement;
  padding?: string;
  size?: ButtonSize | null;
  iconSize?: ButtonSize | null;
  equalWidth?: boolean;
}
export const IconButton = forwardRef<HTMLButtonElement, IconButtonProps>(
  (
    {
      children,
      size = 'md',
      iconSize = size || 'md',
      variant = 'text',
      radius = 'rounded-full',
      className,
      padding,
      equalWidth = true,
      ...other
    },
    ref
  ) => {
    const mergedClassName = clsx(
      getButtonSizeStyle(size, {padding, equalWidth, variant}),
      className
    );

    return (
      <ButtonBase
        {...other}
        ref={ref}
        radius={radius}
        variant={variant}
        className={mergedClassName}
      >
        {React.cloneElement(children, {size: iconSize})}
      </ButtonBase>
    );
  }
);
