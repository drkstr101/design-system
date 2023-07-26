import { render } from '@testing-library/react';

import { Provider, defaultTheme } from '@adobe/react-spectrum';
import ReorderableListView from './reorderable-list-view';

describe('ReorderableListView', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Provider theme={defaultTheme}>
        <ReorderableListView />
      </Provider>
    );
    expect(baseElement).toBeTruthy();
  });
});
