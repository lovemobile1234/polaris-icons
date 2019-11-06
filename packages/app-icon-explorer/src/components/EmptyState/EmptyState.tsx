import React from 'react';
import {Button, ButtonGroup, DisplayText, TextStyle} from '@shopify/polaris';
import styles from './EmptyState.module.scss';

export default function EmptyState() {
  return (
    <div className={styles.wrapper}>
      <div className={styles.content}>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 45 45">
          <path d="M29.78 31.9l-3.29-3.29a15 15 0 112.12-2.12l3.3 3.29.69-.7a1.98 1.98 0 012.8 0l7.02 7.01a1.99 1.99 0 010 2.81l-3.52 3.52a1.98 1.98 0 01-2.8 0l-7.02-7.01a1.99 1.99 0 010-2.81l.7-.7zM17 29a12 12 0 100-24 12 12 0 000 24zm22.6 8.5L34 31.9 31.9 34l5.6 5.6 2.1-2.1z" />
        </svg>
        <DisplayText size="small">No icons found</DisplayText>
        <p>
          <TextStyle variation="subdued">
            Open a GitHub issue to send us feedback. Shopify employees can also
            submit a request for a new icon.
          </TextStyle>
        </p>
        <div className={styles.buttonGroup}>
          <ButtonGroup>
            <Button url="https://github.com/Shopify/polaris-icons/issues/new/choose">
              Send feedback
            </Button>
            <Button url="https://forms.gle/nY446pDJQJB7pHxP6">
              Request icon
            </Button>
          </ButtonGroup>
        </div>
      </div>
    </div>
  );
}
