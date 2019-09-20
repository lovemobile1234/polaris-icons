import React, {useContext, useCallback} from 'react';
import classNames from 'classnames';
import {stringify as qsStringify} from 'query-string';
import {Caption, UnstyledLink, Icon} from '@shopify/polaris';
import {QueryParamsContext} from '../../AppFrame';
import {Icon as IconInterface} from '../../../types';
import styles from './SingleIcon.module.scss';

interface Props {
  icon: IconInterface;
  isActive: boolean;
}

export default function SingleIcon({icon, isActive = false}: Props) {
  const className = classNames({
    [styles.IconGridItem]: true,
    [styles.active]: isActive,
  });

  const trackLink = useCallback(() => {
    if ((window as any).gtag) {
      (window as any).gtag('event', 'select_icon', {
        /* eslint-disable-next-line babel/camelcase */
        event_category: 'icons',
        /* eslint-disable-next-line babel/camelcase */
        event_label: icon.metadataId,
      });
    }
  }, [icon.metadataId]);

  const queryParams = useContext(QueryParamsContext);
  const linkTo = `/?${qsStringify({icon: icon.metadataId, q: queryParams.q})}`;

  return (
    <UnstyledLink url={linkTo} className={className} onClick={trackLink}>
      <div
        className={styles.iconSvgWrapper}
        dangerouslySetInnerHTML={{
          __html: icon.styles.twotone
            ? icon.styles.twotone.svgContent.replace('#FFF', '#637381')
            : icon.styles.monotone.svgContent,
        }}
      />

      <div className={styles.iconLabel}>
        <Caption>{icon.name}</Caption>
      </div>
    </UnstyledLink>
  );
}
