import { PropTypes } from 'react';
import { a } from 'r-dom';

import * as propTypeUtils from '../../../utils/PropTypes';
import * as variables from '../../../assets/styles/variables';

import css from './Link.css';

export default function Link({ href, className, customColor, openInNewTab, children }) {
  const color = customColor || variables['--customColorFallback'];

  if (children == 'Log in') {
    return a({
      className: className || '',
      classSet: { [css.link]: true },
      href,
      style: { color: color, border: '1px solid #FFFFFF', 'border-radius': '30px', 'line-height': '50px', 'height': '55px' },
      ...(openInNewTab ? { target: '_blank', rel: 'noreferrer' } : null),
    }, children);
  }
  else
    return a({
      className: className || '',
      classSet: { [css.link]: true },
      href,
      style: { color },
      ...(openInNewTab ? { target: '_blank', rel: 'noreferrer' } : null),
    }, children);
}

const { string, bool } = PropTypes;

Link.propTypes = {
  href: string.isRequired,
  className: propTypeUtils.className,
  customColor: string,
  openInNewTab: bool,
  children: string.isRequired,
};
