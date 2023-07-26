import { Divider, Heading, View } from '@adobe/react-spectrum';
import { ReactNode } from 'react';

export interface SectionProps {
  title: string;
  children: ReactNode;
}

export function Section({ title, children }: SectionProps) {
  return (
    <View marginBottom="size-200">
      <Heading id={title.toLowerCase()} level={2}>
        {title}
      </Heading>
      <Divider marginBottom="size-100" />
      {children}
    </View>
  );
}

export default Section;
