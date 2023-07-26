import { Provider, defaultTheme } from '@adobe/react-spectrum';
import { render } from '@testing-library/react';

import Index from '../pages/index';

describe('Index', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Provider theme={defaultTheme}>
        <Index />
      </Provider>
    );
    expect(baseElement).toBeTruthy();
  });
});
