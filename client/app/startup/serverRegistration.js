// Shows the mapping from the exported object to the name used by the server rendering.
import ReactOnRails from 'react-on-rails';

import OnboardingGuideApp from './OnboardingGuideApp';
import OnboardingTopBar from './OnboardingTopBarApp';
import TopbarApp from './TopbarApp';
import LandingTopbarApp from './LandingTopbarApp';
import SearchPageApp from './SearchPageApp';

ReactOnRails.register({
  OnboardingGuideApp,
  OnboardingTopBar,
  TopbarApp,
  LandingTopbarApp,
  SearchPageApp,
});

ReactOnRails.registerStore({
});
