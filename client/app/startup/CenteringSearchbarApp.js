import r from 'r-dom';
import _ from 'lodash';

import { initialize as initializeI18n } from '../utils/i18n';
import CenteringSearchbar from '../components/sections/CenteringSearchbar/CenteringSearchbar';
import { Image } from '../models/ImageModel';
import { subset } from '../utils/routes';

export default (props) => {
  const locale = props.i18n.locale;
  const defaultLocale = props.i18n.defaultLocale;

  initializeI18n(locale, defaultLocale, process.env.NODE_ENV);

  const routes = subset([], { locale });

  const avatarImage = _.get(props, 'avatarDropdown.avatar.image.url');
  const avatarImageRecord = avatarImage ? new Image({
    type: ':thumb',
    url: avatarImage,
  }) : null;

  _.set(props, 'avatarDropdown.avatar.image', avatarImageRecord);

  const combinedProps = Object.assign({}, props, { routes });
  return r(CenteringSearchbar, combinedProps);
};
