import { render } from '@testing-library/react';

import Section from './section';

describe('Section', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Section title="Hello, World!">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      </Section>
    );
    expect(baseElement).toBeTruthy();
  });
});
