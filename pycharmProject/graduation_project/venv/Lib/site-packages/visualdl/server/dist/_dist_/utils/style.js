let u=o=>o,b;import"../../web_modules/tippyjs/dist/tippy.css.proxy.js";import"../../web_modules/tippyjs/animations/shift-away-subtle.css.proxy.js";import"../../web_modules/react-toastify/dist/ReactToastify.css.proxy.js";import*as l from"../../web_modules/polished.js";import{colors as p,variables as f}from"./theme.js";import{createGlobalStyle as x,keyframes as g}from"../../web_modules/styled-components.js";import{css as y}from"../../web_modules/styled-components.js";export*from"../../web_modules/styled-components.js";export*from"../../web_modules/polished.js";export{borderRadius as borderRadiusShortHand,borderColor as borderColorShortHand,fontFace as fontFaceShortHand}from"../../web_modules/polished.js";const{math:m,size:i,normalize:v,transitions:$,border:k,position:c}=l,d="14px";export const rem=o=>l.rem(o,d),em=(o,r)=>l.em(o,r||d),half=o=>m(`(${o}) / 2`),headerHeight=rem(60),contentMargin=rem(20),contentHeight=`calc(100vh - ${m(`${contentMargin} * 2 + ${headerHeight}`)})`,asideWidth=rem(260),borderRadius="4px",progressSpinnerSize="20px",zIndexes={progress:99999,toast:9e4,tooltip:8e4,component:3e4,dialog:2e4,header:1e4},primaryColor=p.primary.default,primaryFocusedColor=p.primary.focused,primaryActiveColor=p.primary.active,duration="75ms",easing="ease-in",sameBorder=(o="1px",r="solid",n="var(--border-color)",e)=>{if(typeof o=="object"){var t,a,s;r=(t=o.type)!==null&&t!==void 0?t:"solid",n=(a=o.color)!==null&&a!==void 0?a:"var(--border-color)",e=o.radius===!0?borderRadius:o.radius,o=(s=o.width)!==null&&s!==void 0?s:"1px"}else o===!0&&(o="1px",e=!0);return Object.assign({},k(o,r,n),e?{borderRadius:e===!0?borderRadius:e}:void 0)},transitionProps=(o,r)=>{if(typeof o=="string"&&(o=[o]),typeof r!="string"){var n,e,t,a;r=`${(n=(e=r)===null||e===void 0?void 0:e.duration)!==null&&n!==void 0?n:duration} ${(t=(a=r)===null||a===void 0?void 0:a.easing)!==null&&t!==void 0?t:easing}`}return $(o,r)},link=y(["a{color:var(--primary-color);cursor:pointer;",";&:hover{color:var(--primary-focused-color);}&:active{color:var(--primary-active-color);}}"],transitionProps("color"));const h=g(["0%{transform:rotate(0deg);}100%{transform:rotate(360deg);}"]);export const GlobalStyle=x(b||(b=u`
    ${0}

    ${0}

    html {
        font-size: ${0};
        font-family: 'Merriweather Sans', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    html,
    body {
        min-height: 100%;
        background-color: var(--body-background-color);
        color: var(--text-color);
        ${0}
    }

    a {
        text-decoration: none;
        color: inherit;

        &:visited {
            color: currentColor;
        }
    }

    * {
        box-sizing: border-box;
    }

    #nprogress {
        pointer-events: none;
    }

    #nprogress .bar {
        background-color: var(--progress-bar-color);
        z-index: ${0};
        ${0}
        ${0}
        ${0}
    }

    #nprogress .peg {
        display: block;
        ${0}
        ${0}
        box-shadow: 0 0 rem(10) var(--progress-bar-color), 0 0 ${0} var(--progress-bar-color);
        opacity: 1;
        transform: rotate(3deg) translate(0px, -${0});
        ${0}
    }

    #nprogress .spinner {
        display: block;
        z-index: ${0};
        ${0}
    }

    #nprogress .spinner-icon {
        ${0}
        box-sizing: border-box;

        border: solid 2px transparent;
        border-top-color: var(--progress-bar-color);
        border-left-color: var(--progress-bar-color);
        border-radius: 50%;

        animation: ${0} 400ms linear infinite;

        ${0}
    }

    .nprogress-custom-parent {
        overflow: hidden;
        position: relative;
    }

    .nprogress-custom-parent #nprogress .spinner,
    .nprogress-custom-parent #nprogress .bar {
        position: absolute;
    }

    .Toastify__toast-container {
        z-index: ${0};

        .Toastify__toast {
            border-radius: ${0};
        }

        .Toastify__toast--default {
            color: var(--text-color);
            ${0}
        }

        .Toastify__toast-body {
            padding: 0 1.428571429em;
        }
    }

    [data-tippy-root] .tippy-box {
        z-index: ${0};
        color: var(--text-color);
        background-color: var(--background-color);
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        border-radius: ${0};
        ${0}

        > .tippy-content {
            padding: 0;
            /* trigger bfc */
            display: flow-root;
        }

        > .tippy-arrow {
            ${0}
        }

        &[data-placement^='top'] > .tippy-arrow::before {
            border-top-color: var(--background-color);
        }
        &[data-placement^='bottom'] > .tippy-arrow::before {
            border-bottom-color: var(--background-color);
        }
        &[data-placement^='left'] > .tippy-arrow::before {
            border-left-color: var(--background-color);
        }
        &[data-placement^='right'] > .tippy-arrow::before {
            border-right-color: var(--background-color);
        }

        &[data-theme~='tooltip'] {
            color: var(--tooltip-text-color);
            background-color: var(--tooltip-background-color);
            box-shadow: none;

            > .tippy-content {
                padding: ${0} ${0};
            }

            &[data-placement^='top'] > .tippy-arrow::before {
                border-top-color: var(--tooltip-background-color);
            }
            &[data-placement^='bottom'] > .tippy-arrow::before {
                border-bottom-color: var(--tooltip-background-color);
            }
            &[data-placement^='left'] > .tippy-arrow::before {
                border-left-color: var(--tooltip-background-color);
            }
            &[data-placement^='right'] > .tippy-arrow::before {
                border-right-color: var(--tooltip-background-color);
            }
        }
    }
`),v,f,d,transitionProps(["background-color","color"]),zIndexes.progress,c("fixed",0,null,null,0),i("2px","100%"),transitionProps("background-color"),c("absolute",null,0,null,null),i("100%",rem(100)),rem(5),rem(4),transitionProps("box-shadow"),zIndexes.progress,c("fixed",progressSpinnerSize,progressSpinnerSize,null,null),i(`calc(${half(headerHeight)} - ${half(progressSpinnerSize)})`),h,transitionProps("border-color"),zIndexes.toast,borderRadius,transitionProps("color"),zIndexes.tooltip,borderRadius,transitionProps(["color","background-color"]),transitionProps("border-color"),rem(5),rem(9));
