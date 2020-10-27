import { createGlobalStyle } from 'styled-components';
import { normalize } from 'styled-normalize';

const GlobalStyles = createGlobalStyle`
  ${normalize}

  :root {
    --black: #111111;
    --red: #ea3d2f;
    --green: #a9dc76;
    --yellow: #ffd866;
    --orange: #fc9867;
    --purple: #ab9df2;
    --blue: #78dce8;
    --white: #ffffff;
    --grey: #BDBBBD;
    --surface: var(--white);
    --text: var(--black);
    --shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    --border: 0.25rem solid var(--black);
    --sans-serif: 'Open Sans', sans-serif;
    --header-font: 'IBM Plex Sans', sans-serif;
    --primary: var(--red);
    --link-underline: inset 0 -0.07em 0 var(--primary);
    --link-underline-focus: inset 0 -10em 0 var(--primary);
    --link-transition: box-shadow 270ms cubic-bezier(0.77, 0, 0.175, 1),color 270ms cubic-bezier(0.77, 0, 0.175, 1);
  }

  *, *:before, *:after {
    box-sizing: inherit;
    /* Disable Animations for people who request it */
    @media (prefers-reduced-motion) {
      transition: none !important;
      animation: none !important;
    }
  }

  /* Highlighted Text Styles */
  ::selection {
    color: var(--black);
    /* Setting very little opacity because Chrome will apply their own if I don't */
    background: rgba(234, 61, 47, 0.99);
  }

  /* Scrollbar Styles */
  body::-webkit-scrollbar {
    width: 12px;
  }
  html {
    scrollbar-width: thin;
    scrollbar-color: var(--primary);
  }
  body::-webkit-scrollbar-track {
    background: transparent;
  }
  body::-webkit-scrollbar-thumb {
    background-color: var(--primary) ;
    border-radius: 6px;
    border: 3px solid var(--surface);
  }

  html {
    font-family: var(--sans-serif);
    box-sizing: border-box;
    font-size: 10px;
  }

  body {
    min-height: 100vh;
    font-size: 1.8rem;
    background-color: var(--surface);
    color: var(--text);
  }

  h1, h2, h3, h4, h5, h6 {
    font-family: var(--header-font);
    font-weight: normal;
    line-height: 1.5;
  }

  a {
    color: var(--primary);
    transition: var(--link-transition);
    box-shadow: var(--link-underline);
    text-decoration: none;
    &:hover, :focus {
      color: var(--black);
      box-shadow: var(--link-underline-focus);
    }
  }

  video {
    max-width: 100%;
  }
  img {
    max-width: 100%;
  }
`

export default GlobalStyles;
