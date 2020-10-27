import styled from 'styled-components';

// Lists used for semantic meaning, not list styles
export const SemanticList = styled.ul`
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0;
  margin: 0;
`;

export const Button = styled.button``;

const headingSizes = {
  h1: 5,
  h2: 4,
  h3: 3,
  h4: 2.5,
  h5: 2,
  h6: 1.8,
  span: 3.2,
};

export const H = styled.h1`
  /* Default h1 */
  font-size: ${headingSizes.h1}rem;
  /* Overwrite if one is specified */
  font-size: ${({ as }) => as && `${headingSizes[as]}rem`};
  /* Visually override if need different font size vs the semantic element */
  font-size: ${({ looksLike }) => looksLike && `${headingSizes[looksLike]}rem`};
  overflow-wrap: break-word;
  hyphens: auto;
  a {
    text-decoration: none;
    box-shadow: none;
    &:hover,
    :focus {
      color: var(--primary);
      box-shadow: var(--link-underline);
    }
  }
`;

export const Text = styled.p`
  line-height: 1.7777778;
  font-size: 2rem;
  font-size: ${props => (props.large ? `1.5em` : `1em`)};
  strong,
  em {
    font-size: 2.1rem;
  }
  strong {
    font-weight: bold;
  }
  em {
    font-style: italic;
    font-weight: lighter;
  }
  @media (max-width: 500px) {
    font-size: ${props => (props.large ? `1.25em` : `1em`)};
  }
`;

export const OL = styled.ol`
  ul,
  ol {
    margin: 1.5rem;
  }
  li {
    margin-bottom: 1.5rem;
  }
`;

export const UL = styled.ul`
  ul,
  ol {
    margin: 1.5rem;
  }
  li {
    margin-bottom: 1.5rem;
  }
`;
