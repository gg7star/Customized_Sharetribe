import { Component, PropTypes } from 'react';
import r, { div } from 'r-dom';
import classNames from 'classnames';
import * as placesUtils from '../../../utils/places';
import * as urlUtils from '../../../utils/url';

import { t } from '../../../utils/i18n';
import { routes as routesProp } from '../../../utils/PropTypes';
import css from './CenteringSearchbar.css';
import cssOnSmallCoverImage from './CenteringSearchbarOnSmallCoverImage.css';
import styleVariables from '../../../assets/styles/variables';

import SearchBarOnCoverImage from '../../composites/SearchBarOnCoverImage/SearchBarOnCoverImage';

const LABEL_TYPE_MENU = 'menu';
const LABEL_TYPE_DROPDOWN = 'dropdown';
const SEARCH_PARAMS_TO_KEEP = ['view', 'locale'];
const SEARCH_PARAMS = ['q', 'lq'];
const DEFAULT_CONTEXT = {
  marketplace_color1: styleVariables['--customColorFallback'],
  loggedInUsername: null,
};

const profileActions = function profileActions(routes, username) {
  return username ?
  {
    inboxAction: routes.person_inbox_path(username),
    profileAction: routes.person_path(username),
    settingsAction: routes.person_settings_path(username),
    adminDashboardAction: routes.admin_path(),
    logoutAction: routes.logout_path(),
    manageListingsAction: `${routes.person_path(username)}?show_closed=1`,
  } : null;
};

const avatarDropdownProps = (avatarDropdown, customColor, username, isAdmin, notificationCount, routes) => {
  const color = customColor || styleVariables['--customColorFallback'];
  const actions = {
    inboxAction: () => false,
    profileAction: () => false,
    settingsAction: () => false,
    adminDashboardAction: () => false,
    logoutAction: () => false,
    ...profileActions(routes, username),
  };
  const translations = {
    inbox: t('web.topbar.inbox'),
    profile: t('web.topbar.profile'),
    settings: t('web.topbar.settings'),
    adminDashboard: t('web.topbar.admin_dashboard'),
    logout: t('web.topbar.logout'),
  };
  return { actions, translations, customColor: color, isAdmin, notificationCount, ...avatarDropdown };
};

const mobileProfileLinks = function mobileProfileLinks(username, isAdmin, router, location, customColor, unReadMessagesCount) {
  if (username) {

    const profilePaths = profileActions(router, username);

    if (isAdmin) {
      links.unshift(
        formatLinkData(profilePaths.adminDashboardAction, location, customColor, t('web.topbar.admin_dashboard'))
      );
    }

    return links;
  }
  return [];
};


const parseKeepParams = urlUtils.currySearchParams(SEARCH_PARAMS_TO_KEEP);
const parseSearchParams = urlUtils.currySearchParams(SEARCH_PARAMS);
const isValidSearchParam = (value) => typeof value === 'number' && !isNaN(value) || !!value;
const createQuery = (searchParams, queryString) => {
  const extraParams = parseKeepParams(queryString);
  const params = { ...extraParams, ...searchParams };
  const paramKeys = Object.keys(params);

  // Sort params for caching
  paramKeys.sort();

  return paramKeys.reduce((url, key) => {
    const val = params[key];

    if (!isValidSearchParam(val)) {
      return url;
    }

    // For consistency with the Rails backend, use + to encode space
    // instead of %20.
    const encodedVal = encodeURIComponent(val).replace(/%20/g, '+');
    return `${url}${url ? '&' : '?'}${key}=${encodedVal}`;
  }, '');
};

class CenteringSearchbar extends Component {
  render() {
    const { location, marketplace_color1: marketplaceColor1 } = { ...DEFAULT_CONTEXT, ...this.props.marketplace };
    const { loggedInUsername } = this.props.user || {};
    const isAdmin = !!(this.props.user && this.props.user.isAdmin && loggedInUsername);

    const oldSearchParams = parseSearchParams(location);
    const searchPlaceholder = this.props.search ? this.props.search.search_placeholder : null;

    return div({ className: classNames('CenteringSearchbar', this.props.big_cover_photo ? css.CenteringSearchbarContainer : cssOnSmallCoverImage.CenteringSearchbarContainer) }, [
      

      this.props.search ?
        r(SearchBarOnCoverImage, {
          mode: this.props.search.mode,
          keywordPlaceholder: searchPlaceholder || t('web.topbar.search_placeholder'),
          locationPlaceholder: searchPlaceholder == null || this.props.search.mode === 'keyword_and_location' ? t('web.topbar.search_location_placeholder') : searchPlaceholder,
          keywordQuery: oldSearchParams.q,
          locationQuery: oldSearchParams.lq,
          customColor: marketplaceColor1,
          onSubmit: ({ keywordQuery, locationQuery, place, errorStatus }) => {
            const query = createQuery({
              q: keywordQuery,
              lq: locationQuery,
              lc: placesUtils.coordinates(place),
              boundingbox: placesUtils.viewport(place),
              distance_max: placesUtils.maxDistance(place),
              ls: errorStatus,
            }, location);
            const searchUrl = `${this.props.search_path}${query}`;
            window.location.assign(searchUrl);
          },
        }) :
        div({ className: this.props.big_cover_photo ? css.topbarMobileSearchPlaceholder : cssOnSmallCoverImage.topbarMobileSearchPlaceholder})
    ]);
  }
}

const { arrayOf, number, object, shape, string, bool } = PropTypes;

/* eslint-disable react/forbid-prop-types */
CenteringSearchbar.propTypes = {
  logo: object.isRequired,
  search: object,
  search_path: PropTypes.string.isRequired,
  avatarDropdown: object,
  menu: shape({
    limit_priority_links: number,
    links: arrayOf(shape({
      title: string.isRequired,
      link: string.isRequired,
      priority: number,
      external: bool,
    })),
  }),
  locales: PropTypes.shape({
    current_locale: string.isRequired,
    current_locale_ident: string.isRequired,
    available_locales: arrayOf(shape({
      locale_name: string.isRequired,
      locale_ident: string.isRequired,
      change_locale_uri: string.isRequired,
    })),
  }),
  newListingButton: object,
  routes: routesProp,
  marketplace: PropTypes.shape({
    marketplaceColor1: string,
    location: string,
  }),
  user: PropTypes.shape({
    loggedInUsername: string,
    isAdmin: PropTypes.bool,
  }),
  unReadMessagesCount: PropTypes.number,
};

export default CenteringSearchbar;
